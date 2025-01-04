

La différence entre les **cmdlets** et les **modules** en PowerShell repose sur leur rôle et leur utilisation :

---

### **Cmdlets**
- **Définition :** Les cmdlets (prononcé *command-lets*) sont des commandes légères et spécifiques fournies par PowerShell pour effectuer des actions précises.
- **Caractéristiques principales :**
  - Elles sont intégrées à PowerShell ou créées par des développeurs.
  - Elles sont écrites en .NET et exécutées directement dans l'environnement PowerShell.
  - Elles suivent la convention de nommage `Verbe-Nom` (par exemple, `Get-Process`, `Set-Content`).
  - Elles sont conçues pour effectuer une seule tâche spécifique, comme manipuler des fichiers, gérer des processus, ou configurer des paramètres système.
- **Exemple :**
  ```powershell
  Get-Process   # Récupère la liste des processus en cours
  Set-Content -Path "test.txt" -Value "Bonjour"  # Écrit du contenu dans un fichier
  ```

---

### **Modules**
- **Définition :** Un module est un conteneur ou un package regroupant plusieurs cmdlets, fonctions, scripts, fichiers de configuration, ou autres ressources PowerShell.
- **Caractéristiques principales :**
  - Ils permettent de regrouper et d’organiser des fonctionnalités liées dans une structure modulaire.
  - Ils sont utilisés pour étendre les fonctionnalités de PowerShell avec des cmdlets supplémentaires, des fonctions personnalisées, ou des configurations spécifiques.
  - Ils peuvent être importés dans une session PowerShell avec `Import-Module` ou chargés automatiquement si nécessaire.
  - Les modules peuvent être distribués sous forme de fichiers `.psm1` (module de script) ou `.dll` (module binaire).
  - Ils peuvent être téléchargés depuis la **PowerShell Gallery** ou d'autres sources.
- **Exemple :**
  - Module intégré :
    ```powershell
    Import-Module ActiveDirectory  # Charge le module Active Directory
    Get-ADUser -Filter *           # Cmdlet disponible dans le module Active Directory
    ```
  - Création d’un module :
    - Un fichier `MyModule.psm1` :
      ```powershell
      function Say-Hello {
          Write-Output "Hello from MyModule!"
      }
      ```
    - Importation et utilisation :
      ```powershell
      Import-Module MyModule.psm1
      Say-Hello  # Affiche : Hello from MyModule!
      ```

---

### **Différences principales :**
| **Aspect**         | **Cmdlets**                               | **Modules**                             |
|---------------------|-------------------------------------------|-----------------------------------------|
| **Nature**          | Commandes individuelles                  | Conteneurs regroupant cmdlets et autres ressources |
| **But**             | Effectuer une tâche précise              | Étendre les fonctionnalités en regroupant des cmdlets et fonctions |
| **Format**          | Écrites en .NET (cmdlets natives)        | Fichiers `.psm1`, `.dll`, `.psd1`, etc. |
| **Utilisation**     | Directement dans PowerShell              | Nécessite un import explicite ou automatique |
| **Exemple**         | `Get-Process`, `Set-Content`             | `Import-Module Az` (Azure), `ActiveDirectory` |

En résumé, **les cmdlets sont des commandes spécifiques** tandis que **les modules regroupent et organisent plusieurs cmdlets et autres ressources**.