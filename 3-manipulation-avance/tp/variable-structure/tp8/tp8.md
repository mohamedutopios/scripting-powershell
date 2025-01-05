### TP PowerShell : Manipulation Avancée de Variables, Tableaux et Hash Tables (Sans Scripts)

---

### **Exercice 1 : Analyse Avancée des Étudiants**

1. Déclarez un tableau `$Etudiants` contenant les informations suivantes pour 3 étudiants :
   - `Nom`
   - `Classe`
   - `Notes` (tableau de 3 notes pour chaque étudiant).
2. Affichez le **nom** et la **moyenne** de chaque étudiant.
3. Ajoutez une nouvelle note `20` à chaque tableau de notes.
4. Affichez uniquement les étudiants ayant une moyenne supérieure à `15`.

---

### **Exercice 2 : Gestion d'un Stock**

1. Déclarez une hash table `$Stock` représentant l'inventaire suivant :
   - `Ordinateurs` : `10`
   - `Claviers` : `20`
   - `Souris` : `15`
   - `Écrans` : `8`
2. Calculez et affichez la quantité totale de tous les produits.
3. Ajoutez un nouveau produit `Casques` avec une quantité de `12`.
4. Réduisez la quantité de chaque produit de `2` unités sans aller en dessous de `0`.
5. Affichez tous les produits ayant une quantité inférieure à `10`.

---

### **Exercice 3 : Fusion et Tri de Données Client**

1. Déclarez deux tableaux :
   - `$ClientsEurope` avec 2 clients (`Nom`, `Pays`, `Dépenses`).
   - `$ClientsUSA` avec 2 clients (`Nom`, `Pays`, `Dépenses`).
2. Fusionnez ces tableaux en un seul tableau `$TousLesClients`.
3. Triez les clients par leurs dépenses en ordre décroissant.
4. Affichez les 3 clients ayant dépensé le plus.

---

### **Exercice 4 : Collecte d’Informations sur les Fichiers**

1. Listez tous les fichiers `.txt` dans `C:\TP_PowerShell` et créez un tableau `$FichiersInfos` contenant les informations suivantes pour chaque fichier :
   - `Nom`
   - `Taille (Ko)`
   - `Chemin`
2. Affichez la **taille totale** de tous les fichiers `.txt`.
3. Triez et affichez les fichiers par leur taille en ordre croissant.

---

### **Exercice 5 : Gestion et Rapport des Serveurs**

1. Déclarez un tableau `$Serveurs` contenant 3 hash tables représentant des serveurs avec les informations suivantes :
   - `Nom`
   - `IP`
   - `Statut` (Running ou Stopped).
2. Affichez uniquement les serveurs avec un statut **Running**.
3. Changez le statut de tous les serveurs **Stopped** à **Running**.
4. Exportez les informations de tous les serveurs dans un fichier CSV `ServeursReport.csv`.
5. Générez un rapport HTML listant les serveurs triés par leur nom.

---

### **Solutions**

---

#### **Exercice 1 : Analyse Avancée des Étudiants**
```powershell
# Déclarer le tableau
$Etudiants = @(
    @{Nom = "Alice"; Classe = "Maths"; Notes = @(14, 16, 18)}
    @{Nom = "Bob"; Classe = "Physique"; Notes = @(12, 14, 13)}
    @{Nom = "Charlie"; Classe = "Informatique"; Notes = @(15, 17, 19)}
)

# Afficher le nom et la moyenne
$Etudiants | ForEach-Object {
    $Moyenne = ($_.Notes | Measure-Object -Average).Average
    Write-Output "Étudiant : $($_.Nom), Moyenne : $([math]::Round($Moyenne, 2))"
}

# Ajouter une nouvelle note
$Etudiants | ForEach-Object {
    $_.Notes += 20
}

# Filtrer les étudiants avec une moyenne > 15
$Etudiants | Where-Object {
    ($_.Notes | Measure-Object -Average).Average -gt 15
}
```

---

#### **Exercice 2 : Gestion d'un Stock**
```powershell
# Déclarer la hash table
$Stock = @{
    Ordinateurs = 10
    Claviers = 20
    Souris = 15
    Écrans = 8
}

# Quantité totale
($Stock.Values | Measure-Object -Sum).Sum

# Ajouter un produit
$Stock["Casques"] = 12

# Réduire les quantités
$Stock.GetEnumerator() | ForEach-Object {
    $Stock[$_.Key] = [math]::Max(0, $_.Value - 2)
}

# Afficher les produits avec quantité < 10
$Stock.GetEnumerator() | Where-Object { $_.Value -lt 10 }
```

---

#### **Exercice 3 : Fusion et Tri de Données Client**
```powershell
# Déclarer les tableaux
$ClientsEurope = @(
    @{Nom = "Alice"; Pays = "France"; Dépenses = 1200}
    @{Nom = "Bob"; Pays = "Allemagne"; Dépenses = 800}
)
$ClientsUSA = @(
    @{Nom = "Charlie"; Pays = "USA"; Dépenses = 1500}
    @{Nom = "Dave"; Pays = "USA"; Dépenses = 2000}
)

# Fusionner
$TousLesClients = $ClientsEurope + $ClientsUSA

# Trier par dépenses
$TousLesClients = $TousLesClients | Sort-Object -Property Dépenses -Descending

# Afficher les 3 premiers
$TousLesClients | Select-Object -First 3
```

---

#### **Exercice 4 : Collecte d’Informations sur les Fichiers**
```powershell
# Créer un tableau d'informations sur les fichiers
$FichiersInfos = Get-ChildItem -Path "C:\TP_PowerShell" -Filter *.txt -Recurse | ForEach-Object {
    @{
        Nom = $_.Name
        "Taille (Ko)" = [math]::Round($_.Length / 1KB, 2)
        Chemin = $_.FullName
    }
}

# Calculer la taille totale
($FichiersInfos | Measure-Object -Property "Taille (Ko)" -Sum).Sum

# Trier et afficher les fichiers par taille
$FichiersInfos | Sort-Object -Property "Taille (Ko)"
```

---

#### **Exercice 5 : Gestion et Rapport des Serveurs**
```powershell
# Déclarer le tableau
$Serveurs = @(
    @{Nom = "WebServer"; IP = "192.168.1.1"; Statut = "Running"}
    @{Nom = "DBServer"; IP = "192.168.1.2"; Statut = "Stopped"}
    @{Nom = "MailServer"; IP = "192.168.1.3"; Statut = "Stopped"}
)

# Afficher les serveurs Running
$Serveurs | Where-Object { $_.Statut -eq "Running" }

# Changer Stopped en Running
$Serveurs | ForEach-Object {
    if ($_.Statut -eq "Stopped") {
        $_.Statut = "Running"
    }
}

# Exporter en CSV
$Serveurs | Export-Csv -Path "C:\TP_PowerShell\ServeursReport.csv" -NoTypeInformation

# Générer un rapport HTML
$Serveurs | Sort-Object -Property Nom |
    ConvertTo-Html -Property Nom, IP, Statut |
    Out-File -Path "C:\TP_PowerShell\ServeursReport.html"
``` 

Ces exercices vous permettent de travailler sur des tâches complexes avec des structures de données avancées tout en restant dans des commandes directes, sans scripts.