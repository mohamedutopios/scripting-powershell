# Variables pour la machine distante
$remoteComputer = "192.168.1.56"  # Adresse IP ou nom de la machine distante
$remoteUser = "WIN-79JIHNKCUUM\Administrateur"
$password = Read-Host "Entrez le mot de passe pour $remoteUser" -AsSecureString
$credential = New-Object System.Management.Automation.PSCredential($remoteUser, $password)

# Script à exécuter sur la machine distante
$remoteScript = {
    # Variables pour l'utilisateur
    $username = "NewUser"
    $userPassword = ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force
    $fullName = "Nouvel Utilisateur"
    $description = "Compte créé pour une nouvelle session"

    # Étape 1 : Création de l'utilisateur local
    if (-Not (Get-LocalUser -Name $username -ErrorAction SilentlyContinue)) {
        Write-Host "Création de l'utilisateur local $username..."
        New-LocalUser -Name $username -Password $userPassword -FullName $fullName -Description $description
        Add-LocalGroupMember -Group "Administrators" -Member $username
        Write-Host "Utilisateur $username créé avec succès et ajouté au groupe Administrators."
    } else {
        Write-Host "L'utilisateur $username existe déjà."
    }

    # Étape 2 : Téléchargement et installation de Microsoft Teams
    Write-Host "Téléchargement et installation de Microsoft Teams..."
    $teamsInstallerUrl = "https://aka.ms/teams"
    $teamsInstallerPath = "$env:TEMP\TeamsInstaller.exe"

    Invoke-WebRequest -Uri $teamsInstallerUrl -OutFile $teamsInstallerPath
    if (Test-Path $teamsInstallerPath) {
        Write-Host "Fichier Teams téléchargé. Démarrage de l'installation..."
        Start-Process -FilePath $teamsInstallerPath -ArgumentList "/silent /install" -Wait
        Write-Host "Microsoft Teams installé avec succès."
        Remove-Item -Path $teamsInstallerPath -Force
    } else {
        Write-Error "Échec du téléchargement de Microsoft Teams."
    }

    # Étape 3 : Installation d'autres programmes via Chocolatey
    Write-Host "Installation de Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    
    Write-Host "Installation des programmes supplémentaires..."
    choco install -y googlechrome
    choco install -y notepadplusplus
    choco install -y vscode

    Write-Host "Programmes installés : Google Chrome, Notepad++, Visual Studio Code."

    # Étape 4 : Vérification et confirmation
    Write-Host "Vérifications finales..."
    if (Get-Command "Teams.exe" -ErrorAction SilentlyContinue) {
        Write-Host "Microsoft Teams est prêt à l'utilisation."
    } else {
        Write-Error "Microsoft Teams n'est pas correctement installé."
    }

    Write-Host "Opérations terminées avec succès."
}

# Exécution du script sur la machine distante
Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock $remoteScript
