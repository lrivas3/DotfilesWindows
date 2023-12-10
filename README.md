
# Windows Dotfiles :fish_cake::fire:

My dotfiles and configurations on Windows :shipit:

> [!WARNING]   
> Estas configuraciones estás basadas en mi uso diario del sistema. Algunas herramientas podrían no resultar utiles para ti.



## Installation 

### Global Basic config

1. **Winget**

- Install or update winget. 

    It is a good idea to install or update winget after a windows fresh install.


    Visit: [the offficial store page for the package installer (Winget)](https://apps.microsoft.com/detail/9NBLGGH4NNS1?rtc=1&hl=en-us&gl=US#activetab=pivot:overviewtab)

- Restore the packages from the `winget-apps.json`

  1. Opena a powershell terminal in with admin privileges
  2. Run the following command inside the folder that contains the file `winget-apps.json`

  ```powershell
  winget import -i .\applist-winget --ignore-unavailable --ignore-versions --accept-package-agreements --accept-source-agreements
  ```


2. **Powershell**
- Allow non signed scripts execution in powershell:

  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

- Set Config file path to `.config\powershell\user_profile.ps1`

  Create a default profile config file with the command:

  ```powershell
  nvim $profile.CurrentUserCurrentHost
  ```

  and set a the path to this config file as en environment variable:

  ```powershell
  . $env:USERPROFILE\.config\powershell\user_profile.ps1
  ```


### Install Powershell Modules

To install the necessary powershell modules run:

```powershell
# posh-git for git status summary
Install-Module posh-git -Scope CurrentUser -Force

# fzf
Install-Module -Name PSFzf -Scope CurrentUser -Force

# PSReadLine
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

# Z jumper
Install-Module -Name Z -Force

# Terminal Icons
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
```


### Scoop

To install Scoop run the command:

```powerhsell
iwr -useb get.scoop.sh | iex
```
Install Scoop Apps:

Restore the packages inside of `scoop-apps.json` with the command:

```powershell
scoop import .\scoop-apps.json
```

Refer to the docs at: [scoop](https://scoop.sh/)


### WSL :penguin: 

Refer to the docs: [Microsoft Wsl docs](https://learn.microsoft.com/en-us/windows/wsl/install)

1. **Install WSL**

    Run this command to enable the WSL feature:

    ```powershell
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    ```
    and then restart the system.

    - Set the WSL Version to WSL 2 

    ```powershell
    wsl --set-version 2
    ```

    - Install a distribution

    To know tha list of available distros run:

    ```powershell
    winget --list -o
    ```
    to install a specific distro run:

    ```powershell
    wsl --install -d "Name of the distro"
    ```

### Move the config files to the right location

1. Powershell config file

create the folder for the config:

```powershell
mkdir ~\.config\powershell
```

move the file `user_profile.ps1` inside of the powershell folder on this repo to the route:

```powershell
cp .\poweshell\user_profile.ps1 ~\.config\powershell\
```
copy the oh-my-posh theme file to the same route

```powershell
cp .\poweshell\takuya.omp.json ~\.config\powershell\
```

2. WSL config file

```
cp .wslconfig ~\
```

3. gitconfig file


```
cp .gitconfig ~\
```
