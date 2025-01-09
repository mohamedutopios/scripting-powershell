# Paramètres de la sauvegarde
$mysqlHost = "localhost" # Adresse du serveur MySQL
$mysqlPort = "3306"      # Port MySQL par défaut
$mysqlUser = "root"      # Nom d'utilisateur MySQL
$mysqlPassword = "" # Mot de passe MySQL
$databaseName = "demo"  # Nom de la base à sauvegarder

# Chemin où les backups seront stockés
$backupDir = "C:\backups\mysql"
if (!(Test-Path -Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir
}

# Générer le nom du fichier de backup (ex : mydatabase_2025-01-08.sql)
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupFileName = "${databaseName}_${date}.sql"
$backupFilePath = Join-Path -Path $backupDir -ChildPath $backupFileName

# Commande mysqldump
$mysqldumpCommand = "mysqldump --host=$mysqlHost --port=$mysqlPort --user=$mysqlUser --password=$mysqlPassword $databaseName > `"$backupFilePath`""

# Exécuter la commande
try {
    Write-Output "Début de la sauvegarde..."
    Invoke-Expression $mysqldumpCommand
    Write-Output "La sauvegarde a été effectuée avec succès : $backupFilePath"
} catch {
    Write-Output "Erreur lors de la sauvegarde : $_"
}

# Supprimer les backups plus anciens que 30 jours (optionnel)
Get-ChildItem -Path $backupDir -Filter "*.sql" | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force

Write-Output "Nettoyage terminé. Les anciens fichiers de sauvegarde ont été supprimés."
