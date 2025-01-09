# Chemin vers le script de sauvegarde
$backupScriptPath = "C:\Users\mohamed\Downloads\scripting-powershell\5-automatisation\demo\back-up-mysql.ps1"

# Nom de la tâche planifiée
$taskName = "Backup MySQL"

# Description de la tâche
$taskDescription = "Sauvegarde automatique de la base de données MySQL tous les lundis à 6h00"

# Configuration du déclencheur (lundi à 6h00)
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Wednesday -At 23:20

# Configuration de l'action (exécution du script PowerShell)
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$backupScriptPath`" > `"$backupDir\backup-task-log.txt`" 2>&1"


# Définition des paramètres (exécuter avec des droits élevés)
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest


# Supprimer la tâche existante si elle existe
if (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Création de la tâche planifiée
Register-ScheduledTask -TaskName $taskName -Description $taskDescription -Trigger $trigger -Action $action -Principal $principal

Write-Output "Tâche planifiée '$taskName' créée avec succès pour exécuter le script '$backupScriptPath' tous les lundis à 6h00."
