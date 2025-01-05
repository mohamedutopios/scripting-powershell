### TP PowerShell : Opérations centrées sur les Pipelines 


### **Solutions**

---

#### **1. Copier un dossier source vers un répertoire de travail**
```powershell
Copy-Item -Path "C:\Windows\System32\LogFiles" -Destination "test3\LogFiles_Backup" -Recurse -ErrorAction SilentlyContinue
```

---

#### **2. Lister les fichiers avec des propriétés spécifiques**
```powershell
Get-ChildItem -Path "test3\LogFiles_Backup" -Recurse |
    Select-Object Name, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}, LastWriteTime
```

---

#### **3. Rechercher des fichiers volumineux**
```powershell
Get-ChildItem -Path "test3\LogFiles_Backup" -Recurse -Filter *.log |
    Where-Object { $_.Length -gt 500KB } |
    Sort-Object -Property Length -Descending |
    Select-Object Name, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}
```

---

#### **4. Comptabiliser les fichiers par type**
```powershell
Get-ChildItem -Path "test3\LogFiles_Backup" -Recurse |
    Group-Object -Property Extension |
    Select-Object Name, Count
```

---

#### **5. Calculer la taille totale du dossier**
```powershell
(Get-ChildItem -Path "test3\LogFiles_Backup" -Recurse |
    Measure-Object -Property Length -Sum).Sum / 1MB
```

---

#### **6. Analyser les fichiers récents**
```powershell
Get-ChildItem -Path "test3\LogFiles_Backup" -Recurse |
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) } |
    Select-Object FullName, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}
```

---

#### **7. Transformer les noms des fichiers**
```powershell
Get-ChildItem -Path "test3\LogFiles_Backup" -Recurse |
    Select-Object @{Name="Nom en majuscules"; Expression={$_.Name.ToUpper()}} |
    Sort-Object "Nom en majuscules"
```

---

#### **8. Extraire les 10 plus anciens fichiers**
```powershell
Get-ChildItem -Path "test3\LogFiles_Backup" -Recurse |
    Sort-Object -Property CreationTime |
    Select-Object -First 10 Name, FullName, CreationTime
```

---

#### **9. Créer un rapport HTML des fichiers**
```powershell
Get-ChildItem -Path "test3\LogFiles_Backup" -Recurse -Filter *.log |
    Select-Object Name, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}, LastWriteTime |
    ConvertTo-Html -Property Name, "Taille (Ko)", LastWriteTime |
    Out-File -FilePath "test3\LogFilesReport.html"
```

