Get-ChildItem -Recurse -Directory -Filter ".venv" | ForEach-Object {
    $venvPath = $_.FullName
    $projectPath = Split-Path $venvPath -Parent
    $projectName = Split-Path $projectPath -Leaf
    $parentName = Split-Path (Split-Path $projectPath -Parent) -Leaf

    $rawName = "$parentName-$projectName"
    $kernelName = $rawName -replace '[^a-zA-Z0-9._-]', '-'

    $displayName = "Python ($parentName > $projectName)"

    $pythonExe = Join-Path $venvPath "Scripts\python.exe"

    Write-Host "Registering kernel for $displayName"

    & $pythonExe -m ipykernel install --user --name $kernelName --display-name $displayName
}
