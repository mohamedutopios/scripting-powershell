### TP PowerShell : Gestion de fichiers avec difficulté croissante

---

### **Partie 1 : Niveau Débutant**

1. **Créer un fichier et y ajouter du contenu**
   - Créez un dossier `C:\TP_PowerShell`.
   - Créez un fichier nommé `intro.txt` et ajoutez-y la phrase : *"Bienvenue au TP PowerShell."*

   **Réponse** :
   ```powershell
   New-Item -Path "C:\TP_PowerShell" -ItemType Directory
   Set-Content -Path "C:\TP_PowerShell\intro.txt" -Value "Bienvenue au TP PowerShell."
   ```

2. **Lire le fichier créé**
   - Affichez le contenu du fichier `intro.txt` dans la console.
   - Lisez uniquement les 5 premiers caractères du fichier.

   **Réponse** :
   ```powershell
   Get-Content -Path "C:\TP_PowerShell\intro.txt"
   Get-Content -Path "C:\TP_PowerShell\intro.txt" | ForEach-Object { $_.Substring(0,5) }
   ```

---

### **Partie 2 : Niveau Intermédiaire**

3. **Ajouter du texte au fichier**
   - Ajoutez une nouvelle ligne au fichier `intro.txt` contenant : *"PowerShell simplifie la gestion des fichiers."*

   **Réponse** :
   ```powershell
   Add-Content -Path "C:\TP_PowerShell\intro.txt" -Value "PowerShell simplifie la gestion des fichiers."
   ```

4. **Créer plusieurs fichiers**
   - Créez 5 fichiers nommés `fichier1.txt` à `fichier5.txt` dans le dossier `C:\TP_PowerShell`.

   **Réponse** :
   ```powershell
   1..5 | ForEach-Object { New-Item -Path "C:\TP_PowerShell\fichier$_.txt" -ItemType File }
   ```

5. **Copier et déplacer des fichiers**
   - Copiez tous les fichiers `.txt` vers un sous-dossier `Backup`.
   - Déplacez ensuite le fichier `intro.txt` vers le dossier `Backup`.

   **Réponse** :
   ```powershell
   New-Item -Path "C:\TP_PowerShell\Backup" -ItemType Directory
   Copy-Item -Path "C:\TP_PowerShell\*.txt" -Destination "C:\TP_PowerShell\Backup"
   Move-Item -Path "C:\TP_PowerShell\intro.txt" -Destination "C:\TP_PowerShell\Backup"
   ```

6. **Vérifier l’existence de fichiers**
   - Vérifiez si le fichier `intro.txt` existe encore dans le dossier `C:\TP_PowerShell`.

   **Réponse** :
   ```powershell
   Test-Path -Path "C:\TP_PowerShell\intro.txt"
   ```

---

### **Partie 3 : Niveau Avancé**

7. **Renommer des fichiers**
   - Ajoutez un suffixe `_old` à tous les fichiers dans `C:\TP_PowerShell\Backup`.

   **Réponse** :
   ```powershell
   Get-ChildItem -Path "C:\TP_PowerShell\Backup\*.txt" | ForEach-Object {
       Rename-Item -Path $_.FullName -NewName "$($_.BaseName)_old$($_.Extension)"
   }
   ```

8. **Trouver des fichiers spécifiques**
   - Listez tous les fichiers `.txt` contenant le mot *PowerShell*.

   **Réponse** :
   ```powershell
   Get-ChildItem -Path "C:\TP_PowerShell\Backup\*.txt" | ForEach-Object {
       if (Select-String -Path $_.FullName -Pattern "PowerShell") {
           $_.Name
       }
   }
   ```

9. **Compresser et décompresser**
   - Compressez tous les fichiers de `C:\TP_PowerShell\Backup` dans un fichier `backup.zip`.
   - Décompressez le fichier dans un dossier `Extracted`.

   **Réponse** :
   ```powershell
   Compress-Archive -Path "C:\TP_PowerShell\Backup\*" -DestinationPath "C:\TP_PowerShell\backup.zip"
   Expand-Archive -Path "C:\TP_PowerShell\backup.zip" -DestinationPath "C:\TP_PowerShell\Extracted"
   ```

