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
    $recordIds = @(Get-RecordIds $file.FullName | Sort-Object -Unique)
    if ($recordIds.Count -eq 0) {
        Add-ValidationError "record file has no context record ID: $($file.FullName)"
        continue
    }
    foreach ($recordId in $recordIds) {
        if ($records.ContainsKey($recordId) -and $records[$recordId] -ne $file.FullName) {
            Add-ValidationError "duplicate record ID ${recordId}: $($records[$recordId]) and $($file.FullName)"
        } else {
            $records[$recordId] = $file.FullName
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
