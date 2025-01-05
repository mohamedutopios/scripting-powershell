### TP PowerShell : Opérations centrées sur les Pipelines avec un Dossier Copié

---

### **Énoncé**

1. **Copier un dossier source vers un répertoire de travail**
   - Copiez le dossier source `C:\Windows\System32\LogFiles` vers `C:\TP_PowerShell\LogFiles_Backup`.

2. **Lister les fichiers avec des propriétés spécifiques**
   - Listez tous les fichiers du dossier copié et affichez uniquement leur **nom**, **taille**, et **date de dernière modification**.

3. **Rechercher des fichiers volumineux**
   - Recherchez tous les fichiers `.log` dont la taille est supérieure à 500 Ko, puis affichez leurs noms triés par taille décroissante.

4. **Comptabiliser les fichiers par type**
   - Calculez le nombre total de fichiers pour chaque extension présente dans le dossier copié.

5. **Calculer la taille totale du dossier**
   - Additionnez la taille de tous les fichiers dans le dossier et affichez-la en mégaoctets.

6. **Analyser les fichiers récents**
   - Recherchez les fichiers modifiés au cours des 7 derniers jours et affichez leurs **chemins complets** et **taille en Ko**.

7. **Transformer les noms des fichiers**
   - Affichez la liste des fichiers avec leurs noms convertis en **majuscule**, triés par ordre alphabétique.

8. **Extraire les 10 plus anciens fichiers**
   - Identifiez les 10 fichiers les plus anciens dans le dossier, en affichant leur **nom**, **chemin complet**, et **date de création**.

9. **Créer un rapport HTML des fichiers**
   - Générez un rapport HTML contenant les colonnes : **nom**, **taille**, et **dernière modification** pour tous les fichiers `.log`.

---

### **Solutions**

---

#### **1. Copier un dossier source vers un répertoire de travail**
```powershell
Copy-Item -Path "C:\Windows\System32\LogFiles" -Destination "C:\TP_PowerShell\LogFiles_Backup" -Recurse
```

---

#### **2. Lister les fichiers avec des propriétés spécifiques**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse |
    Select-Object Name, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}, LastWriteTime
```

---

#### **3. Rechercher des fichiers volumineux**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse -Filter *.log |
    Where-Object { $_.Length -gt 500KB } |
    Sort-Object -Property Length -Descending |
    Select-Object Name, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}
```

---

#### **4. Comptabiliser les fichiers par type**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse |
    Group-Object -Property Extension |
    Select-Object Name, Count
```

---

#### **5. Calculer la taille totale du dossier**
```powershell
(Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse |
    Measure-Object -Property Length -Sum).Sum / 1MB
```

---

#### **6. Analyser les fichiers récents**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse |
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) } |
    Select-Object FullName, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}
```

---

#### **7. Transformer les noms des fichiers**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse |
    Select-Object @{Name="Nom en majuscules"; Expression={$_.Name.ToUpper()}} |
    Sort-Object "Nom en majuscules"
```

---

#### **8. Extraire les 10 plus anciens fichiers**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse |
    Sort-Object -Property CreationTime |
    Select-Object -First 10 Name, FullName, CreationTime
```

---

#### **9. Créer un rapport HTML des fichiers**
```powershell
Get-ChildItem -Path "C:\TP_PowerShell\LogFiles_Backup" -Recurse -Filter *.log |
    Select-Object Name, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}, LastWriteTime |
    ConvertTo-Html -Property Name, "Taille (Ko)", LastWriteTime |
    Out-File -FilePath "C:\TP_PowerShell\LogFilesReport.html"
```

---

### **Explications**

- **Chaînage avec pipelines** :
  Toutes les solutions reposent sur l'utilisation du pipeline (`|`) pour transmettre les résultats d'une cmdlet à la suivante.

- **Cmdlets clés utilisées** :
  - **`Get-ChildItem`** : Récupère les fichiers et dossiers.
  - **`Where-Object`** : Filtre les objets basés sur des conditions.
  - **`Sort-Object`** : Trie les résultats par une propriété spécifiée.
  - **`Select-Object`** : Sélectionne les propriétés à afficher ou limite les résultats.
  - **`Group-Object`** : Regroupe les résultats par une propriété commune.
  - **`ConvertTo-Html`** : Génère un tableau HTML à partir des données.
  - **`Measure-Object`** : Effectue des calculs sur les objets.

Ces opérations mettent l'accent sur la manipulation des résultats directement dans le pipeline pour des tâches complexes et efficaces.