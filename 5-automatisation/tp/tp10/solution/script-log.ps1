function GererLogs {
    param (
        [string]$FichierLog,
        [string]$Action,
        [string]$Message
    )
    try {
        switch ($Action) {
            "Ajouter" {
                $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                "$timestamp : $Message" | Add-Content -Path $FichierLog
            }
            "Lire" {
                Get-Content -Path $FichierLog
            }
            "Nettoyer" {
                $dateLimite = (Get-Date).AddDays(-7)
                $contenu = Get-Content -Path $FichierLog | Where-Object { ($_ -match "^\d{4}-\d{2}-\d{2}") -and ([datetime]($_ -split " ")[0]) -gt $dateLimite }
                $contenu | Set-Content -Path $FichierLog
            }
        }
    } catch {
        Write-Output "Erreur : $_"
    }
}

# Exemple d'utilisation
#GererLogs -FichierLog "C:\Temp\app.log" -Action "Ajouter" -Message "Log initial."
#GererLogs -FichierLog "C:\Temp\app.log" -Action "Lire"
#GererLogs -FichierLog "C:\Temp\app.log" -Action "Nettoyer"