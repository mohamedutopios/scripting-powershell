### Démonstrations Complètes : **Création de Scripts PowerShell et Concepts Avancés**

---

### **1. Création de Scripts PowerShell : Bonnes Pratiques et Structure**

#### **Exemple de Script : Gestion Automatisée des Fichiers**
```powershell
# Nom : GestionFichiers.ps1
# Description : Déplace les fichiers d'un dossier source vers un dossier destination en fonction de leur extension.
# Auteur : Admin IT
# Date : 04-01-2025

param(
    [string]$Source = "C:\Source",
    [string]$Destination = "C:\Destination",
    [string]$Extension = "*.txt"
)

try {
    # Vérifier si les chemins existent
    if (-Not (Test-Path $Source)) {
        throw "Le dossier source $Source n'existe pas."
    }

    if (-Not (Test-Path $Destination)) {
        New-Item -Path $Destination -ItemType Directory
        Write-Output "Dossier $Destination créé."
    }

    # Déplacer les fichiers
    $Fichiers = Get-ChildItem -Path $Source -Filter $Extension
    if ($Fichiers.Count -eq 0) {
        Write-Output "Aucun fichier trouvé avec l'extension $Extension dans $Source."
    } else {
        foreach ($Fichier in $Fichiers) {
            Move-Item -Path $Fichier.FullName -Destination $Destination
            Write-Output "Fichier déplacé : $($Fichier.Name)"
        }
    }
} catch {
    Write-Error "Erreur : $_"
} finally {
    Write-Output "Opération terminée."
}
```

---

### **2. Déclaration et Utilisation des Fonctions**

#### **a. Fonction de Création d’Utilisateurs**
```powershell
function CreerUtilisateur {
    param(
        [string]$NomUtilisateur,
        [string]$MotDePasse,
        [string]$Description = "Utilisateur créé par script"
    )
    try {
        $Password = ConvertTo-SecureString $MotDePasse -AsPlainText -Force
        New-LocalUser -Name $NomUtilisateur -Password $Password -Description $Description
        Write-Output "Utilisateur $NomUtilisateur créé avec succès."
    } catch {
        Write-Error "Erreur lors de la création de l'utilisateur : $_"
    }
}

# Appeler la fonction
CreerUtilisateur -NomUtilisateur "JohnDoe" -MotDePasse "P@ssword123"
```

---

#### **b. Fonction de Gestion des Services**
```powershell
function GererService {
    param(
        [string]$NomService,
        [ValidateSet("Start", "Stop", "Restart")] [string]$Action
    )
    try {
        switch ($Action) {
            "Start" { Start-Service -Name $NomService }
            "Stop" { Stop-Service -Name $NomService }
            "Restart" { Restart-Service -Name $NomService }
        }
        Write-Output "Service $NomService $Action avec succès."
    } catch {
        Write-Error "Erreur lors de l'opération sur le service $NomService : $_"
    }
}

# Exemples
GererService -NomService "Spooler" -Action "Restart"
GererService -NomService "W32Time" -Action "Start"
```

---

#### **c. Fonction Générique de Gestion des Permissions**
```powershell
function ModifierPermissions {
    param(
        [string]$Chemin,
        [string]$Utilisateur,
        [ValidateSet("FullControl", "Read", "Write")] [string]$Droits
    )
    try {
        $Acl = Get-Acl -Path $Chemin
        $Rule = New-Object System.Security.AccessControl.FileSystemAccessRule($Utilisateur, $Droits, "Allow")
        $Acl.SetAccessRule($Rule)
        Set-Acl -Path $Chemin -AclObject $Acl
        Write-Output "Permissions $Droits accordées à $Utilisateur sur $Chemin."
    } catch {
        Write-Error "Erreur lors de la modification des permissions : $_"
    }
}

# Exemple
ModifierPermissions -Chemin "C:\Test" -Utilisateur "JohnDoe" -Droits "FullControl"
```

---

### **3. Gestion des Erreurs Avancées**

