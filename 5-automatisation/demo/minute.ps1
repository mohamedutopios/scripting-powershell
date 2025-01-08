# Nom de la tâche
$TaskName = "CreationFichierToutesLesMinutes"

# Définir le déclencheur (toutes les 1 minute)
$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1) -RepetitionDuration (New-TimeSpan -Days 31)

# Définir l'action (exécution d'un script pour créer un fichier)
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Users\Administrateur\Documents\scripting-powershell\5-automatisation\demo\CreerFichier.ps1"

# Enregistrer la tâche planifiée
try {
    Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -Action $Action -Description "Création d'un fichier toutes les 1 minute"
    Write-Output "Tâche $TaskName créée avec succès."
} catch {
    Write-Error "Erreur lors de la création de la tâche : $_"
}


