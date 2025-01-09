# Nom de la tâche
$TaskName = "OrganiserBureau"

# Déclencheur : toutes les 5 minutes
$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 5) -RepetitionDuration (New-TimeSpan -Days 1)

# Action : exécution du script
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -File C:\Scripts\OrganiserBureau.ps1"

# Créer la tâche planifiée avec des autorisations élevées
Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -Action $Action -Description "Organise le bureau toutes les 5 minutes" -RunLevel Highest

Write-Output "Tâche planifiée $TaskName créée avec succès."
