Voici un récapitulatif **complet** des commandes abordées dans les démonstrations, avec leurs descriptions pour chaque thématique.

---

### **1. Modifier le profil utilisateur PowerShell**
#### Vérifier l'existence du profil utilisateur :
```powershell
Test-Path $PROFILE
```

#### Créer le fichier de profil (si inexistant) :
```powershell
New-Item -Path $PROFILE -Type File -Force
```

#### Éditer le fichier de profil dans Notepad :
```powershell
notepad $PROFILE
```

#### Exemple de contenu à ajouter dans le profil :
```powershell
# Couleurs de la console
$host.UI.RawUI.BackgroundColor = "DarkBlue"
$host.UI.RawUI.ForegroundColor = "White"
Clear-Host

# Alias personnalisés
Set-Alias ll Get-ChildItem
Set-Alias cls Clear-Host

# Message d'accueil
Write-Host "Bienvenue dans PowerShell personnalisé !" -ForegroundColor Green
```

---

### **2. Activer l'exécution de scripts**
#### Vérifier la politique actuelle d’exécution :
```powershell
Get-ExecutionPolicy
```

#### Modifier la politique d’exécution pour permettre les scripts locaux :
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Désactiver toutes les restrictions (option non recommandée) :
```powershell
Set-ExecutionPolicy Unrestricted -Scope CurrentUser
```

#### Afficher l’état d’une politique spécifique :
```powershell
Get-ExecutionPolicy -Scope CurrentUser
```

---

### **3. Installer et gérer des modules supplémentaires**
#### Installer un module depuis la PowerShell Gallery :
```powershell
Install-Module -Name <ModuleName> -AllowClobber -Scope CurrentUser
```

Exemple : Installation du module Azure (Az) :
```powershell
Install-Module -Name Az -AllowClobber -Scope CurrentUser
```

#### Vérifier les modules installés :
```powershell
Get-InstalledModule
```

#### Importer un module pour l’utiliser :
```powershell
Import-Module <ModuleName>
```

---

### **4. Tester l’installation de PowerShell**
#### Vérifier une commande système comme `Get-Process` :
```powershell
Get-Process
```

#### Afficher les 10 premiers processus :
```powershell
Get-Process | Select-Object -First 10
```

#### Afficher les processus dans un tableau formaté :
```powershell
Get-Process | Select-Object Name, Id, CPU | Format-Table -AutoSize
```

---

### **5. Installer et personnaliser Oh-My-Posh**
#### Installer Oh-My-Posh :
```powershell
Install-Module -Name oh-my-posh -Scope CurrentUser
```

#### Initialiser Oh-My-Posh dans votre environnement :
```powershell
oh-my-posh init pwsh | Out-File -Encoding utf8 -Append $PROFILE
```

#### Télécharger un thème Oh-My-Posh :
```powershell
Set-PoshPrompt -Theme <NomDuThème>
```

Exemple pour configurer un thème (remplacez `<NomDuThème>` par un thème existant) :
```powershell
Set-PoshPrompt -Theme Paradox
```

---

### **6. Visual Studio Code et extensions**
#### Télécharger et installer Visual Studio Code :
```powershell
Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile "$env:Temp\VSCodeSetup.exe"
Start-Process "$env:Temp\VSCodeSetup.exe" -Wait
```

#### Installer l’extension PowerShell dans VS Code :
```powershell
code --install-extension ms-vscode.PowerShell
```

---

### **7. Analyser un dossier**
#### Afficher les fichiers d’un dossier donné :
```powershell
Get-ChildItem -Path <CheminDuDossier>
```

#### Filtrer uniquement les fichiers avec une extension spécifique (.txt, par exemple) :
```powershell
Get-ChildItem -Path <CheminDuDossier> -Recurse | Where-Object { $_.Extension -eq ".txt" }
```

#### Afficher les fichiers avec des colonnes personnalisées :
```powershell
Get-ChildItem -Path <CheminDuDossier> -Recurse |
    Select-Object Name, Length, LastWriteTime |
    Format-Table -AutoSize
```

---

### **Résumé des principales commandes**

| **Commande**                             | **Description**                                                                                   |
|------------------------------------------|---------------------------------------------------------------------------------------------------|
| `Test-Path $PROFILE`                     | Vérifie si le fichier de profil PowerShell existe.                                               |
| `New-Item -Path $PROFILE -Type File`     | Crée le fichier de profil si inexistant.                                                         |
| `notepad $PROFILE`                       | Ouvre le fichier de profil dans Notepad.                                                         |
| `Get-ExecutionPolicy`                    | Vérifie la politique d’exécution de scripts.                                                     |
| `Set-ExecutionPolicy RemoteSigned`       | Permet l’exécution de scripts locaux signés.                                                     |
| `Install-Module -Name <ModuleName>`      | Installe un module depuis PowerShell Gallery.                                                    |
| `Get-InstalledModule`                    | Affiche la liste des modules installés.                                                          |
| `Import-Module <ModuleName>`             | Charge un module pour qu’il soit disponible dans la session.                                     |
| `Get-Process`                            | Affiche les processus actifs du système.                                                         |
| `oh-my-posh init pwsh`                   | Initialise Oh-My-Posh pour personnaliser le prompt PowerShell.                                   |
| `Invoke-WebRequest -Uri <URL>`           | Télécharge un fichier depuis une URL.                                                            |
| `Get-ChildItem -Path <Chemin>`           | Liste les fichiers et dossiers dans un chemin donné.                                             |
| `Where-Object { $_.Extension -eq ".txt" }` | Filtre les objets selon une condition, ici pour les fichiers avec l'extension `.txt`.            |
| `Select-Object Name, Length, LastWriteTime` | Sélectionne des colonnes spécifiques dans une liste de fichiers ou objets.                      |
| `Format-Table -AutoSize`                 | Affiche les données dans un tableau formaté avec des colonnes ajustées.                          |

---

Si vous souhaitez des commandes pour d'autres configurations ou thématiques spécifiques, faites-le-moi savoir !