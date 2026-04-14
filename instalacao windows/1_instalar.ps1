# pasta atual
$pastaAtual = (Get-Location).Path
#pasta de instalacao
$pastaInstalacao = "c:\dev"
# pasta do claw-code
$pastaClaw =  "$pastaInstalacao\claw-code"
# caminho completo do executavel
$clawPath = "$pastaClaw\rust\target\debug\"
# pasta onde estao os fontes do protheus
$pastaProtheus ="c:\dev\protheus\"

# se a pasta existe
if (Test-Path $pastaClaw) {
	# apaga a pasta
    Remove-Item $pastaClaw -Recurse -Force
}

# cria a pasta se nao existir
New-Item -ItemType Directory -Path $pastaClaw -Force | Out-Null
# clona o projeto oficial
git clone --depth 1 --branch main https://github.com/ultraworkers/claw-code.git $pastaClaw

# abra a pasta do projeto
cd "$pastaClaw\rust\"

# compila os executaveis
cargo build --workspace 

# chama funcao para carregar variaveis de ambiente
Invoke-Expression "$pastaAtual\carregar_ambiente.ps1"

# posiciona na pasta de fontes do protheus
cd $pastaProtheus
# Adiciona ao PATH do seu usuário

# obtem dados do path do usuario
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
# se nao ja esta no parh
if (!($currentPath -like "*$clawPath*")) {
	# adiciona o caminho da pasta no path
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$clawPath", "User")
	# adiciona o caminho da pasta ao path em execucao
    $env:Path += ";$clawPath"
	# exibe msg 
    Write-Host "Executavel claw.exe adicionado ao Path do usuario." -ForegroundColor Green
}

# exeuta "claw.exe doctor'
Start-Process -FilePath "claw.exe" -ArgumentList "doctor" -NoNewWindow -Wait

Write-Host "Instalação finalizada."

