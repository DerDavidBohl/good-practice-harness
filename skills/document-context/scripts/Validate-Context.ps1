param(
    [string]$ContextDir = "context",
    [string[]]$AdditionalIdPrefixes = @()
)

$errors = [System.Collections.Generic.List[string]]::new()

function Add-ValidationError([string]$Message) {
    $errors.Add("ERROR: $Message")
}

if (-not (Test-Path -LiteralPath $ContextDir -PathType Container)) {
    Add-ValidationError "missing context directory: $ContextDir"
    $errors | Write-Output
    exit 1
}

$rootReadme = Join-Path $ContextDir "README.md"
if (-not (Test-Path -LiteralPath $rootReadme -PathType Leaf)) {
    Add-ValidationError "missing context README: $rootReadme"
}

$idPrefixes = @('REQ', 'ADR', 'COD', 'QUA', 'SEC', 'UX', 'CLR')
foreach ($additionalIdPrefix in $AdditionalIdPrefixes) {
    if ($additionalIdPrefix -notmatch '^[A-Z][A-Z0-9]*$') {
        Write-Output "ERROR: invalid additional ID prefix: $additionalIdPrefix"
        exit 1
    }
    if ($additionalIdPrefix -notin $idPrefixes) {
        $idPrefixes += $additionalIdPrefix
    }
}
$prefixPattern = ($idPrefixes | ForEach-Object { [regex]::Escape($_) }) -join '|'
$recordPattern = "(?:$prefixPattern)-[0-9]{3}"
$recordDefinitionPattern = "\*\*ID:\s*(?<Id>$recordPattern)\*\*"

function Get-RecordIds([string]$Path, [bool]$IncludeTableRecords = $true) {
    $content = Get-Content -LiteralPath $Path
    foreach ($line in $content) {
        foreach ($match in [regex]::Matches($line, $recordDefinitionPattern)) {
            $match.Groups['Id'].Value
        }
    }

    if (-not $IncludeTableRecords) {
        return
    }

    $headerColumn = -1
    foreach ($line in $content) {
        if ($line -notmatch '^\s*\|') {
            $headerColumn = -1
            continue
        }

        $cells = $line.Split('|') | ForEach-Object { $_.Trim().Trim('`') }
        if ($headerColumn -lt 0) {
            $headerColumn = [Array]::IndexOf($cells, 'ID')
            continue
        }

        if ($headerColumn -ge 0 -and $headerColumn -lt $cells.Count -and $cells[$headerColumn] -match "^$recordPattern$") {
            $cells[$headerColumn]
        }
    }
}

$readmeFiles = Get-ChildItem -LiteralPath $ContextDir -Recurse -File -Filter "README.md"
foreach ($readme in $readmeFiles) {
    if (@(Get-RecordIds $readme.FullName $false).Count -gt 0) {
        Add-ValidationError "README contains a context record ID: $($readme.FullName)"
    }
}

$recordFiles = Get-ChildItem -LiteralPath $ContextDir -Recurse -File -Filter "*.md" | Where-Object {
    $_.Name -ne "README.md" -and $_.Name -ne "TEMPLATE.md"
}
$records = @{}

foreach ($file in $recordFiles) {
    $recordIds = @(Get-RecordIds $file.FullName | Sort-Object)
    if ($recordIds.Count -eq 0) {
        Add-ValidationError "record file has no context record ID: $($file.FullName)"
        continue
    }
    foreach ($recordId in $recordIds) {
        if ($records.ContainsKey($recordId)) {
            Add-ValidationError "duplicate record ID ${recordId}: $($records[$recordId]) and $($file.FullName)"
        } else {
            $records[$recordId] = $file.FullName
        }
    }
}

$markdownFiles = Get-ChildItem -LiteralPath $ContextDir -Recurse -File -Filter "*.md"
foreach ($sourceFile in $markdownFiles) {
    $content = Get-Content -LiteralPath $sourceFile.FullName -Raw
    foreach ($match in [regex]::Matches($content, '\[[^\]]*\]\(([^)]*)\)')) {
        $target = ($match.Groups[1].Value -split '\s+', 2)[0].Trim([char[]]@('<', '>'))
        if ($target -match '^(https?://|mailto:)') {
            continue
        }

        $targetParts = $target -split '#', 2
        $relativePath = $targetParts[0]
        $fragment = if ($targetParts.Count -gt 1) { $targetParts[1] } else { '' }
        $targetPath = if ($relativePath) {
            Join-Path $sourceFile.DirectoryName $relativePath
        } else {
            $sourceFile.FullName
        }

        if (-not (Test-Path -LiteralPath $targetPath -PathType Leaf)) {
            Add-ValidationError "missing context link target in $($sourceFile.FullName): $relativePath"
            continue
        }

        if ($fragment) {
            $headingFound = $false
            foreach ($heading in (Get-Content -LiteralPath $targetPath | Where-Object { $_ -match '^#{1,6}\s+' })) {
                $slug = $heading -replace '^#+\s*', ''
                $slug = $slug -replace '`', ''
                $slug = $slug.ToLowerInvariant() -replace '[^a-z0-9_ -]', ''
                $slug = $slug -replace '\s+', '-' -replace '-+', '-'
                $slug = $slug.Trim('-')
                if ($slug -eq $fragment) {
                    $headingFound = $true
                    break
                }
            }
            if (-not $headingFound) {
                Add-ValidationError "missing context link anchor in $($sourceFile.FullName): $relativePath#$fragment"
            }
        }
    }
}

Get-ChildItem -LiteralPath $ContextDir -Directory | ForEach-Object {
    $readme = Join-Path $_.FullName "README.md"
    $template = Join-Path $_.FullName "TEMPLATE.md"
    if (-not (Test-Path -LiteralPath $readme -PathType Leaf)) {
        Add-ValidationError "missing context README: $readme"
    }
    if (-not (Test-Path -LiteralPath $template -PathType Leaf)) {
        Add-ValidationError "missing context template: $template"
    }
}

if ($errors.Count -gt 0) {
    $errors | Write-Output
    exit 1
}

Write-Output "Context structure validation passed: $ContextDir"