10. **Remplacer du texte dans un fichier**
    - Dans le fichier `intro.txt` extrait, remplacez le mot *PowerShell* par *Automatisation*.

    **Réponse** :
    ```powershell
    (Get-Content -Path "C:\TP_PowerShell\Extracted\intro.txt") -replace "PowerShell", "Automatisation" | Set-Content -Path "C:\TP_PowerShell\Extracted\intro.txt"
    ```

---

### **Partie 4 : Niveau Expert**

11. **Générer et analyser des fichiers**
    - Générez un fichier `data.txt` contenant 100 numéros aléatoires.
    - Calculez la somme de tous les numéros du fichier.

    **Réponse** :
    ```powershell
    1..100 | ForEach-Object { Get-Random -Minimum 1 -Maximum 100 } | Set-Content -Path "C:\TP_PowerShell\data.txt"
    (Get-Content -Path "C:\TP_PowerShell\data.txt" | Measure-Object -Sum).Sum
    ```

12. **Comparer deux fichiers**
    - Créez deux fichiers `file1.txt` et `file2.txt` avec des listes de noms.
    - Identifiez les noms présents uniquement dans `file1.txt`.

    **Réponse** :
    ```powershell
    Set-Content -Path "C:\TP_PowerShell\file1.txt" -Value @("Alice", "Bob", "Charlie")
    Set-Content -Path "C:\TP_PowerShell\file2.txt" -Value @("Bob", "David")
    Compare-Object -ReferenceObject (Get-Content -Path "C:\TP_PowerShell\file1.txt") -DifferenceObject (Get-Content -Path "C:\TP_PowerShell\file2.txt") | Where-Object { $_.SideIndicator -eq "<=" }
    ```

---

### Énoncé uniquement

---

### **Partie 1 : Niveau Débutant**

1. **Créer un fichier et y ajouter du contenu**
   - Créez un dossier `C:\TP_PowerShell`.
   - Créez un fichier nommé `intro.txt` et ajoutez-y la phrase : *"Bienvenue au TP PowerShell."*

2. **Lire le fichier créé**
   - Affichez le contenu du fichier `intro.txt` dans la console.
   - Lisez uniquement les 5 premiers caractères du fichier.

---

### **Partie 2 : Niveau Intermédiaire**

3. **Ajouter du texte au fichier**
   - Ajoutez une nouvelle ligne au fichier `intro.txt` contenant : *"PowerShell simplifie la gestion des fichiers."*

4. **Créer plusieurs fichiers**
   - Créez 5 fichiers nommés `fichier1.txt` à `fichier5.txt` dans le dossier `C:\TP_PowerShell`.

5. **Copier et déplacer des fichiers**
   - Copiez tous les fichiers `.txt` vers un sous-dossier `Backup`.
   - Déplacez ensuite le fichier `intro.txt` vers le dossier `Backup`.

6. **Vérifier l’existence de fichiers**
   - Vérifiez si le fichier `intro.txt` existe encore dans le dossier `C:\TP_PowerShell`.

---

### **Partie 3 : Niveau Avancé**

7. **Renommer des fichiers**
   - Ajoutez un suffixe `_old` à tous les fichiers dans `C:\TP_PowerShell\Backup`.

8. **Trouver des fichiers spécifiques**
   - Listez tous les fichiers `.txt` contenant le mot *PowerShell*.

9. **Compresser et décompresser**
   - Compressez tous les fichiers de `C:\TP_PowerShell\Backup` dans un fichier `backup.zip`.
   - Décompressez le fichier dans un dossier `Extracted`.

10. **Remplacer du texte dans un fichier**
    - Dans le fichier `intro.txt` extrait, remplacez le mot *PowerShell* par *Automatisation*.

---

### **Partie 4 : Niveau Expert**

11. **Générer et analyser des fichiers**
    - Générez un fichier `data.txt` contenant 100 numéros aléatoires.
    - Calculez la somme de tous les numéros du fichier.

12. **Comparer deux fichiers**
    - Créez deux fichiers `file1.txt` et `file2.txt` avec des listes de noms.
    - Identifiez les noms présents uniquement dans `file1.txt`.