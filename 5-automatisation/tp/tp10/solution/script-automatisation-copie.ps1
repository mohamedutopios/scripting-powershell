function CopierRenommerSupprimer {
    param (
        [string]$Source,
        [string]$Destination,
        [string]$NouveauNom
    )
    try {
        if (-Not (Test-Path $Source)) {
            throw "Le fichier source $Source n'existe pas."
        }

        Copy-Item -Path $Source -Destination $Destination
        Rename-Item -Path (Join-Path $Destination (Split-Path $Source -Leaf)) -NewName $NouveauNom
        Remove-Item -Path $Source

        Write-Output "Fichier copié, renommé et supprimé avec succès."
    } catch {
        Write-Output "Erreur : $_"
    } finally {
        Write-Output "Nettoyage terminé."
    }
}

# Exemple d'utilisation
#CopierRenommerSupprimer -Source "C:\Temp\source.txt" -Destination "C:\Temp\Backup" -NouveauNom "renommé.txt"