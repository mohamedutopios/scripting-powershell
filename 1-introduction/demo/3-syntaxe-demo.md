Voici une série de démonstrations pratiques et des commandes variées pour explorer la syntaxe PowerShell à travers les concepts de **cmdlets**, **pipelines** et **objets**.

---

### **1. Découverte des cmdlets**
#### Afficher toutes les cmdlets disponibles :
```powershell
Get-Command
```

#### Rechercher une cmdlet spécifique (ex. : "process") :
```powershell
Get-Command *process*
```

#### Afficher l'aide pour une cmdlet :
```powershell
Get-Help Get-Process
```

#### Exemple : Liste des processus en cours :
```powershell
Get-Process
```

#### Créer un dossier :
```powershell
New-Item -Path 'C:\Documents and Settings\mohamed\Documents\toto' -ItemType Directory
mkdir -Name toto -Path 'C:\Documents and Settings\mohamed\Documents\'
```

#### Créer un fichier dans le dossier créé :
```powershell
New-Item -Path C:\DemoFolder\example.txt -ItemType File
new-item -Path 'C:\Documents and Settings\mohamed\Documents\test-powershell' -ItemType Directory
new-item -Path 'C:\Documents and Settings\mohamed\Documents\test-powershell' -ItemType File -Name toto.txt
Set-Location -Path 'C:\Documents and Settings\mohamed\Documents\test-powershell' 

```

---

### **2. Utilisation des pipelines**
#### Trier les fichiers d'un dossier par taille :
```powershell
Get-ChildItem -Path C:\Windows\System32 | Sort-Object Length
```

#### Filtrer les fichiers avec une taille supérieure à 1 Mo :
```powershell
Get-ChildItem -Path C:\Windows\System32 | Where-Object {$_.Length -gt 1MB}
```

#### Exporter les fichiers filtrés dans un fichier CSV :
```powershell
Get-ChildItem -Path C:\Windows\System32 | 
    Where-Object {$_.Length -gt 1MB} | 
    Select-Object Name, Length | 
    Export-Csv -Path C:\DemoFolder\LargeFiles.csv -NoTypeInformation
```

#### Lister les 5 processus utilisant le plus de mémoire :
```powershell
Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 5 Name, WorkingSet
```

---

### **3. Exploration et manipulation des objets**
#### Découvrir les propriétés et méthodes d’un objet :
```powershell
Get-Process | Get-Member
```

#### Accéder aux propriétés spécifiques d’un objet :
```powershell
Get-Process | Select-Object Name, CPU
```

#### Exemple : Filtrer les processus consommant plus de 10% de CPU :
```powershell
Get-Process | Where-Object {$_.CPU -gt 10}
```

#### Appeler une méthode d’un objet (ex. : arrêter un processus) :
```powershell
Get-Process notepad | ForEach-Object { $_.Kill() }
```

#### Modifier un objet (ex. : changer un attribut d’un service) :
```powershell
$service = Get-Service -Name Spooler
$service | Select-Object Name, Status
```

---

### **4. Combinaisons cmdlets, pipelines et objets**
#### Exemple 1 : Rapport sur les services en cours d’exécution
```powershell
Get-Service | 
    Where-Object {$_.Status -eq "Running"} | 
    Select-Object Name, Status, StartType | 
    Export-Csv -Path C:\DemoFolder\RunningServices.csv -NoTypeInformation
```

#### Exemple 2 : Rapports sur les disques logiques
```powershell
Get-PSDrive | 
    Where-Object {$_.Free -gt 1GB} | 
    Select-Object Name, Used, Free, Provider | 
    Format-Table -AutoSize
```

#### Exemple 3 : Analyse des fichiers d’un répertoire
```powershell
Get-ChildItem -Path C:\DemoFolder -Recurse | 
    Where-Object {$_.Extension -eq ".txt"} | 
    Select-Object Name, Length, LastWriteTime | 
    Format-Table -AutoSize
```

---

### **5. Manipulation avancée avec les pipelines**
#### Filtrer les fichiers et copier les résultats dans un autre dossier :
```powershell
Get-ChildItem -Path C:\Windows\System32 | 
    Where-Object {$_.Extension -eq ".exe"} | 
    Copy-Item -Destination C:\DemoFolder
```

#### Compter le nombre de processus en cours d'exécution :
```powershell
(Get-Process).Count
```

#### Supprimer les fichiers d’un dossier sous certaines conditions :
```powershell
Get-ChildItem -Path C:\DemoFolder | 
    Where-Object {$_.Length -lt 1KB} | 
    Remove-Item
```

#### Trouver les fichiers les plus récents dans un répertoire :
```powershell
Get-ChildItem -Path C:\DemoFolder | 
    Sort-Object LastWriteTime -Descending | 
    Select-Object -First 5
```

---

### **6. Bonnes pratiques pour la découverte des cmdlets et des objets**
#### Trouver les cmdlets liées à un module spécifique :
```powershell
Get-Command -Module Microsoft.PowerShell.Management
```

#### Explorer les membres d’un type d’objet particulier :
```powershell
Get-Process | Get-Member -MemberType Property
```

#### Obtenir un aperçu rapide d’un objet :
```powershell
Get-Process | Select-Object -First 1 | Format-List *
```

---

### **7. Scripts pratiques combinant ces concepts**
#### Script pour surveiller l’utilisation mémoire et envoyer une alerte
```powershell
$threshold = 100MB

Get-Process | 
    Where-Object {$_.WorkingSet -gt $threshold} | 
    ForEach-Object {
        Write-Host "Attention : $($_.Name) consomme $($_.WorkingSet / 1MB) Mo !" -ForegroundColor Red
    }
```

#### Script pour créer une archive des fichiers récents
```powershell
$source = "C:\DemoFolder"
$destination = "C:\DemoFolder\Archive.zip"

Get-ChildItem -Path $source | 
    Where-Object {$_.LastWriteTime -gt (Get-Date).AddDays(-7)} | 
    Compress-Archive -DestinationPath $destination
```

---

### **Résumé des commandes essentielles**
| **Commande**                             | **Description**                                                        |
|------------------------------------------|------------------------------------------------------------------------|
| `Get-Help`                               | Affiche l’aide pour une cmdlet.                                         |
| `Get-Command`                            | Liste toutes les cmdlets disponibles.                                   |
| `Get-Process`                            | Liste les processus en cours.                                           |
| `Get-Member`                             | Affiche les propriétés et méthodes des objets.                          |
| `Select-Object`                          | Sélectionne des propriétés spécifiques d’un objet.                      |
| `Where-Object`                           | Filtre les objets selon une condition.                                  |
| `Sort-Object`                            | Trie les objets selon une propriété.                                    |
| `Export-Csv`                             | Exporte les objets dans un fichier CSV.                                 |
| `Compress-Archive`                       | Crée une archive ZIP des fichiers.                                      |
| `Remove-Item`                            | Supprime des fichiers ou objets.                                        |
| `New-Item`                               | Crée des fichiers ou dossiers.                                          |
| `Copy-Item`                              | Copie des fichiers ou objets.                                           |

---

Ces démonstrations mettent en lumière la puissance de PowerShell pour automatiser des tâches, explorer les objets et manipuler les données efficacement. Si vous souhaitez approfondir des aspects spécifiques, faites-le-moi savoir !