### Démonstration complète et progressive : **Déclaration et Utilisation de Variables en PowerShell**

---

#### **1. Déclaration et Utilisation Simples de Variables**

##### Déclaration et affichage de variables :
```powershell
# Déclaration
$Nom = "Alice"
$Age = 30
$Ville = "Paris"

# Affichage
Write-Output "Nom : $Nom"
Write-Output "Âge : $Age"
Write-Output "Ville : $Ville"
```

##### Modification des valeurs :
```powershell
$Ville = "Lyon"
Write-Output "Nouvelle ville : $Ville"
```

##### Utilisation de variables dans des opérations :
```powershell
$Nombre1 = 10
$Nombre2 = 20
$Somme = $Nombre1 + $Nombre2
Write-Output "La somme est : $Somme"
```

---

#### **2. Variables Automatiques**

##### Découverte des variables système :
```powershell
# Répertoire personnel de l'utilisateur
Write-Output "HOME : $HOME"

# Dernières erreurs rencontrées
Write-Output "Erreurs : $Error"

# Version PowerShell
Write-Output "Version PowerShell : $($PSVersionTable.PSVersion)"
```

---

#### **3. Typage des Variables**

##### Déclaration explicite :
```powershell
[string]$Prenom = "John"
[int]$Age = 28
[bool]$EstAdmin = $true

Write-Output "Prénom : $Prenom"
Write-Output "Âge : $Age"
Write-Output "Administrateur : $EstAdmin"
```

##### Conversion de types :
```powershell
$Chaine = "42"
$Entier = [int]$Chaine
Write-Output "Conversion en entier : $Entier"

$Nombre = 3.14
$Texte = [string]$Nombre
Write-Output "Conversion en chaîne : $Texte"
```

---

#### **4. Tableaux Simples**

##### Création et manipulation d'un tableau :
```powershell
# Déclaration
$Nombres = @(1, 2, 3, 4, 5)

# Accès aux éléments
Write-Output "Premier élément : $($Nombres[0])"
Write-Output "Dernier élément : $($Nombres[-1])"

# Ajouter un élément
$Nombres += 6
Write-Output "Nouveau tableau : $Nombres"
```

##### Itération sur les éléments :
```powershell
foreach ($Nombre in $Nombres) {
    Write-Output "Élément : $Nombre"
}
```

##### Filtrage :
```powershell
# Obtenir les nombres supérieurs à 3
$Nombres | Where-Object { $_ -gt 3 }
```

---

#### **5. Tableaux Associatifs (Hash Tables)**

##### Déclaration et manipulation :
```powershell
# Déclaration
$Infos = @{
    Nom = "Alice"
    Ville = "Paris"
    Age = 30
}

# Accès par clé
Write-Output "Nom : $($Infos['Nom'])"
Write-Output "Ville : $($Infos.Ville)"

# Ajouter une clé
$Infos.Pays = "France"
Write-Output "Pays : $($Infos.Pays)"
```

##### Itération :
```powershell
foreach ($Cle in $Infos.Keys) {
    Write-Output "$Cle : $($Infos[$Cle])"
}
```

---

#### **6. Scénario Intermédiaire : Gestion de Produits**

##### Déclaration d’un tableau contenant des hash tables :
```powershell
$Produits = @(
    @{ID = 1; Nom = "Ordinateur"; Prix = 800}
    @{ID = 2; Nom = "Clavier"; Prix = 50}
    @{ID = 3; Nom = "Souris"; Prix = 25}
)
```

##### Afficher tous les produits :
```powershell
foreach ($Produit in $Produits) {
    Write-Output "ID: $($Produit.ID), Nom: $($Produit.Nom), Prix: $($Produit.Prix)€"
}
```

##### Ajouter un nouveau produit :
```powershell
$NouveauProduit = @{ID = 4; Nom = "Écran"; Prix = 200}
$Produits += $NouveauProduit
Write-Output "Produits après ajout : $Produits"
```

##### Filtrer les produits à plus de 100€ :
```powershell
$Produits | Where-Object { $_.Prix -gt 100 }
```

---

#### **7. Cas Avancé : Générer un Rapport Serveur**

##### Déclaration des serveurs :
```powershell
$Serveurs = @(
    @{Nom = "WebServer"; IP = "192.168.1.10"; Statut = "Actif"}
    @{Nom = "DBServer"; IP = "192.168.1.20"; Statut = "Inactif"}
    @{Nom = "MailServer"; IP = "192.168.1.30"; Statut = "Actif"}
)
```

##### Afficher le rapport des serveurs :
```powershell
foreach ($Serveur in $Serveurs) {
    Write-Output "Nom : $($Serveur.Nom), IP : $($Serveur.IP), Statut : $($Serveur.Statut)"
}
```

##### Filtrer les serveurs actifs :
```powershell
$Serveurs | Where-Object { $_.Statut -eq "Actif" }
```

##### Exporter le rapport en CSV :
```powershell
$Serveurs | Export-Csv -Path "C:\Demo\Rapport_Serveurs.csv" -NoTypeInformation
```

---

#### **8. Exemple Final : Gestion Dynamique**

##### Générer des variables à la volée :
```powershell
for ($i = 1; $i -le 3; $i++) {
    Set-Variable -Name "Utilisateur$i" -Value "Utilisateur_$i"
}

Write-Output $Utilisateur1
Write-Output $Utilisateur2
Write-Output $Utilisateur3
```

##### Manipuler dynamiquement des produits :
```powershell
$Produits = @()
for ($i = 1; $i -le 5; $i++) {
    $Produits += @{ID = $i; Nom = "Produit$i"; Prix = 10 * $i}
}

$Produits | ForEach-Object { Write-Output "ID: $($_.ID), Nom: $($_.Nom), Prix: $($_.Prix)€" }
```

---

### **Résumé des Concepts Utilisés**
| Concept                  | Exemple                                   |
|--------------------------|-------------------------------------------|
| Déclaration de variables | `$Nom = "Alice"`                         |
| Variables automatiques   | `$PSVersionTable`, `$Error`              |
| Typage explicite         | `[int]$Nombre = 42`                      |
| Tableaux simples         | `$Tableau = @(1, 2, 3)`                  |
| Hash tables              | `$Hash = @{Clé = "Valeur"}`              |
| Scénarios complexes      | Gestion de produits et rapports serveurs |

---

### **Conclusion**
Cette démonstration couvre les bases et monte progressivement en complexité pour montrer la puissance de PowerShell dans la gestion des données grâce aux variables, tableaux et hash tables. Si vous avez un cas d’utilisation spécifique à approfondir, faites-le-moi savoir !