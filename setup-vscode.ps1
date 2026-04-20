Get-ChildItem -Recurse -Directory | Where-Object {
    Test-Path (Join-Path $_.FullName ".venv")
} | ForEach-Object {

    $vscodePath = Join-Path $_.FullName ".vscode"
    $settingsPath = Join-Path $vscodePath "settings.json"

    if (!(Test-Path $vscodePath)) {
        New-Item -ItemType Directory -Path $vscodePath | Out-Null
    }

    if (!(Test-Path $settingsPath)) {
        Write-Host "Creating settings.json in $($_.FullName)"

@"
{
  "python.defaultInterpreterPath": ".venv\\Scripts\\python.exe"
}
"@ | Out-File -Encoding utf8 $settingsPath
    }
}
