### TP PowerShell : Pipelines Complexes


### **Solutions**


#### **Exercice 1 : Analyse avancée des fichiers**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse -Filter *.log |
    Where-Object { $_.Length -gt 1MB } |
    Sort-Object -Property Length -Descending |
    Select-Object Name, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}, FullName |
    Export-Csv -Path "C:\TP_PowerShell\LargeLogs.csv" -NoTypeInformation
```

---

#### **Exercice 2 : Création et analyse d'un rapport de logs**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse -Filter *.log |
    Select-String -Pattern "Error" |
    Group-Object -Property Path |
    Select-Object Name, @{Name="Nombre d'erreurs"; Expression={$_.Group.Count}} |
    ConvertTo-Html -Property Name, @{Name="Dernière Modification"; Expression={(Get-Item $_.Name).LastWriteTime}}, @{Name="Taille (Ko)"; Expression={(Get-Item $_.Name).Length / 1KB}} |
    Out-File -FilePath "C:\TP_PowerShell\ErrorLogsReport.html"
```

---

#### **Exercice 3 : Organisation par groupe et suppression conditionnelle**
```powershell
# Regrouper par extension et calculer la taille
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse |
    Group-Object -Property Extension |
    Select-Object Name, Count, @{Name="Taille Totale (Mo)"; Expression={[math]::Round($_.Group | Measure-Object -Property Length -Sum).Sum / 1MB, 2}}

# Supprimer les fichiers `.tmp` ou de moins de 500 Ko
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse |
    Where-Object { $_.Extension -eq ".tmp" -or $_.Length -lt 500KB } |
    Remove-Item
```

---

#### **Exercice 4 : Analyse temporelle et transformation**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse |
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-15) } |
    Sort-Object -Property LastWriteTime |
    Select-Object @{Name="Nom (Majuscules)"; Expression={$_.Name.ToUpper()}}, LastWriteTime |
    Export-Csv -Path "C:\TP_PowerShell\RecentLogs.csv" -NoTypeInformation
```

---

#### **Exercice 5 : Fusion et analyse de fichiers**
```powershell
# Fusionner tous les fichiers `.log`
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse -Filter *.log |
    Get-Content |
    Set-Content -Path "C:\TP_PowerShell\CombinedLogs.log"

# Rechercher toutes les lignes contenant "Warning"
Select-String -Path "C:\TP_PowerShell\CombinedLogs.log" -Pattern "Warning" |
    Measure-Object |
    Set-Content -Path "C:\TP_PowerShell\WarningsCount.txt"
```

---

#### **Exercice 6 : Création d'un tableau HTML dynamique**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse -Filter *.log |
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-30) } |
    Select-Object Name, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}, FullName, LastWriteTime |
    ConvertTo-Html -Property Name, "Taille (Ko)", FullName, LastWriteTime |
    Out-File -Path "C:\TP_PowerShell\LogSummary.html"
```

---

### **Explications**
- **Pipeline dynamique** : Chaque exercice combine plusieurs cmdlets pour transformer et manipuler les données en temps réel.
- **Cmdlets clés utilisées** :
  - `Where-Object`, `Sort-Object`, `Select-Object`, `Group-Object`, `Export-Csv`, `ConvertTo-Html`.
- **Usage avancé des pipelines** : Les pipelines ici permettent des calculs, des tris, des sélections conditionnelles et des exports complexes.