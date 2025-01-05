### TP PowerShell : Manipulation de dossiers et fichi


### **Énoncé**

1. **Télécharger et extraire l'archive**
   - Téléchargez l'archive depuis l’URL suivante :  
     [html5up-ethereal.zip](https://mohamed-formation.s3.eu-west-3.amazonaws.com/html5up-ethereal.zip)
   - Décompressez l’archive dans le dossier `C:\MonTP`.

2. **Lister le contenu extrait**
   - Listez tous les fichiers et dossiers dans le dossier `C:\MonTP\html5up-ethereal`.
   - Affichez uniquement les fichiers `.html`.

3. **Rechercher des fichiers spécifiques**
   - Recherchez récursivement tous les fichiers `.css` dans `C:\MonTP\html5up-ethereal`.

4. **Filtrer les fichiers par taille**
   - Affichez uniquement les fichiers de plus de 100 Ko dans `C:\MonTP\html5up-ethereal`.

5. **Changer de répertoire**
   - Naviguez dans le dossier contenant les fichiers CSS.
   - Revenez au répertoire parent après l'exploration.

6. **Compresser des fichiers**
   - Compressez uniquement les fichiers `.html` du dossier `C:\MonTP\html5up-ethereal` dans une nouvelle archive `html_files.zip`.

7. **Créer un rapport CSV**
   - Créez un fichier CSV `report.csv` contenant les colonnes : `Nom`, `Taille`, `Chemin complet` pour tous les fichiers du dossier `C:\MonTP\html5up-ethereal`.

8. **Supprimer certains fichiers**
   - Supprimez tous les fichiers `.txt` présents dans le dossier et ses sous-dossiers.

9. **Lister les fichiers récents**
   - Affichez uniquement les fichiers modifiés dans les 7 derniers jours dans `C:\MonTP\html5up-ethereal`.



---

### **Solutions**

1. **Télécharger et extraire l'archive**
   ```powershell
   # Téléchargement de l'archive
   Invoke-WebRequest -Uri "https://mohamed-formation.s3.eu-west-3.amazonaws.com/html5up-ethereal.zip" -OutFile "C:\MonTP\html5up-ethereal.zip"

   # Extraction de l'archive
   Expand-Archive -Path "C:\MonTP\html5up-ethereal.zip" -DestinationPath "C:\MonTP"
   ```

2. **Lister le contenu extrait**
   ```powershell
   # Liste tout le contenu
   Get-ChildItem -Path "C:\MonTP\html5up-ethereal"

   # Liste uniquement les fichiers .html
   Get-ChildItem -Path "C:\MonTP\html5up-ethereal" -Recurse -Filter *.html
   ```

3. **Rechercher des fichiers spécifiques**
   ```powershell
   Get-ChildItem -Path "C:\MonTP\html5up-ethereal" -Recurse -Filter *.css
   ```

4. **Filtrer les fichiers par taille**
   ```powershell
   Get-ChildItem -Path "C:\MonTP\html5up-ethereal" -File | Where-Object { $_.Length -gt 100KB }
   ```

5. **Changer de répertoire**
   ```powershell
   # Naviguer dans le répertoire contenant les fichiers CSS
   Set-Location -Path "C:\MonTP\html5up-ethereal\assets\css"

   # Revenir au répertoire parent
   Set-Location -Path "C:\MonTP\html5up-ethereal"
   ```

6. **Compresser des fichiers**
   ```powershell
   Compress-Archive -Path "C:\MonTP\html5up-ethereal\*.html" -DestinationPath "C:\MonTP\html_files.zip"
   ```

7. **Créer un rapport CSV**
   ```powershell
   Get-ChildItem -Path "C:\MonTP\html5up-ethereal" -Recurse | Select-Object Name, Length, FullName |
       Export-Csv -Path "C:\MonTP\report.csv" -NoTypeInformation
   ```

8. **Supprimer certains fichiers**
   ```powershell
   Get-ChildItem -Path "C:\MonTP\html5up-ethereal" -Recurse -Filter *.txt | Remove-Item
   ```

9. **Lister les fichiers récents**
   ```powershell
   Get-ChildItem -Path "C:\MonTP\html5up-ethereal" -File | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) }
   ```

10. **Créer un script conditionnel**
    ```powershell
    if (Test-Path -Path "C:\MonTP\html5up-ethereal\index.html") {
        Write-Output "Le fichier index.html existe."
    } else {
        Write-Output "Erreur : Le fichier index.html est introuvable."
    }
    ```