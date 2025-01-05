### TP PowerShell : Pipelines Complexes pour la Gestion de Fichiers et Données

---

### **Énoncé**

#### **Exercice 1 : Analyse avancée des fichiers**
1. Listez tous les fichiers dans `C:\TP_PowerShell\LogFiles_Backup`.
2. Filtrez uniquement les fichiers `.log` dont la taille dépasse 1 Mo.
3. Affichez leurs **noms**, **tailles (en Ko)**, et **chemins complets**, triés par taille décroissante.
4. Exportez ces informations dans un fichier CSV `LargeLogs.csv`.

---

#### **Exercice 2 : Création et analyse d'un rapport de logs**
1. Recherchez récursivement tous les fichiers `.log` dans `C:\TP_PowerShell\LogFiles_Backup`.
2. Comptez combien de fichiers contiennent le mot *Error*.
3. Générez un rapport HTML contenant les fichiers trouvés, avec les colonnes :
   - **Nom**
   - **Chemin complet**
   - **Dernière modification**
   - **Taille (Ko)**

---

#### **Exercice 3 : Organisation par groupe et suppression conditionnelle**
1. Regroupez tous les fichiers dans `C:\TP_PowerShell\LogFiles_Backup` par extension.
2. Affichez pour chaque extension :
   - Le nombre total de fichiers.
   - La taille cumulée de ces fichiers (en Mo).
3. Supprimez les fichiers `.tmp` ou ceux de moins de 500 Ko.

---

#### **Exercice 4 : Analyse temporelle et transformation**
1. Recherchez tous les fichiers dans `C:\TP_PowerShell\LogFiles_Backup` modifiés dans les 15 derniers jours.
2. Affichez leurs **noms** transformés en majuscules, triés par date de dernière modification.
3. Exportez ces données dans un fichier CSV `RecentLogs.csv`.

---

#### **Exercice 5 : Fusion et analyse de fichiers**
1. Fusionnez tous les fichiers `.log` de `C:\TP_PowerShell\LogFiles_Backup` en un seul fichier `CombinedLogs.log`.
2. Recherchez dans ce fichier toutes les lignes contenant le mot *Warning*.
3. Comptez le nombre d'occurrences de *Warning* et exportez le résultat dans un fichier texte `WarningsCount.txt`.

---

#### **Exercice 6 : Création d'un tableau HTML dynamique**
1. Créez un tableau HTML listant tous les fichiers `.log` modifiés dans les 30 derniers jours.
2. Ajoutez les colonnes suivantes :
   - **Nom**
   - **Taille (Ko)**
   - **Chemin complet**
   - **Date de dernière modification**
3. Sauvegardez ce tableau dans `LogSummary.html`.

---

### **Solutions**

---

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