#### **a. Script pour Vérifier et Archiver des Fichiers**
```powershell
# Archiver des fichiers si le dossier source contient des fichiers
param(
    [string]$Source = "C:\Source",
    [string]$Archive = "C:\Archive\Archive.zip"
)

try {
    if (-Not (Test-Path $Source)) {
        throw "Le dossier source $Source n'existe pas."
    }

    $Fichiers = Get-ChildItem -Path $Source
    if ($Fichiers.Count -eq 0) {
        Write-Output "Aucun fichier à archiver dans $Source."
    } else {
        Compress-Archive -Path $Source\* -DestinationPath $Archive -Force
        Write-Output "Fichiers archivés avec succès dans $Archive."
    }
} catch {
    Write-Error "Erreur : $_"
} finally {
    Write-Output "Opération terminée."
}
```

---

#### **b. Surveillance en Temps Réel d’un Service**
```powershell
function SurveillerService {
    param(
        [string]$NomService,
        [int]$Intervalle = 10
    )
    while ($true) {
        try {
            $Service = Get-Service -Name $NomService
            Write-Output "Statut du service $NomService : $($Service.Status)"
            Start-Sleep -Seconds $Intervalle
        } catch {
            Write-Error "Erreur lors de la surveillance : $_"
        }
    }
}

# Appeler la fonction
SurveillerService -NomService "W32Time" -Intervalle 5
```

---

### **4. Concepts Avancés : Scripts Modulaires**

#### **a. Création d’un Module PowerShell**
1. **Créer un fichier `.psm1` pour contenir les fonctions.**
```powershell
# Nom du fichier : GestionUtilisateurs.psm1

function CreerUtilisateur {
    param(
        [string]$NomUtilisateur,
        [string]$MotDePasse
    )
    $Password = ConvertTo-SecureString $MotDePasse -AsPlainText -Force
    New-LocalUser -Name $NomUtilisateur -Password $Password -Description "Créé via module"
    Write-Output "Utilisateur $NomUtilisateur créé."
}
```

2. **Charger le module et l’utiliser :**
```powershell
Import-Module -Name "C:\Scripts\GestionUtilisateurs.psm1"
CreerUtilisateur -NomUtilisateur "AdminTest" -MotDePasse "Admin@123"
```

---

#### **b. Gestion des Logs dans les Scripts**
```powershell
function AjouterLog {
    param(
        [string]$Message,
        [string]$FichierLog = "C:\Logs\ScriptLog.txt"
    )
    $Date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$Date : $Message" | Out-File -FilePath $FichierLog -Append
}

# Exemple d'utilisation
AjouterLog -Message "Le script a démarré."
AjouterLog -Message "Erreur : Fichier introuvable."
```

---

### **5. Cas Pratique : Rapport Automatisé**

#### **a. Générer un Rapport sur les Processus Gourmands**
```powershell
function GenererRapportProcessus {
    param(
        [string]$CheminRapport = "C:\Rapports\Processus.csv"
    )
    try {
        $Processus = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 10
        $Processus | Export-Csv -Path $CheminRapport -NoTypeInformation
        Write-Output "Rapport généré avec succès : $CheminRapport"
    } catch {
        Write-Error "Erreur lors de la génération du rapport : $_"
    }
}

# Appeler la fonction
GenererRapportProcessus -CheminRapport "C:\Rapports\TopProcessus.csv"
```

---

### **Résumé**

#### **Principes Clés :**
1. Structurer les scripts pour la réutilisabilité.
2. Modulariser le code avec des fonctions ou des modules.
3. Gérer les erreurs avec `Try-Catch-Finally`.
4. Implémenter des logs pour tracer les activités des scripts.
5. Automatiser des tâches complexes avec des boucles et des commandes avancées.

Avec ces exemples et concepts avancés, vous disposez de nombreux outils pour écrire des scripts PowerShell robustes et adaptés à divers scénarios complexes. Si vous avez un cas d’utilisation spécifique, n’hésitez pas à demander !