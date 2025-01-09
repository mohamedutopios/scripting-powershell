function GererService {
    param (
        [string]$NomService
    )
    try {
        $etat = Get-Service -Name $NomService
        if ($etat.Status -ne "Running") {
            Write-Output "Le service $NomService est arrêté. Redémarrage en cours..."
            Start-Service -Name $NomService
            Write-Output "Le service $NomService a été redémarré avec succès."
        } else {
            Write-Output "Le service $NomService est déjà en cours d'exécution."
        }
    } catch {
        Write-Output "Erreur : Impossible de gérer le service $NomService. $_"
    }
}

# Exemple d'utilisation
#GererService -NomService "Spooler"