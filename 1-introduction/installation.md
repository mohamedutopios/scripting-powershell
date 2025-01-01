### **Installation et Configuration de l’Environnement PowerShell**

---

#### **1. Vérification de la version PowerShell existante**
1. **Ouvrir une session PowerShell :**
   - Sous Windows : Rechercher `PowerShell` dans le menu Démarrer et cliquer sur **Windows PowerShell** ou **PowerShell 7**.
   - Sous macOS ou Linux : Ouvrir un terminal.

2. **Commande pour vérifier la version :**
   ```powershell
   $PSVersionTable
   ```
   - La valeur de `PSVersion` indique la version installée.
   - Si aucune version n'est trouvée, PowerShell n'est pas installé.

---

#### **2. Installation de PowerShell sur différentes plateformes**

##### **a. Installation sur Windows**
- **Windows PowerShell (version classique)** : Déjà inclus dans Windows 7, 8.1, 10, 11, et Windows Server.
- **PowerShell 7+ (version multiplateforme)** :
  1. Télécharger l’installateur depuis la page officielle :  
     [https://github.com/PowerShell/PowerShell/releases](https://github.com/PowerShell/PowerShell/releases).
  2. Choisir le package **.msi** correspondant à votre architecture (x64 ou x86).
  3. Suivre l’assistant d’installation.

- **Via Winget (gestionnaire de paquets Windows 10/11)** :
  ```powershell
  winget install --id Microsoft.Powershell --source winget
  ```

##### **b. Installation sur macOS**
1. Ouvrir le terminal.
2. Installer PowerShell via **Homebrew** :
   ```bash
   brew install --cask powershell
   ```
3. Lancer PowerShell :
   ```bash
   pwsh
   ```

##### **c. Installation sur Linux**
1. **Ajouter le dépôt officiel :**
   - Pour Ubuntu/Debian :
     ```bash
     sudo apt-get update
     sudo apt-get install -y wget apt-transport-https software-properties-common
     wget -q "https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb" -O packages-microsoft-prod.deb
     sudo dpkg -i packages-microsoft-prod.deb
     ```
   - Pour CentOS/RedHat :
     ```bash
     sudo dnf install -y https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
     ```

2. **Installer PowerShell :**
   - Pour Ubuntu/Debian :
     ```bash
     sudo apt-get update
     sudo apt-get install -y powershell
     ```
   - Pour CentOS/RedHat :
     ```bash
     sudo dnf install -y powershell
     ```

3. Lancer PowerShell :
   ```bash
   pwsh
   ```

---

#### **3. Configuration de l’environnement PowerShell**

##### **a. Modifier le profil utilisateur PowerShell**
1. **Vérifier l'existence du profil utilisateur :**
   ```powershell
   Test-Path $PROFILE
   ```
   - Si `False`, créer le fichier de profil :
     ```powershell
     New-Item -Path $PROFILE -Type File -Force
     ```

2. **Éditer le fichier de profil :**
   ```powershell
   notepad $PROFILE
   ```
   - Exemple de contenu pour personnaliser l’environnement :
     ```powershell
     # Couleur de la console
     $host.UI.RawUI.BackgroundColor = "DarkBlue"
     $host.UI.RawUI.ForegroundColor = "White"
     Clear-Host

     # Alias personnalisés
     Set-Alias ll Get-ChildItem
     Set-Alias cls Clear-Host
     ```

##### **b. Activer l’exécution de scripts**
- Par défaut, PowerShell limite l'exécution de scripts pour des raisons de sécurité.
1. **Vérifier la politique actuelle :**
   ```powershell
   Get-ExecutionPolicy
   ```
2. **Modifier la politique (si nécessaire) :**
   - Pour permettre tous les scripts locaux :
     ```powershell
     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
     ```
   - Pour désactiver les restrictions :
     ```powershell
     Set-ExecutionPolicy Unrestricted -Scope CurrentUser
     ```
   - **Note :** Cette commande nécessite des droits administratifs.

##### **c. Installer des modules supplémentaires**
1. Utiliser le PowerShell Gallery pour installer des modules :
   ```powershell
   Install-Module -Name Az -AllowClobber -Scope CurrentUser
   ```
2. Vérifier les modules installés :
   ```powershell
   Get-InstalledModule
   ```

##### **d. Tester l’installation**
- Exécuter une commande pour valider le bon fonctionnement :
  ```powershell
  Get-Process
  ```

---

#### **4. Personnalisation avancée (facultatif)**
- Installer un thème personnalisé pour Visual Studio Code avec PowerShell Extension.
- Ajouter des outils tiers comme **Oh-My-Posh** pour un prompt stylé :
  ```powershell
  Install-Module -Name oh-my-posh -Scope CurrentUser
  ```

---

#### **Conclusion**
L’installation et la configuration de PowerShell sont simples et adaptables à toutes les plateformes. Une fois configuré, PowerShell devient un outil puissant pour automatiser les tâches d’administration et améliorer la productivité des TSSR.