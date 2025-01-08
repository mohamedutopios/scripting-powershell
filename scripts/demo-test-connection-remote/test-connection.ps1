# Variables
$remoteComputer = "192.168.1.70"  # Adresse IP ou nom de la VM distante
$remoteUser = "WIN-79JIHNKCUUM\Administrateur"  # Compte utilisateur sur la machine distante
$password = Read-Host "Entrez le mot de passe pour $remoteUser" -AsSecureString
$credential = New-Object System.Management.Automation.PSCredential($remoteUser, $password)

# Test de connectivité avec la machine distante
if (Test-Connection -ComputerName $remoteComputer -Count 2 -Quiet) {
    Write-Host "Connexion réseau réussie avec $remoteComputer"
    
    # Récupérer la liste des services en cours d'exécution
    try {
        $services = Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock {
            Get-Service | Where-Object { $_.Status -eq 'Running' }
        }
        
        # Afficher les services
        Write-Host "Services en cours d'exécution sur $remoteComputer :"
        $services | ForEach-Object {
            Write-Host "$($_.DisplayName) - ($($_.Name))"
        }
    } catch {
        Write-Host "Une erreur s'est produite lors de la récupération des services : $_"
    }
} else {
    Write-Host "Impossible de se connecter au réseau de $remoteComputer"
}
