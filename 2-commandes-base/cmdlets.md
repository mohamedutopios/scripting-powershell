### **Cmdlets Fondamentaux en PowerShell**

PowerShell offre plusieurs cmdlets de base qui permettent de découvrir, d’apprendre et de maîtriser ses fonctionnalités. Ces cmdlets sont essentiels pour explorer l’environnement PowerShell et interagir avec celui-ci.

---

### **1. `Get-Command`**

#### **Description :**
- Permet de **lister toutes les commandes disponibles** dans l’environnement PowerShell, y compris les cmdlets, alias, fonctions, scripts et applications externes.

#### **Syntaxe :**
```powershell
Get-Command [-Name <Nom>] [-CommandType <Type>] [-Module <NomModule>]
```

#### **Exemples :**
1. **Lister toutes les commandes disponibles :**
   ```powershell
   Get-Command
   ```

2. **Rechercher une commande spécifique :**
   ```powershell
   Get-Command -Name Get-Process
   ```

3. **Lister uniquement les cmdlets :**
   ```powershell
   Get-Command -CommandType Cmdlet
   ```

4. **Lister les commandes d’un module spécifique :**
   ```powershell
   Get-Command -Module Microsoft.PowerShell.Management
   ```

---

### **2. `Get-Help`**

#### **Description :**
- Fournit **des informations détaillées** sur une cmdlet, une commande ou un concept spécifique.

#### **Syntaxe :**
```powershell
Get-Help <Cmdlet> [-Full] [-Examples] [-Online]
```

#### **Exemples :**
1. **Afficher une aide rapide pour une cmdlet :**
   ```powershell
   Get-Help Get-Process
   ```

2. **Afficher des exemples d’utilisation :**
   ```powershell
   Get-Help Get-Process -Examples
   ```

3. **Afficher des détails complets :**
   ```powershell
   Get-Help Get-Process -Full
   ```

4. **Ouvrir la documentation en ligne (si disponible) :**
   ```powershell
   Get-Help Get-Process -Online
   ```

#### **Astuce :** Si l’aide n’est pas à jour, vous pouvez la mettre à jour avec :
```powershell
Update-Help
```

---

### **3. `Get-Alias`**

#### **Description :**
- Permet de **découvrir les alias** des cmdlets PowerShell. Les alias sont des raccourcis pour certaines cmdlets, souvent inspirés des commandes utilisées dans d'autres shells comme Bash.

#### **Syntaxe :**
```powershell
Get-Alias [-Name <NomAlias>] [-Definition <Cmdlet>]
```

#### **Exemples :**
1. **Lister tous les alias disponibles :**
   ```powershell
   Get-Alias
   ```

2. **Trouver la cmdlet correspondant à un alias spécifique :**
   ```powershell
   Get-Alias -Name gci
   ```

3. **Trouver les alias associés à une cmdlet spécifique :**
   ```powershell
   Get-Alias -Definition Get-ChildItem
   ```

4. **Créer un alias personnalisé :**
   ```powershell
   Set-Alias -Name ll -Value Get-ChildItem
   ```

---

### **4. `Get-Module`**

#### **Description :**
- Fournit des informations sur les modules PowerShell disponibles et chargés.

#### **Syntaxe :**
```powershell
Get-Module [-Name <NomModule>] [-ListAvailable]
```

#### **Exemples :**
1. **Lister les modules chargés actuellement :**
   ```powershell
   Get-Module
   ```

2. **Lister tous les modules disponibles sur le système :**
   ```powershell
   Get-Module -ListAvailable
   ```

3. **Charger un module spécifique :**
   ```powershell
   Import-Module -Name ActiveDirectory
   ```

---

### **5. `Get-Process`**

#### **Description :**
- Affiche les informations sur les processus en cours d’exécution.

#### **Syntaxe :**
```powershell
Get-Process [-Name <NomProcessus>] [-Id <IDProcessus>] [-ComputerName <NomMachine>]
```

#### **Exemples :**
1. **Lister tous les processus en cours :**
   ```powershell
   Get-Process
   ```

2. **Afficher les détails d’un processus spécifique :**
   ```powershell
   Get-Process -Name notepad
   ```

3. **Terminer un processus spécifique (avec `Stop-Process`) :**
   ```powershell
   Get-Process -Name notepad | Stop-Process
   ```

---

### **6. `Set-Location`**

#### **Description :**
- Change le répertoire de travail courant.

#### **Syntaxe :**
```powershell
Set-Location [-Path <Chemin>]
```

#### **Exemples :**
1. **Naviguer vers un répertoire spécifique :**
   ```powershell
   Set-Location -Path C:\Windows
   ```

2. **Utiliser des alias pour changer de répertoire :**
   ```powershell
   cd C:\Users
   ```

---

### **7. `Get-ChildItem`**

#### **Description :**
- Liste le contenu d’un répertoire (équivalent de `ls` en Linux).

#### **Syntaxe :**
```powershell
Get-ChildItem [-Path <Chemin>] [-Filter <Filtre>] [-Recurse]
```

#### **Exemples :**
1. **Lister les fichiers dans le répertoire courant :**
   ```powershell
   Get-ChildItem
   ```

2. **Lister les fichiers avec un filtre :**
   ```powershell
   Get-ChildItem -Filter *.txt
   ```

3. **Rechercher récursivement dans les sous-dossiers :**
   ```powershell
   Get-ChildItem -Path C:\ -Recurse
   ```

---

### **8. `Clear-Host`**

#### **Description :**
- Efface l’affichage dans la console PowerShell (équivalent de `clear` en Linux).

#### **Syntaxe :**
```powershell
Clear-Host
```

#### **Exemple :**
```powershell
Clear-Host
```

---

### **Résumé des cmdlets fondamentaux**

| Cmdlet           | Description                                      |
|------------------|--------------------------------------------------|
| `Get-Command`    | Liste toutes les commandes disponibles.          |
| `Get-Help`       | Fournit des informations détaillées sur une cmdlet. |
| `Get-Alias`      | Montre les alias associés aux cmdlets.           |
| `Get-Module`     | Affiche les modules disponibles ou chargés.      |
| `Get-Process`    | Liste les processus en cours.                    |
| `Set-Location`   | Change le répertoire de travail courant.         |
| `Get-ChildItem`  | Affiche le contenu d’un répertoire.              |
| `Clear-Host`     | Efface l’écran de la console.                    |

---

### **Conclusion**
Ces cmdlets fondamentaux constituent le socle pour naviguer, découvrir et interagir avec PowerShell. Ils sont essentiels pour explorer son environnement et automatiser des tâches. Une fois maîtrisés, ils permettent de progresser rapidement vers des scénarios d'administration plus avancés.