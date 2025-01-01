### **Création de Scripts PowerShell et Concepts Avancés**

---

### **1. Création de Scripts PowerShell : Structure et Bonnes Pratiques**

#### **Structure d’un script PowerShell**
1. **Introduction et informations** :
   - Utiliser des commentaires pour expliquer le script.
   - Ajouter des métadonnées sur le script.
   ```powershell
   # Nom : ScriptExemple.ps1
   # Description : Automatisation des tâches système.
   # Auteur : Votre Nom
   # Date : 31-12-2024
   ```

2. **Importation des modules nécessaires** :
   ```powershell
   Import-Module ActiveDirectory
   ```

3. **Déclaration des paramètres** :
   - Utiliser la section `Param` pour des entrées dynamiques.
   ```powershell
   param(
       [string]$NomUtilisateur,
       [int]$NombreIterations
   )
   ```

4. **Logique principale** :
   - Ajouter des blocs logiques bien séparés pour les différentes tâches.

5. **Gestion des erreurs** :
   - Intégrer des blocs `Try-Catch-Finally` pour capturer les erreurs.

6. **Retour et sortie** :
   - Utiliser des messages clairs ou des fichiers de log.

---

#### **Bonnes pratiques**
1. **Nommer les scripts de manière descriptive** :
   - Exemple : `CréerUtilisateurAD.ps1`.

2. **Utiliser des commentaires** :
   ```powershell
   # Cette section configure les permissions pour un dossier.
   ```

3. **Éviter le code en dur** :
   - Utiliser des paramètres dynamiques ou des fichiers de configuration.

4. **Tester les scripts en environnement contrôlé**.

5. **Utiliser la sortie structurée (CSV, JSON)** pour les données générées.

---

### **Exemple de script simple : Gestion des utilisateurs locaux**
```powershell
# Script : AjouterUtilisateur.ps1
# Description : Crée un utilisateur local avec des paramètres personnalisés.

param(
    [string]$NomUtilisateur,
    [string]$MotDePasse
)

try {
    # Convertir le mot de passe en chaîne sécurisée
    $Password = ConvertTo-SecureString $MotDePasse -AsPlainText -Force

    # Créer l'utilisateur
    New-LocalUser -Name $NomUtilisateur -Password $Password -FullName "Utilisateur $NomUtilisateur" -Description "Compte créé via script"

    Write-Output "Utilisateur $NomUtilisateur créé avec succès."
} catch {
    Write-Error "Erreur lors de la création de l'utilisateur : $_"
}
```

---

### **2. Introduction aux Fonctions PowerShell**

#### **Déclaration d’une fonction**
- Les fonctions encapsulent des blocs de code réutilisables.

##### **Syntaxe :**
```powershell
function <NomFonction> {
    param(
        [Type]$Param1,
        [Type]$Param2
    )
    <Instructions>
    return <Valeur>
}
```

---

#### **Exemples pratiques**

##### **a. Fonction sans paramètre**
```powershell
function DireBonjour {
    Write-Output "Bonjour, PowerShell !"
}
DireBonjour
```

##### **b. Fonction avec paramètres**
```powershell
function Addition {
    param(
        [int]$Nombre1,
        [int]$Nombre2
    )
    return $Nombre1 + $Nombre2
}
$Resultat = Addition -Nombre1 10 -Nombre2 5
Write-Output "Résultat : $Resultat"
```

##### **c. Fonction avec valeur par défaut**
```powershell
function DireBonjour {
    param(
        [string]$Nom = "Utilisateur"
    )
    Write-Output "Bonjour, $Nom !"
}
DireBonjour
DireBonjour -Nom "Alice"
```

##### **d. Fonction réutilisable pour gérer des services**
```powershell
function RedemarrerService {
    param(
        [string]$NomService
    )
    try {
        Restart-Service -Name $NomService -Force
        Write-Output "Le service $NomService a été redémarré."
    } catch {
        Write-Error "Erreur lors du redémarrage du service $NomService : $_"
    }
}
RedemarrerService -NomService "Spooler"
```

---

### **3. Gestion des Erreurs avec `Try-Catch-Finally`**

PowerShell permet de gérer les erreurs avec les blocs `Try-Catch-Finally`.

---

#### **Structure de base**
```powershell
try {
    # Bloc où une erreur peut survenir
    <Instructions>
} catch {
    # Bloc exécuté en cas d'erreur
    Write-Error "Une erreur est survenue : $_"
} finally {
    # Bloc exécuté dans tous les cas (optionnel)
    Write-Output "Opération terminée."
}
```

---

#### **Exemples pratiques**

##### **a. Gestion d’une erreur simple**
```powershell
try {
    # Suppression d’un fichier inexistant
    Remove-Item -Path "C:\Inexistant.txt" -ErrorAction Stop
} catch {
    Write-Error "Erreur : $_"
} finally {
    Write-Output "Bloc Finally exécuté."
}
```

---

##### **b. Valider un chemin avant d’accéder à un fichier**
```powershell
function LireFichier {
    param(
        [string]$CheminFichier
    )
    try {
        if (-Not (Test-Path $CheminFichier)) {
            throw "Le fichier $CheminFichier n'existe pas."
        }

        $Contenu = Get-Content -Path $CheminFichier
        Write-Output "Contenu du fichier :"
        Write-Output $Contenu
    } catch {
        Write-Error "Erreur : $_"
    }
}

LireFichier -CheminFichier "C:\Inexistant.txt"
```

---

##### **c. Blocs imbriqués pour des scénarios complexes**
```powershell
try {
    Write-Output "Début de l'opération."
    # Exemple de tentative d'exécution
    try {
        $Resultat = 10 / 0  # Erreur intentionnelle
    } catch {
        throw "Erreur dans l'opération interne : $_"
    }
} catch {
    Write-Error "Une erreur majeure est survenue : $_"
} finally {
    Write-Output "Nettoyage en cours..."
}
```

---

### **Résumé des Concepts**

| Concept                  | Description                                    |
|--------------------------|------------------------------------------------|
| **Scripts**              | Code réutilisable, structuré en fichiers `.ps1`. |
| **Fonctions**            | Blocs de code réutilisables, avec ou sans paramètres. |
| **Try-Catch-Finally**    | Gestion robuste des erreurs dans PowerShell.   |

---

### **Conclusion**
- Les scripts bien structurés et les fonctions permettent d’écrire un code modulaire, clair et réutilisable.
- La gestion des erreurs avec `Try-Catch-Finally` garantit la stabilité des scripts en capturant les problèmes de manière proactive.
- En combinant ces techniques, vous pouvez créer des solutions PowerShell robustes adaptées à des scénarios complexes.