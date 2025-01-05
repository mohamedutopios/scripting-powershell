### Démonstrations avancées : **Déclaration et Utilisation de Variables en PowerShell**

---

### **1. Manipulation Basique de Variables**

#### Déclarer et utiliser des variables simples :
```powershell
# Déclaration
$Utilisateur = "John Doe"
$Age = 28
$EstAdmin = $true

# Utilisation
Write-Output "Nom : $Utilisateur"
Write-Output "Âge : $Age"
Write-Output "Admin : $EstAdmin"
```

#### Modifier une variable existante :
```powershell
$Utilisateur = "Jane Doe"
Write-Output "Nouvelle valeur : $Utilisateur"
```

---

### **2. Découvrir les Variables Automatiques**

#### Exemple avec `$Error`, `$HOME`, `$PSVersionTable` :
```powershell
# Liste des erreurs récentes
Write-Output "Erreurs : $Error"

# Répertoire personnel
Write-Output "Dossier utilisateur : $HOME"

# Version de PowerShell
$Version = $PSVersionTable.PSVersion
Write-Output "Version PowerShell : $Version"
```

---

### **3. Variables typées explicitement**

#### Déclarer avec des types spécifiques :
```powershell
[string]$Nom = "Alice"
[int]$Nombre = 42
[boolean]$EstActif = $true

Write-Output "Nom : $Nom"
Write-Output "Nombre : $Nombre"
Write-Output "Actif : $EstActif"
```

#### Vérifier le type d’une variable :
```powershell
$Variable = 3.14
Write-Output "Type : $($Variable.GetType().Name)"
```

---

### **4. Tableaux Simples et Opérations**

#### Créer et manipuler des tableaux :
```powershell
# Déclaration
$Nombres = @(10, 20, 30, 40)

# Accès aux éléments
Write-Output "Premier élément : $($Nombres[0])"
Write-Output "Dernier élément : $($Nombres[-1])"

# Ajouter un élément
$Nombres += 50
Write-Output "Nouveau tableau : $Nombres"

# Nombre d'éléments
Write-Output "Nombre d'éléments : $($Nombres.Count)"
```

---

### **5. Tableaux Associatifs (Hash Tables)**

#### Créer une hash table et accéder à ses valeurs :
```powershell
# Déclaration
$Infos = @{
    Nom = "Alice"
    Ville = "Paris"
    Âge = 30
}

# Accès
Write-Output "Nom : $($Infos['Nom'])"
Write-Output "Âge : $($Infos.Âge)"

# Ajouter une clé
$Infos.Pays = "France"
Write-Output "Nouveau contenu : $Infos"
```

#### Itérer sur une hash table :
```powershell
foreach ($Clé in $Infos.Keys) {
    Write-Output "$Clé : $($Infos[$Clé])"
}
```

---

### **6. Manipulations Avancées avec des Tableaux Associatifs**

#### Utiliser un tableau contenant des hash tables :
```powershell
# Déclaration
$Produits = @(
    @{Nom = "Ordinateur"; Prix = 800}
    @{Nom = "Clavier"; Prix = 50}
    @{Nom = "Souris"; Prix = 25}
)

# Afficher les produits
foreach ($Produit in $Produits) {
    Write-Output "Produit : $($Produit.Nom), Prix : $($Produit.Prix)€"
}

# Ajouter un produit
$Produits += @{Nom = "Écran"; Prix = 200}
Write-Output "Produits après ajout : $Produits"
```

#### Filtrer des éléments du tableau :
```powershell
# Produits à plus de 100 €
$Produits | Where-Object { $_.Prix -gt 100 }
```

---

### **7. Conversion et Manipulation des Types**

#### Conversion explicite entre types :
```powershell
# Convertir une chaîne en entier
$String = "42"
$Int = [int]$String
Write-Output "Type : $($Int.GetType().Name), Valeur : $Int"

# Convertir un nombre en chaîne
$Nombre = 100
$Texte = [string]$Nombre
Write-Output "Texte : $Texte"
```

#### Convertir des données complexes :
```powershell
# Convertir une hash table en JSON
$Infos = @{Nom="Alice"; Âge=30; Ville="Paris"}
$Json = $Infos | ConvertTo-Json
Write-Output "Données JSON : $Json"

# Convertir un JSON en hash table
$HashTable = $Json | ConvertFrom-Json
Write-Output "Données converties : $HashTable"
```

---

### **8. Cas Pratique : Gestion des Utilisateurs**

#### Gestion d’un tableau d’utilisateurs :
```powershell
# Tableau d'utilisateurs
$Utilisateurs = @(
    @{Nom = "Alice"; Rôle = "Admin"; Actif = $true}
    @{Nom = "Bob"; Rôle = "Utilisateur"; Actif = $false}
    @{Nom = "Eve"; Rôle = "Admin"; Actif = $true}
)

# Afficher les administrateurs actifs
$Utilisateurs | Where-Object { $_.Rôle -eq "Admin" -and $_.Actif }
```

---

### **9. Déclaration Dynamique**

#### Générer des variables à la volée :
```powershell
# Créer des variables dynamiques
for ($i = 1; $i -le 3; $i++) {
    Set-Variable -Name "Utilisateur$i" -Value "User$i"
}

# Accéder aux variables générées
Write-Output $Utilisateur1
Write-Output $Utilisateur2
Write-Output $Utilisateur3
```

---

### **10. Exemple Final : Rapport Automatisé**

#### Scénario : Générer un rapport sur des serveurs :
```powershell
# Déclaration des serveurs
$Serveurs = @(
    @{Nom = "WebServer1"; IP = "192.168.1.10"; Statut = "OK"}
    @{Nom = "DBServer1"; IP = "192.168.1.20"; Statut = "Dégradé"}
    @{Nom = "MailServer1"; IP = "192.168.1.30"; Statut = "OK"}
)

# Générer un rapport
foreach ($Serveur in $Serveurs) {
    Write-Output "Nom : $($Serveur.Nom), IP : $($Serveur.IP), Statut : $($Serveur.Statut)"
}

# Exporter le rapport en CSV
$Serveurs | Export-Csv -Path "C:\Demo\Rapport_Serveurs.csv" -NoTypeInformation
```

---

### **Résumé des Concepts Abordés**
| Concept                  | Exemple                                   |
|--------------------------|-------------------------------------------|
| Déclaration de variables | `$Nom = "Alice"`                         |
| Types de données         | `[int]$Nombre = 42`                      |
| Tableaux simples         | `$Tableau = @(1, 2, 3)`                  |
| Hash tables              | `$Hash = @{Clé = "Valeur"}`              |
| Conversion de types      | `[int]"42"`                              |
| Scénarios complexes      | Gestion d'inventaires ou rapports        |

---

Ces exemples montrent comment utiliser les variables en PowerShell, des bases aux scénarios avancés, en intégrant tableaux et hash tables pour une gestion efficace des données. Si vous avez un contexte spécifique, je peux fournir des exemples adaptés.