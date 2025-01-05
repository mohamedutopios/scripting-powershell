Voici une série de démonstrations variées sur la gestion de fichiers avec PowerShell. Ces exemples couvrent un large éventail de scénarios pratiques.

---

### **1. Créer un fichier**
Créer un fichier vide ou contenant du texte.

```powershell
# Créer un fichier vide
New-Item -Path "C:\Demo\example.txt" -ItemType File

# Créer un fichier avec du texte
Set-Content -Path "C:\Demo\example.txt" -Value "Hello, PowerShell!"
```

---

### **2. Lire un fichier**
Lire le contenu d’un fichier.

```powershell
# Lire tout le contenu
Get-Content -Path "C:\Demo\example.txt"

# Lire uniquement les 5 premières lignes
Get-Content -Path "C:\Demo\example.txt" -TotalCount 5
```

---

### **3. Écrire dans un fichier**
Ajouter ou écraser du contenu dans un fichier.

```powershell
# Ajouter du texte sans écraser l'existant
Add-Content -Path "C:\Demo\example.txt" -Value "This is a new line."

# Écraser tout le contenu avec du nouveau texte
Set-Content -Path "C:\Demo\example.txt" -Value "New content here."
```

---

### **4. Supprimer un fichier**
Supprimer un fichier existant.

```powershell
# Supprimer un fichier
Remove-Item -Path "C:\Demo\example.txt"

# Supprimer plusieurs fichiers avec un filtre
Remove-Item -Path "C:\Demo\*.log"
```

---

### **5. Copier un fichier**
Copier des fichiers d’un répertoire à un autre.

```powershell
# Copier un fichier
Copy-Item -Path "C:\Demo\example.txt" -Destination "C:\Backup\example_copy.txt"

# Copier tous les fichiers d’un dossier
Copy-Item -Path "C:\Demo\*" -Destination "C:\Backup\" -Recurse
```

---

### **6. Déplacer un fichier**
Déplacer un fichier ou un dossier.

```powershell
# Déplacer un fichier
Move-Item -Path "C:\Demo\example.txt" -Destination "C:\Backup\example.txt"

# Renommer un fichier lors du déplacement
Move-Item -Path "C:\Demo\example.txt" -Destination "C:\Backup\new_name.txt"
```

---

### **7. Vérifier l’existence d’un fichier**
Utiliser `Test-Path` pour vérifier si un fichier ou un dossier existe.

```powershell
# Vérifier si un fichier existe
if (Test-Path -Path "C:\Demo\example.txt") {
    Write-Output "Le fichier existe."
} else {
    Write-Output "Le fichier n'existe pas."
}
```

---

### **8. Obtenir des informations sur un fichier**
Utiliser `Get-Item` pour récupérer des métadonnées.

```powershell
# Obtenir des informations de base
$fileInfo = Get-Item -Path "C:\Demo\example.txt"
$fileInfo | Format-List

# Obtenir uniquement la taille et la date de modification
$fileInfo.Length
$fileInfo.LastWriteTime
```

---

### **9. Trouver des fichiers avec un motif spécifique**
Rechercher des fichiers correspondant à un motif.

```powershell
# Trouver tous les fichiers .txt
Get-ChildItem -Path "C:\Demo" -Filter "*.txt"

# Trouver tous les fichiers modifiés au cours des 7 derniers jours
Get-ChildItem -Path "C:\Demo" | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) }
```

---

### **10. Renommer des fichiers**
Changer le nom d’un fichier ou d’un ensemble de fichiers.

```powershell
# Renommer un fichier
Rename-Item -Path "C:\Demo\example.txt" -NewName "renamed_example.txt"

# Renommer plusieurs fichiers en ajoutant un suffixe
Get-ChildItem -Path "C:\Demo\*.txt" | ForEach-Object {
    Rename-Item -Path $_.FullName -NewName "$($_.BaseName)_backup$($_.Extension)"
}
```

---

### **11. Compresser des fichiers**
Créer un fichier ZIP contenant des fichiers ou dossiers.

```powershell
# Compresser des fichiers dans un ZIP
Compress-Archive -Path "C:\Demo\example.txt" -DestinationPath "C:\Demo\archive.zip"

# Compresser tout un dossier
Compress-Archive -Path "C:\Demo\*" -DestinationPath "C:\Demo\all_files.zip"
```

---

### **12. Décompresser un fichier ZIP**
Extraire le contenu d’un fichier ZIP.

```powershell
# Extraire un fichier ZIP
Expand-Archive -Path "C:\Demo\archive.zip" -DestinationPath "C:\Demo\Extracted"
```

---

### **13. Comparer deux fichiers**
Comparer le contenu de deux fichiers.

```powershell
# Comparer deux fichiers ligne par ligne
Compare-Object -ReferenceObject (Get-Content -Path "C:\Demo\file1.txt") -DifferenceObject (Get-Content -Path "C:\Demo\file2.txt")
```

---

### **14. Remplacer du texte dans un fichier**
Modifier des parties spécifiques du contenu.

```powershell
# Remplacer un mot dans un fichier
(Get-Content -Path "C:\Demo\example.txt") -replace "ancien", "nouveau" | Set-Content -Path "C:\Demo\example.txt"
```

---

### **15. Générer un fichier contenant des données**
Créer un fichier avec des données générées dynamiquement.

```powershell
# Générer un fichier contenant une liste de nombres
1..100 | Set-Content -Path "C:\Demo\numbers.txt"

# Générer un fichier contenant des informations système
Get-Process | Out-File -FilePath "C:\Demo\processes.txt"
```

---

### **16. Lister tous les fichiers dans un dossier et ses sous-dossiers**
Explorer récursivement un dossier.

```powershell
# Lister tous les fichiers
Get-ChildItem -Path "C:\Demo" -Recurse

# Lister uniquement les fichiers .log
Get-ChildItem -Path "C:\Demo" -Recurse -Filter "*.log"
```

---

### **17. Créer un fichier temporaire**
Créer et utiliser un fichier temporaire.

```powershell
# Créer un fichier temporaire
$tempFile = New-TemporaryFile
Write-Output "Temp data" | Set-Content -Path $tempFile.FullName

# Lire et supprimer le fichier temporaire
Get-Content -Path $tempFile.FullName
Remove-Item -Path $tempFile.FullName
```

---

### **18. Mesurer la taille d’un fichier ou dossier**
Obtenir la taille en octets ou en format lisible.

```powershell
# Taille d’un fichier
(Get-Item -Path "C:\Demo\example.txt").Length

# Taille d’un dossier
Get-ChildItem -Path "C:\Demo" -Recurse | Measure-Object -Property Length -Sum
```

---

Ces exemples couvrent la majorité des scénarios liés à la gestion de fichiers en PowerShell. Si vous avez besoin d'un approfondissement ou d'un scénario spécifique, n'hésitez pas à demander !