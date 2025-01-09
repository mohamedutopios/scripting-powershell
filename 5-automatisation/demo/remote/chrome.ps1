# Variables
$remoteComputer = "192.168.1.79"  # Nom ou IP de la machine distante
$adminUser = "Administrator"              # Nom d'utilisateur administrateur de la machine distante
$adminPassword = "password"           # Mot de passe de l'administrateur

# Création des informations d'identification
$securePassword = ConvertTo-SecureString $adminPassword -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($adminUser, $securePassword)

# Commande pour télécharger et installer Google Chrome
$chromeInstallerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$installCommand = @"
Invoke-WebRequest -Uri '$chromeInstallerUrl' -OutFile 'C:\Windows\Temp\chrome_installer.exe'; 
Start-Process -FilePath 'C:\Windows\Temp\chrome_installer.exe' -ArgumentList '/silent /install' -Wait; 
Remove-Item -Path 'C:\Windows\Temp\chrome_installer.exe' -Force
"@

# Exécution sur la machine distante
try {
    Write-Output "Connexion à la machine distante $remoteComputer..."
    Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock {
        param ($script)
        Invoke-Expression $script
    } -ArgumentList $installCommand
    Write-Output "Installation de Google Chrome terminée avec succès sur $remoteComputer."
} catch {
    Write-Output "Échec de l'installation de Google Chrome : $_"
}
