Voici un tableau synthétique des **composants de base de PowerShell** :

| **Composant**         | **Description**                                                                 | **Exemple**                                                                                 |
|------------------------|---------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| **Shell interactif**   | Interface pour exécuter des commandes et scripts.                              | `Write-Host "Hello, PowerShell!"`                                                          |
| **Cmdlets**            | Commandes de base suivant le modèle `Verbe-Nom`.                               | `Get-Process`, `Set-Item`                                                                  |
| **Pipelines**          | Chaînage de commandes, en passant les objets entre elles.                     | `Get-Process | Sort-Object CPU -Descending`                                                |
| **Objets**             | Sortie des cmdlets sous forme d'objets .NET avec propriétés et méthodes.       | `$process = Get-Process; $process[0].Name`                                                |
| **Fichiers de script** | Scripts PowerShell (.ps1) contenant des séquences de commandes.               | `Write-Host "Bonjour !"` (dans un fichier `Example.ps1`)                                   |
| **Modules**            | Collections de cmdlets, fonctions et scripts pour des tâches spécifiques.     | `Import-Module Az`                                                                         |
| **Providers**          | Accès uniforme aux magasins de données (fichiers, registre, etc.).            | `Get-ChildItem -Path HKLM:\Software`                                                      |
| **Variables**          | Stockage de données ou d’objets avec `$NomVariable`.                          | `$name = "Alice"; Write-Host $name`                                                       |
| **Fonctions**          | Groupes de commandes réutilisables, avec paramètres optionnels.               | `function Greet { param([string]$Name) Write-Host "Hello, $Name!" }`                       |
| **Gestion des erreurs**| Gestion structurée des erreurs avec `try/catch/finally` ou `Get-Error`.       | `try { Get-Item "InvalidPath" } catch { Write-Host "Erreur : $($_.Exception.Message)" }`   |
| **Remote PowerShell**  | Exécution de commandes sur des machines distantes via PowerShell Remoting.    | `Invoke-Command -ComputerName Server01 -ScriptBlock { Get-Service }`                      |
| **Integrated Scripting Environment (ISE)** | Environnement graphique pour écrire et tester des scripts (remplacé par VS Code). | Utilisation d'outils modernes comme Visual Studio Code pour éditer et exécuter des scripts.|

Ce tableau synthétise les principaux concepts pour une compréhension rapide et une référence pratique.