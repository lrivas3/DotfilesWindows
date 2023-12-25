# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons


# PSReadLine
#Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionViewStyle Listview
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistoristory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"
$env:XDG_CONFIG_HOME = "$HOME/.config"

# Alias
#Set-Alias -Name vim -Value nvim
Set-Alias ll ls
# Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias dokcer 'docker'
Set-Alias fig 'docker-compose'
#Set-Alias cat 'bat'
Set-Alias v 'nvim'
Set-Alias touch 'New-Item'
Set-Alias fm "C:\WINDOWS\explorer.exe ."

Set-Alias visual "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe"
# Git Related
Set-Alias g git


# Create random key

function gen-key {

    try {
        $bytes = New-Object byte[] 32

        [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($bytes)

        $key = [Convert]::ToBase64String($bytes)

        Write-Output $key
    }
    finally {
        # Ensure the cryptographic provider is disposed of properly
        [GC]::Collect()
        [GC]::WaitForPendingFinalizers()
        [System.GC]::KeepAlive($bytes)
    }
}

# GET DOCKER CONTAINER IP

function container-ip {
  param (
    [Parameter(Position=0,Mandatory=$true)][String[]]$containerid
  )
    $ip = docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerid
    Write-Output "Container: $containerid"
    Write-Output "Ip: $ip"
}

# que no chingue
#
function nochingue {

  $processes = Get-Process | Where-Object { $_.ProcessName -eq "WebCasosSiapp" -or $_.ProcessName -eq "WebSiapp" }

  if ($processes.Count -gt 0) {
      $processes | ForEach-Object { Stop-Process -Id $_.Id -Force }
      Write-Host ":) ID: $($processes.Id)"
  } else {
      Write-Host "No hay nada bro, tranquilo"
  }
}


# Utilities

function locate {

    Param(
        [Parameter(Position=0,Mandatory=$true)][String[]]$startlocation,
        [Parameter(Position=1,Mandatory=$true)][String[]]$filename
      )
      Get-ChildItem -Recurse $startlocation -Force -ErrorAction SilentlyContinue | Where-Object {$_ -like "$filename" } | Format-Wide 2>NUL
  }

function which ($command) {
                Get-Command -Name $Command -ErrorAction SilentlyContinue |
                Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
        }
function l () {
                Get-ChildItem|Format-Wide
        }

function all () {
                Get-ChildItem|Format-List *
        }
function la () {
                Get-ChildItem -Force
        }
function arbolito () {
                git log --all --graph --decorate --oneline
        }
        #displays branching in current Git project
function arbol () {
        git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
        }
function weather ($city) {

                curl "https://wttr.in/?0pq"
 }

# Convert PowerShell to batch

function Convert-PowerShellToBatch {

	param ([Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]

		[string]

		[Alias("FullName")]

		$Path
	)

	process {

		$encoded = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes((Get-Content -Path $Path -Raw -Encoding UTF8)))

		$newPath = [Io.Path]::ChangeExtension($Path, ".bat")

		"@echo off`npowershell.exe -NoExit -encodedCommand $encoded" | Set-Content -Path $newPath -Encoding Ascii

	}
}


function vimconf () {
  nvim ~\.config\nvim\
}
