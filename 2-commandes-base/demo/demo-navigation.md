Voici une série d'exemples progressifs et variés sur la **navigation dans PowerShell**, allant des commandes de base aux scénarios avancés :

---

### **1. Afficher le répertoire courant**
Utilisez `Get-Location` pour connaître le répertoire actuel.

```powershell
# Afficher le répertoire actuel
Get-Location
```

---

### **2. Changer de répertoire**
Utilisez `Set-Location` ou son alias `cd`.

```powershell
# Naviguer vers un répertoire
Set-Location -Path "C:\Windows"

# Alias
cd "C:\Windows"
```

---

### **3. Naviguer dans un chemin relatif**
Vous pouvez utiliser des chemins relatifs (`..` ou `.`).

```powershell
# Aller au répertoire parent
cd ..

# Naviguer vers un sous-dossier
cd .\Documents
```

---

### **4. Liste des fichiers et dossiers**
Afficher le contenu d’un répertoire avec `Get-ChildItem` ou son alias `ls`.

```powershell
# Lister les fichiers et dossiers
Get-ChildItem

# Alias
ls
```

---

### **5. Lister les fichiers avec des filtres**
Utilisez des filtres pour trouver des fichiers ou des dossiers spécifiques.

```powershell
# Lister les fichiers .txt
Get-ChildItem -Filter "*.txt"

# Lister uniquement les dossiers
Get-ChildItem -Directory

# Lister les fichiers modifiés dans les 7 derniers jours
Get-ChildItem | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) }
```

---

### **6. Naviguer vers une autre lettre de lecteur**
PowerShell prend en charge plusieurs lecteurs (C:, D:, etc.).

```powershell
# Passer au lecteur D:
Set-Location -Path D:

# Revenir au lecteur précédent
Set-Location -Path C:
```

---

### **7. Utiliser des chemins réseau**
Naviguer vers des ressources réseau.

```powershell
# Naviguer vers un partage réseau
Set-Location -Path "\\Serveur\Partage"

# Vérifier si le chemin est accessible
Test-Path "\\Serveur\Partage"
```

---

### **8. Historique des emplacements**
Utilisez `Push-Location` et `Pop-Location` pour naviguer facilement entre les répertoires.

```powershell
# Sauvegarder le répertoire courant
Push-Location

# Changer de répertoire
Set-Location -Path "C:\Windows"

# Revenir au répertoire précédent
Pop-Location
```

---

### **9. Créer une structure de répertoires**
Créer plusieurs dossiers imbriqués.

```powershell
# Créer une structure complète
New-Item -Path "C:\Demo\Projet\Documents" -ItemType Directory -Force
```

---

### **10. Explorer les lecteurs disponibles**
Lister tous les lecteurs accessibles avec `Get-PSDrive`.

```powershell
# Afficher les lecteurs
Get-PSDrive
```

---

### **11. Parcourir les alias de PowerShell**
Les alias comme `cd`, `ls` sont des raccourcis pour des cmdlets.

```powershell
# Lister tous les alias
Get-Alias

# Trouver l'alias pour 'Get-ChildItem'
Get-Alias -Definition Get-ChildItem
```

---

### **12. Rechercher des fichiers spécifiques**
Utilisez `Get-ChildItem` avec `-Recurse` pour rechercher dans des sous-dossiers.

```powershell
# Rechercher un fichier spécifique
Get-ChildItem -Path "C:\Demo" -Filter "log*.txt" -Recurse
```

---

### **13. Obtenir des informations sur un chemin**
Utilisez `Split-Path` pour extraire des informations.

```powershell
# Obtenir le dossier parent
Split-Path -Path "C:\Demo\example.txt" -Parent

# Obtenir uniquement le nom du fichier
Split-Path -Path "C:\Demo\example.txt" -Leaf
```

---

### **14. Naviguer avec les environnements PowerShell**
PowerShell permet d'explorer des environnements spécifiques comme le registre Windows.

#### Explorer le registre
```powershell
# Accéder au registre
Set-Location -Path "HKLM:\SOFTWARE"
ls
```

---

### **15. Suivre un chemin complexe avec une variable**
Utilisez des variables pour stocker et suivre des chemins.

```powershell
# Définir un chemin dans une variable
$path = "C:\Demo"

# Naviguer vers ce chemin
Set-Location -Path $path
```

---

### **16. Naviguer avec des expressions dynamiques**
Créez des chemins dynamiquement en fonction de variables ou de l’heure.

```powershell
# Exemple : Naviguer vers un dossier spécifique à la date du jour
$today = Get-Date -Format "yyyy-MM-dd"
$path = "C:\Archives\$today"
Set-Location -Path $path
```

---

### **17. Automatiser une navigation répétée**
Créez une fonction pour naviguer automatiquement.

```powershell
# Fonction pour aller rapidement dans un dossier
function Go-Demo {
    Set-Location -Path "C:\Demo"
}
Go-Demo
```

---

### **18. Explorer les fichiers et dossiers avec un script**
Parcourir récursivement un répertoire et effectuer des actions sur chaque fichier.

```powershell
# Parcourir récursivement et afficher uniquement les fichiers
Get-ChildItem -Path "C:\Demo" -Recurse | Where-Object { -not $_.PSIsContainer } | ForEach-Object {
    Write-Output "Fichier : $($_.FullName)"
}
```

---

### **19. Comparer deux répertoires**
Comparer les fichiers entre deux répertoires.

```powershell
# Comparer deux répertoires
Compare-Object -ReferenceObject (Get-ChildItem -Path "C:\Demo\Old") -DifferenceObject (Get-ChildItem -Path "C:\Demo\New")
```

---

### **20. Naviguer avec des erreurs gérées**
Utiliser un bloc `try-catch` pour une navigation sécurisée.

```powershell
try {
    Set-Location -Path "C:\NonExistantFolder"
} catch {
    Write-Output "Le dossier n'existe pas !"
}
```

---

### **21. Naviguer avec des fichiers compressés (ZIP)**
Utiliser `Expand-Archive` pour naviguer dans un dossier temporaire extrait.

```powershell
# Extraire un fichier ZIP dans un dossier temporaire
$tempFolder = "$env:TEMP\Extracted"
Expand-Archive -Path "C:\Demo\archive.zip" -DestinationPath $tempFolder

# Naviguer vers ce dossier
Set-Location -Path $tempFolder
```

---

### **Résumé des commandes utilisées**
| **Cmdlet**         | **Description**                           |
|--------------------|-------------------------------------------|
| `Get-Location`     | Affiche le répertoire actuel             |
| `Set-Location`     | Change de répertoire                     |
| `Get-ChildItem`    | Liste les fichiers et dossiers           |
| `Push-Location`    | Sauvegarde l'emplacement courant         |
| `Pop-Location`     | Revient au dernier emplacement sauvegardé |
| `Test-Path`        | Vérifie l'existence d’un chemin          |
| `Split-Path`       | Analyse des parties d’un chemin          |
| `Compare-Object`   | Compare des répertoires ou fichiers      |

---

Ces exemples progressifs montrent comment naviguer efficacement dans PowerShell. Si vous souhaitez des scénarios plus spécifiques, faites-le-moi savoir !