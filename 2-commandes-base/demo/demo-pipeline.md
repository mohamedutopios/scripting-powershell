Voici une série d'exemples sur **l'utilisation des pipelines dans PowerShell**, allant de la base à des cas plus complexes.

---

### **1. Introduction simple au pipeline**
Le pipeline (`|`) permet de transférer la sortie d'une commande en entrée d'une autre.

```powershell
# Lister les fichiers d'un répertoire et les trier par nom
Get-ChildItem | Sort-Object -Property Name
```

---

### **2. Filtrer la sortie**
Ajoutez un filtre pour n'afficher que certains éléments.

```powershell
# Lister les fichiers et afficher uniquement ceux modifiés dans les 7 derniers jours
Get-ChildItem | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) }
```

---

### **3. Compter les objets**
Compter le nombre de fichiers dans un répertoire.

```powershell
# Compter les fichiers
Get-ChildItem | Measure-Object
```

---

### **4. Sélectionner des colonnes spécifiques**
Afficher des colonnes spécifiques avec `Select-Object`.

```powershell
# Lister les fichiers avec leur nom et leur taille uniquement
Get-ChildItem | Select-Object Name, Length
```

---

### **5. Exporter les résultats**
Envoyez la sortie dans un fichier CSV pour une utilisation ultérieure.

```powershell
# Exporter les noms et tailles de fichiers dans un CSV
Get-ChildItem | Select-Object Name, Length | Export-Csv -Path "C:\Demo\files.csv" -NoTypeInformation
```

---

### **6. Combiner plusieurs étapes**
Chaîner plusieurs cmdlets pour créer un flux de travail.

```powershell
# Lister les fichiers, filtrer ceux de plus de 1 Mo, puis trier par taille décroissante
Get-ChildItem | Where-Object { $_.Length -gt 1MB } | Sort-Object -Property Length -Descending
```

---

### **7. Transformer les données**
Modifier les objets dans le pipeline avec `ForEach-Object`.

```powershell
# Ajouter un préfixe "File:" devant chaque nom de fichier
Get-ChildItem | ForEach-Object { "File: $($_.Name)" }
```

---

### **8. Recherche dans un fichier texte**
Rechercher des lignes spécifiques dans un fichier.

```powershell
# Trouver toutes les lignes contenant "Error" dans un fichier
Get-Content -Path "C:\Demo\log.txt" | Where-Object { $_ -match "Error" }
```

---

### **9. Regrouper les données**
Utilisez `Group-Object` pour regrouper les objets selon une propriété.

```powershell
# Grouper les fichiers par extension
Get-ChildItem | Group-Object Extension
```

---

### **10. Utiliser le pipeline avec des alias**
Les alias fonctionnent aussi avec les pipelines.

```powershell
# Utiliser 'ls' comme alias pour 'Get-ChildItem'
ls | Where-Object { $_.Length -gt 1MB }
```

---

### **11. Gérer les erreurs dans un pipeline**
Utilisez `-ErrorAction` pour gérer les erreurs dans un pipeline.

```powershell
# Ignorer les erreurs pendant une recherche de fichiers
Get-ChildItem -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Extension -eq ".log" }
```

---

### **12. Filtrer avec des conditions complexes**
Utilisez des expressions plus complexes dans `Where-Object`.

```powershell
# Fichiers modifiés il y a moins de 7 jours et dont la taille est > 500 Ko
Get-ChildItem | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) -and $_.Length -gt 500KB }
```

---

### **13. Fusionner deux pipelines**
Combinez les sorties de plusieurs pipelines avec `+`.

```powershell
# Fusionner deux ensembles de fichiers
(Get-ChildItem -Path "C:\Folder1") + (Get-ChildItem -Path "C:\Folder2")
```

---

### **14. Trouver des différences entre deux ensembles**
Comparer deux ensembles d'objets.

```powershell
# Trouver les fichiers présents dans Folder1 mais pas dans Folder2
Compare-Object -ReferenceObject (Get-ChildItem -Path "C:\Folder1") -DifferenceObject (Get-ChildItem -Path "C:\Folder2")
```

---

### **15. Ajouter des propriétés personnalisées**
Ajoutez des propriétés aux objets dans le pipeline.

```powershell
# Ajouter une propriété personnalisée "SizeInKB" à chaque fichier
Get-ChildItem | Select-Object Name, Length, @{Name="SizeInKB"; Expression={ $_.Length / 1KB }}
```

---

### **16. Gérer des sous-dossiers récursivement**
Explorez les sous-dossiers avec le pipeline.

```powershell
# Rechercher tous les fichiers .txt dans un dossier et ses sous-dossiers
Get-ChildItem -Recurse | Where-Object { $_.Extension -eq ".txt" }
```

---

### **17. Trier et limiter les résultats**
Limiter le nombre de résultats avec `Select-Object`.

```powershell
# Obtenir les 5 fichiers les plus volumineux
Get-ChildItem -Recurse | Sort-Object -Property Length -Descending | Select-Object -First 5
```

---

### **18. Calculer la taille totale d’un dossier**
Utilisez `Measure-Object` pour calculer des statistiques.

```powershell
# Calculer la taille totale d’un dossier
Get-ChildItem -Recurse | Measure-Object -Property Length -Sum
```

---

### **19. Créer un rapport détaillé**
Générez un rapport sur les fichiers d’un dossier.

```powershell
# Créer un rapport détaillé au format CSV
Get-ChildItem -Recurse | Select-Object Name, Length, LastWriteTime | Export-Csv -Path "C:\Demo\report.csv" -NoTypeInformation
```

---

### **20. Utiliser un pipeline avec une fonction personnalisée**
Ajoutez des fonctions personnalisées dans le pipeline.

```powershell
# Fonction pour ajouter un suffixe à chaque fichier
function Add-Suffix {
    param ($Suffix)
    process {
        $_.Name + $Suffix
    }
}

# Utiliser la fonction dans un pipeline
Get-ChildItem | Add-Suffix -Suffix "_processed"
```

---

### **21. Pipeline conditionnel**
Ajoutez des conditions pour modifier le comportement.

```powershell
# Ajouter un message si aucun fichier n'est trouvé
Get-ChildItem | Where-Object { $_.Length -gt 1MB } | ForEach-Object {
    if ($_) {
        "File: $($_.Name)"
    } else {
        "No large files found."
    }
}
```

---

### **22. Chaîner un traitement complexe**
Combinez tri, filtrage, et transformations dans un seul pipeline.

```powershell
# Lister les fichiers > 1 Mo, trier par taille décroissante, ajouter une propriété personnalisée, et exporter
Get-ChildItem -Recurse |
    Where-Object { $_.Length -gt 1MB } |
    Sort-Object -Property Length -Descending |
    Select-Object Name, Length, @{Name="SizeInMB"; Expression={ $_.Length / 1MB }} |
    Export-Csv -Path "C:\Demo\large_files_report.csv" -NoTypeInformation
```

---

Ces exemples montrent comment tirer parti des pipelines en PowerShell pour automatiser des tâches simples ou complexes. Si vous avez un cas d'utilisation spécifique, dites-le-moi, et je peux fournir un exemple adapté !