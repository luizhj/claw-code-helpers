# pasta atual
$pastaAtual = "c:\dev\" #(Get-Location).Path
# pasta do claw-code
$pastaClaw =  "$pastaAtual\claw-code"
# caminho completo do executavel
$clawPath = "$pastaClaw\rust\target\debug\"

if (Test-Path $pastaClaw) {
	# apaga a pasta
    Remove-Item $pastaClaw -Recurse -Force
}

# Obter PATH atual
$pathAtual = [Environment]::GetEnvironmentVariable("Path", "User")
# Verificar se existe
if ($pathAtual -like "*$clawPath*") {
	# Remover o caminho
    $caminhos = $pathAtual -split ";" | Where-Object { $_ -ne $clawPath }
    $novoPath = $caminhos -join ";"
    
    # Salvar
    [Environment]::SetEnvironmentVariable("Path", $novoPath, "User")
}

# Obter PATH em execucao
$pathAtual = $env:Path
# Verificar se existe
if ($pathAtual -like "*$clawPath*") {
	# Remover o caminho
    $caminhos = $pathAtual -split ";" | Where-Object { $_ -ne $clawPath }
    $novoPath = $caminhos -join ";"
    
    # Atualizar sessão atual
    $env:Path = $novoPath
    
}

Write-Host "Remoção finalizada"