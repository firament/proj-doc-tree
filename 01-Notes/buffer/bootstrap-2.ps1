<#
.SYNOPSIS
    Replicates the directory structure from an input directory to an output directory.
.DESCRIPTION
    This script takes an input directory and an output directory as parameters.
    It validates the existence of the input directory and ensures the output directory exists and is empty.
    If the output directory does not exist, it creates one.
    The script then iterates through the input directory and its subdirectories,
    copying markdown (.md) and SQL script (.sql) files line by line, and other files as binary.
.PARAMETER InputDir
    The path to the input directory.
.PARAMETER OutputDir
    The path to the output directory.
.EXAMPLE
    .\ReplicateDirectory.ps1 -InputDir "C:\Input" -OutputDir "C:\Output"
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$InputDir,

    [Parameter(Mandatory=$true)]
    [string]$OutputDir
)

function Show-Help {
    Get-Help -Name $MyInvocation.MyCommand.Name -Full
}

if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('help')) {
    Show-Help
    exit
}

$errors = @()

# Validate input directory
if (-Not (Test-Path -Path $InputDir -PathType Container)) {
    $errors += "Input directory '$InputDir' does not exist."
}

# Validate or create output directory
if (Test-Path -Path $OutputDir -PathType Container) {
    if (Get-ChildItem -Path $OutputDir) {
        $errors += "Output directory '$OutputDir' is not empty."
    }
} else {
    try {
        New-Item -Path $OutputDir -ItemType Directory -Force
    } catch {
        $errors += "Failed to create output directory '$OutputDir'."
    }
}

# Exit if there are any errors
if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

# Function to copy files
function Copy-File {
    param (
        [string]$SourcePath,
        [string]$DestinationPath
    )

    $extension = [System.IO.Path]::GetExtension($SourcePath).ToLower()
    if ($extension -eq ".md" -or $extension -eq ".sql") {
        Get-Content -Path $SourcePath | Set-Content -Path $DestinationPath
    } else {
        Copy-Item -Path $SourcePath -Destination $DestinationPath -Force
    }
}

# Replicate directory structure and copy files
Get-ChildItem -Path $InputDir -Recurse | ForEach-Object {
    $relativePath = $_.FullName.Substring($InputDir.Length)
    $destinationPath = Join-Path -Path $OutputDir -ChildPath $relativePath

    if ($_.PSIsContainer) {
        New-Item -Path $destinationPath -ItemType Directory -Force
    } else {
        Copy-File -SourcePath $_.FullName -DestinationPath $destinationPath
    }
}

Write-Output "Directory structure replicated successfully."
