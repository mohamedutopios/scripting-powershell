Voici plusieurs démonstrations couvrant différents aspects des **modules** en PowerShell, incluant leur création, leur importation et leur utilisation :

---

### **1. Création d’un module basique**
Les modules permettent de regrouper des fonctions ou cmdlets personnalisées.

#### Étape 1 : Créer un fichier de module
- Créez un fichier nommé `MyModule.psm1` avec le contenu suivant :

```powershell
# MyModule.psm1

function Say-Hello {
    param(
        [string]$Name = "World"
    )
    Write-Output "Hello, $Name!"
}

function Get-DateInfo {
    Write-Output "Today is $(Get-Date -Format 'dddd, MMMM dd yyyy')"
}
```

#### Étape 2 : Stocker le fichier
Placez le fichier dans un dossier portant le même nom que le module, par exemple :
```
C:\Modules\MyModule\MyModule.psm1
```

#### Étape 3 : Importer et utiliser le module
- Importez le module avec `Import-Module` :
  ```powershell
  Import-Module C:\Modules\MyModule\MyModule.psm1
  ```
- Utilisez ses fonctions :
  ```powershell
  Say-Hello -Name "PowerShell"
  Get-DateInfo
  ```

---

### **2. Ajout d’un fichier manifeste au module**
Un fichier manifeste (`.psd1`) fournit des informations supplémentaires sur un module.

#### Étape 1 : Générer le manifeste
Utilisez la cmdlet `New-ModuleManifest` :
```powershell
New-ModuleManifest -Path "C:\Modules\MyModule\MyModule.psd1" -RootModule "MyModule.psm1" -Description "Module de démonstration" -Author "Admin"
```

#### Étape 2 : Charger le module
Avec le manifeste, le module peut être chargé directement :
```powershell
Import-Module C:\Modules\MyModule\MyModule.psd1
```

---

### **3. Distribution d’un module**
Les modules peuvent être partagés via un répertoire partagé ou une galerie PowerShell.

#### Étape 1 : Ajouter le module à un chemin par défaut
Déplacez le module dans un dossier de module utilisateur ou système :
- **Utilisateur** : `$env:USERPROFILE\Documents\WindowsPowerShell\Modules\`
- **Système** : `$env:ProgramFiles\WindowsPowerShell\Modules\`

Par exemple :
```
C:\Users\<NomUtilisateur>\Documents\WindowsPowerShell\Modules\MyModule
```

#### Étape 2 : Chargement automatique
Une fois dans ces emplacements, le module peut être importé automatiquement :
```powershell
Import-Module MyModule
Say-Hello
```

---

### **4. Liste des modules disponibles**
Pour afficher tous les modules installés sur votre système :
```powershell
Get-Module -ListAvailable
```

---

### **5. Exporter uniquement des fonctions spécifiques**
Si vous souhaitez limiter les fonctions accessibles par un utilisateur, utilisez `Export-ModuleMember` dans votre fichier `.psm1`.

#### Exemple :
```powershell
# MyModule.psm1

function Internal-Function {
    Write-Output "This is an internal function"
}

function Public-Function {
    Write-Output "This is a public function"
}

Export-ModuleMember -Function Public-Function
```

Ici, seule `Public-Function` sera accessible après l’importation du module.

---

### **6. Utilisation d’un module depuis la PowerShell Gallery**
PowerShell dispose d’une galerie publique de modules.

#### Étape 1 : Installer un module
Recherchez un module, par exemple le module Azure :
```powershell
Find-Module -Name Az
Install-Module -Name Az -Scope CurrentUser
```

#### Étape 2 : Importer et utiliser le module
```powershell
Import-Module Az
Get-Command -Module Az.Accounts
```

---

### **7. Créer un module avec des alias**
Vous pouvez aussi inclure des alias dans un module.

#### Exemple de module avec alias :
```powershell
# MyModule.psm1

function Get-HelloWorld {
    Write-Output "Hello, World!"
}

Set-Alias -Name Hello -Value Get-HelloWorld

Export-ModuleMember -Function Get-HelloWorld
```

Après importation, l’alias `Hello` exécutera `Get-HelloWorld` :
```powershell
Import-Module MyModule
Hello
```

---

Ces démonstrations montrent les étapes pour **créer, organiser et utiliser des modules**, qu'ils soient personnalisés ou téléchargés depuis une source externe comme la PowerShell Gallery. Si vous souhaitez explorer des cas spécifiques ou des fonctionnalités avancées, faites-le-moi savoir !