### Solutions aux nouveaux TP PowerShell

---

#### **1. Lister les fichiers d’un dossier selon des critères**
- Listez tous les fichiers contenant le mot *backup* dans leur nom :
  ```powershell
  Get-ChildItem -Path "C:\TP_PowerShell" -Filter "*backup*"
  ```
- Affichez uniquement les fichiers modifiés dans les 7 derniers jours :
  ```powershell
  Get-ChildItem -Path "C:\TP_PowerShell" | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) }
  ```

---

#### **2. Fusionner plusieurs fichiers**
- Combinez le contenu de tous les fichiers `.txt` en un seul fichier :
  ```powershell
  Get-Content -Path "C:\TP_PowerShell\Backup\*.txt" | Set-Content -Path "C:\TP_PowerShell\Backup\merged.txt"
  ```

---

#### **3. Rechercher et remplacer dans plusieurs fichiers**
- Remplacez le mot *ancien* par *nouveau* dans tous les fichiers `.txt` :
  ```powershell
  Get-ChildItem -Path "C:\TP_PowerShell\Backup\*.txt" | ForEach-Object {
      (Get-Content -Path $_.FullName) -replace "ancien", "nouveau" | Set-Content -Path $_.FullName
  }
  ```

---

#### **4. Calculer la taille totale d’un dossier**
- Taille totale des fichiers en octets et Mo :
  ```powershell
  $totalSize = Get-ChildItem -Path "C:\TP_PowerShell\Backup" -Recurse | Measure-Object -Property Length -Sum
  $sizeInBytes = $totalSize.Sum
  $sizeInMB = [math]::Round($sizeInBytes / 1MB, 2)
  Write-Output "Taille totale : $sizeInBytes octets ($sizeInMB Mo)"
  ```

---

#### **5. Extraire des données spécifiques d’un fichier**
- Listez uniquement les lignes contenant le mot *ERROR* :
  ```powershell
  Select-String -Path "C:\TP_PowerShell\logs.txt" -Pattern "ERROR"
  ```

---

#### **6. Créer un script pour nettoyer un dossier**
- Supprimez tous les fichiers `.log` de plus de 30 jours :
  ```powershell
  Get-ChildItem -Path "C:\TP_PowerShell\Logs\*.log" | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item
  ```

---

#### **7. Créer et organiser des dossiers dynamiquement**
- Créez 12 dossiers et organisez les fichiers selon leur date de création :
  ```powershell
  1..12 | ForEach-Object { New-Item -Path "C:\TP_PowerShell\$($_)" -ItemType Directory }
  Get-ChildItem -Path "C:\TP_PowerShell\*.txt" | ForEach-Object {
      $month = $_.CreationTime.Month
      Move-Item -Path $_.FullName -Destination "C:\TP_PowerShell\$month\"
  }
  ```

---

#### **8. Créer un rapport HTML des fichiers**
- Générez un rapport HTML avec les détails des fichiers :
  ```powershell
  Get-ChildItem -Path "C:\TP_PowerShell" | Select-Object Name, Length, LastWriteTime | ConvertTo-Html | Out-File -FilePath "C:\TP_PowerShell\report.html"
  ```

---

#### **9. Créer un fichier CSV contenant des informations sur les fichiers**
- Générez un fichier `report.csv` avec les colonnes `Nom`, `Taille`, `Date de modification` :
  ```powershell
  Get-ChildItem -Path "C:\TP_PowerShell\*.txt" | Select-Object Name, Length, LastWriteTime | Export-Csv -Path "C:\TP_PowerShell\report.csv" -NoTypeInformation
  ```

---

#### **10. Chiffrer et déchiffrer des fichiers**
- Chiffrez le fichier avec un mot de passe (exemple basique avec des outils intégrés) :
  ```powershell
  $content = Get-Content -Path "C:\TP_PowerShell\intro.txt"
  $password = "12345"
  $encrypted = ConvertTo-SecureString -String $content -AsPlainText -Force | ConvertFrom-SecureString
  Set-Content -Path "C:\TP_PowerShell\intro_encrypted.txt" -Value $encrypted
  ```
- Déchiffrez le fichier :
  ```powershell
  $encryptedContent = Get-Content -Path "C:\TP_PowerShell\intro_encrypted.txt"
  $decrypted = ConvertTo-SecureString -String $encryptedContent | ConvertFrom-SecureString -AsPlainText
  $decrypted
  ```

---

### Solutions aux Questions

1. **Quelle commande permet de lire le contenu d’un fichier ?**
   ```powershell
   Get-Content -Path "chemin_du_fichier"
   ```

2. **Comment vérifier si un fichier existe à un chemin donné ?**
   ```powershell
   Test-Path -Path "chemin_du_fichier"
   ```

3. **Quelle est la différence entre `Set-Content` et `Add-Content` ?**
   - `Set-Content` écrase tout le contenu existant.
   - `Add-Content` ajoute du contenu sans écraser le fichier.

4. **Exemple pour copier des fichiers `.log` tout en conservant la structure des sous-dossiers** :
   ```powershell
   Copy-Item -Path "C:\Source\*.log" -Destination "C:\Destination" -Recurse
   ```

5. **Exemple pour utiliser `Select-String` pour trouver un mot-clé** :
   ```powershell
   Select-String -Path "C:\TP_PowerShell\*.txt" -Pattern "mot_clé"
   ```

6. **Comparer deux fichiers ligne par ligne** :
   ```powershell
   Compare-Object -ReferenceObject (Get-Content -Path "file1.txt") -DifferenceObject (Get-Content -Path "file2.txt")
   ```
