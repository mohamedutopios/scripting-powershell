### **Utilisation des Pipelines pour Chaîner des Cmdlets**

Le pipeline (`|`) est l'un des concepts fondamentaux de PowerShell. Il permet de chaîner plusieurs cmdlets en envoyant la **sortie d’une cmdlet** en **entrée d’une autre cmdlet**, facilitant ainsi des traitements complexes en une seule commande.

---

### **1. Comment fonctionne le pipeline en PowerShell ?**
- PowerShell traite la sortie d’une cmdlet sous forme d’objets (pas du texte brut comme dans d'autres shells).
- Ces objets sont transmis au pipeline et deviennent l’entrée de la cmdlet suivante.
- Cela permet de manipuler directement les propriétés et méthodes des objets.

#### **Syntaxe :**
```powershell
<Cmdlet1> | <Cmdlet2> | <Cmdlet3>
```

---

### **2. Exemples de base avec des pipelines**

#### **Lister, filtrer et trier des fichiers**
1. **Lister les fichiers et dossiers, puis filtrer les fichiers uniquement :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Where-Object {$_.PSIsContainer -eq $false}
   ```

2. **Lister les fichiers `.txt` triés par taille décroissante :**
   ```powershell
   Get-ChildItem -Path C:\Temp -Filter *.txt | Sort-Object -Property Length -Descending
   ```

3. **Lister les 5 plus gros fichiers dans un dossier :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Sort-Object -Property Length -Descending | Select-Object -First 5
   ```

---

### **3. Manipulation des processus**

#### **Afficher les processus consommant beaucoup de CPU :**
```powershell
Get-Process | Where-Object {$_.CPU -gt 10}
```

#### **Trier les processus par mémoire utilisée et afficher les 3 premiers :**
```powershell
Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 3
```

#### **Arrêter tous les processus nommés "notepad" :**
```powershell
Get-Process -Name notepad | Stop-Process
```

---

### **4. Exportation de données**

#### **Exporter la liste des services en cours d’exécution dans un fichier CSV :**
```powershell
Get-Service | Where-Object {$_.Status -eq "Running"} | Export-Csv -Path C:\Temp\Services.csv -NoTypeInformation
```

#### **Exporter les 10 fichiers les plus récents dans un dossier :**
```powershell
Get-ChildItem -Path C:\Temp | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 10 | Export-Csv -Path C:\Temp\RecentFiles.csv -NoTypeInformation
```

---

### **5. Combinaisons avancées**

#### **Rechercher des fichiers spécifiques et en afficher les détails :**
```powershell
Get-ChildItem -Path C:\Projects -Filter *.log -Recurse |
    Where-Object {$_.Length -gt 1MB} |
    Select-Object Name, Length, LastWriteTime
```

#### **Lister les services en cours, trier par nom, et générer un rapport HTML :**
```powershell
Get-Service | Where-Object {$_.Status -eq "Running"} | Sort-Object -Property Name | ConvertTo-Html -Property Name, Status, StartType | Out-File -Path C:\Temp\ServicesReport.html
```

#### **Analyser les journaux d'événements Windows :**
```powershell
Get-EventLog -LogName System | Where-Object {$_.EntryType -eq "Error"} | Select-Object Source, EventID, Message
```

---

### **6. Utilisation avec des scripts personnalisés**

#### **Transformation de données en chaîne avec des fonctions :**
- Les pipelines fonctionnent aussi avec les **scripts personnalisés** et les **fonctions**.

1. **Créer une fonction pour filtrer des fichiers :**
   ```powershell
   function Get-LargeFiles {
       param(
           [string]$Path,
           [int]$Size
       )
       Get-ChildItem -Path $Path -Recurse | Where-Object {$_.Length -gt $Size}
   }
   ```

2. **Utiliser la fonction dans un pipeline :**
   ```powershell
   Get-LargeFiles -Path C:\Temp -Size 100KB | Select-Object Name, Length
   ```

---

### **7. Étapes multiples avec des pipelines**

#### **Pipeline avec plusieurs étapes pour un traitement complexe :**
```powershell
# Étape 1 : Récupérer tous les fichiers
# Étape 2 : Filtrer les fichiers .txt
# Étape 3 : Trier par taille décroissante
# Étape 4 : Afficher les 3 plus gros fichiers
Get-ChildItem -Path C:\Temp |
    Where-Object {$_.Extension -eq ".txt"} |
    Sort-Object -Property Length -Descending |
    Select-Object -First 3
```

---

### **8. Astuces pour travailler avec les pipelines**

#### **Afficher les résultats intermédiaires avec `Write-Output` :**
- Pour déboguer des pipelines complexes, utilisez `Write-Output` ou `Out-Host` pour afficher les résultats intermédiaires.

```powershell
Get-ChildItem -Path C:\Temp |
    Write-Output |
    Where-Object {$_.Length -gt 1MB} |
    Select-Object Name, Length
```

#### **Utiliser des commandes personnalisées dans les pipelines :**
- Les cmdlets personnalisées, comme `ForEach-Object` ou `Select-Object`, peuvent être utilisées pour manipuler ou transformer les objets.

```powershell
Get-ChildItem -Path C:\Temp |
    ForEach-Object { $_.Name.ToUpper() }
```

---

### **Résumé des Cmdlets courantes pour les pipelines**

| Cmdlet             | Description                                          |
|--------------------|------------------------------------------------------|
| `Where-Object`     | Filtrer les objets selon une condition.              |
| `Sort-Object`      | Trier les objets par une ou plusieurs propriétés.    |
| `Select-Object`    | Sélectionner des propriétés ou limiter les résultats.|
| `Export-Csv`       | Exporter les données dans un fichier CSV.            |
| `ConvertTo-Html`   | Convertir les données en tableau HTML.               |
| `Out-File`         | Sauvegarder les résultats dans un fichier texte.     |
| `ForEach-Object`   | Exécuter un script sur chaque objet du pipeline.     |

---

### **Conclusion**
Le pipeline est une fonctionnalité puissante qui permet de chaîner facilement les cmdlets PowerShell pour effectuer des tâches complexes en une seule commande. En combinant des cmdlets comme `Where-Object`, `Sort-Object` et `Select-Object`, vous pouvez manipuler des objets de manière flexible et efficace, rendant l’automatisation encore plus simple.