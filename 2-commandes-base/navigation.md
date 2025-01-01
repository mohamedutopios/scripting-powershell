### **Navigation dans le système de fichiers avec PowerShell**

PowerShell offre des cmdlets puissantes pour naviguer et manipuler le système de fichiers. Les principales cmdlets utilisées pour explorer et changer de répertoire sont **`Get-ChildItem`** et **`Set-Location`**.

---

### **1. `Get-ChildItem`**

#### **Description :**
- Permet de lister le contenu d’un répertoire.
- Peut être utilisé pour rechercher des fichiers, des dossiers ou d’autres types d’éléments.
- Alias courants : `gci`, `ls`, `dir`.

#### **Syntaxe :**
```powershell
Get-ChildItem [-Path <Chemin>] [-Filter <Filtre>] [-Recurse] [-File] [-Directory]
```

#### **Paramètres clés :**
- **`-Path`** : Spécifie le chemin d’accès au répertoire (par défaut, le répertoire courant).
- **`-Filter`** : Filtre les résultats par nom ou extension.
- **`-Recurse`** : Recherche récursive dans les sous-dossiers.
- **`-File`** : Liste uniquement les fichiers.
- **`-Directory`** : Liste uniquement les répertoires.

#### **Exemples pratiques :**
1. **Lister le contenu du répertoire courant :**
   ```powershell
   Get-ChildItem
   ```

2. **Lister les fichiers dans un répertoire spécifique :**
   ```powershell
   Get-ChildItem -Path C:\Users
   ```

3. **Lister uniquement les fichiers d’un type spécifique (par exemple, `.txt`) :**
   ```powershell
   Get-ChildItem -Path C:\Documents -Filter *.txt
   ```

4. **Recherche récursive dans les sous-dossiers :**
   ```powershell
   Get-ChildItem -Path C:\Projects -Recurse
   ```

5. **Lister uniquement les dossiers :**
   ```powershell
   Get-ChildItem -Path C:\ -Directory
   ```

6. **Lister uniquement les fichiers :**
   ```powershell
   Get-ChildItem -Path C:\ -File
   ```

7. **Afficher des informations spécifiques (nom, taille) :**
   ```powershell
   Get-ChildItem -Path C:\Documents | Select-Object Name, Length
   ```

---

### **2. `Set-Location`**

#### **Description :**
- Change le répertoire de travail courant dans PowerShell.
- Alias courants : `cd`, `chdir`.

#### **Syntaxe :**
```powershell
Set-Location [-Path] <Chemin>
```

#### **Paramètres clés :**
- **`-Path`** : Spécifie le chemin d’accès au répertoire où se déplacer.

#### **Exemples pratiques :**
1. **Changer vers un répertoire spécifique :**
   ```powershell
   Set-Location -Path C:\Users
   ```

2. **Utiliser un alias pour naviguer :**
   ```powershell
   cd C:\Documents
   ```

3. **Retourner au répertoire précédent :**
   ```powershell
   Set-Location -Path -
   ```

4. **Aller directement au répertoire de l'utilisateur :**
   ```powershell
   Set-Location -Path $HOME
   ```

5. **Naviguer dans un chemin relatif :**
   - Si le répertoire courant est `C:\Users`, aller dans `Documents` :
     ```powershell
     cd Documents
     ```

6. **Afficher le répertoire courant :**
   ```powershell
   Get-Location
   ```

---

### **Combinaison des cmdlets :**

#### **Exemple pratique 1 : Lister tous les fichiers `.log` d’un répertoire spécifique et changer de répertoire**
```powershell
Get-ChildItem -Path C:\Logs -Filter *.log
Set-Location -Path C:\Logs
```

#### **Exemple pratique 2 : Recherche récursive et navigation**
```powershell
# Rechercher un fichier spécifique et naviguer dans son répertoire parent
Get-ChildItem -Path C:\Projects -Recurse -Filter myfile.txt |
    ForEach-Object { Set-Location -Path $_.DirectoryName }
```

#### **Exemple pratique 3 : Naviguer et afficher uniquement les fichiers importants**
```powershell
Set-Location -Path C:\Reports
Get-ChildItem -File | Where-Object { $_.Length -gt 1MB }
```

---

### **Alias utiles pour ces cmdlets :**
| Cmdlet         | Alias   | Description                          |
|----------------|---------|--------------------------------------|
| `Get-ChildItem`| `gci`, `ls`, `dir` | Liste le contenu d’un répertoire. |
| `Set-Location` | `cd`, `chdir`      | Change le répertoire courant.     |

---

### **Résumé des commandes :**

| Commande                                   | Description                                                                 |
|-------------------------------------------|-----------------------------------------------------------------------------|
| `Get-ChildItem`                           | Liste les fichiers et dossiers dans le répertoire courant ou spécifié.     |
| `Get-ChildItem -Recurse`                  | Recherche récursive dans les sous-dossiers.                                |
| `Get-ChildItem -File`                     | Liste uniquement les fichiers.                                             |
| `Get-ChildItem -Directory`                | Liste uniquement les répertoires.                                          |
| `Set-Location <Chemin>`                   | Change le répertoire de travail courant.                                   |
| `Get-Location`                            | Affiche le répertoire de travail actuel.                                   |
| `cd ..`                                   | Monte d’un niveau dans la hiérarchie des dossiers.                         |
| `Set-Location -Path -`                    | Revient au répertoire précédent.                                           |

---

### **Conclusion :**
- **`Get-ChildItem`** et **`Set-Location`** sont des outils de base pour explorer et naviguer dans le système de fichiers avec PowerShell.
- Ils permettent de gérer efficacement les fichiers et dossiers tout en offrant des options flexibles pour filtrer et manipuler les résultats.
- Une fois maîtrisées, ces cmdlets simplifient l’exploration et l’automatisation des tâches dans PowerShell.