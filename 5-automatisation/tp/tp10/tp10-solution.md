

### **1. Gestion des Utilisateurs Locaux**

#### **Solution :**
```powershell
function AjouterUtilisateur {
    param (
        [string]$NomUtilisateur,
        [string]$MotDePasse
    )
    try {
        New-LocalUser -Name $NomUtilisateur -Password (ConvertTo-SecureString $MotDePasse -AsPlainText -Force) -FullName $NomUtilisateur
        Write-Output "Utilisateur $NomUtilisateur créé avec succès."
    } catch {
        Write-Output "Erreur : Impossible de créer l'utilisateur $NomUtilisateur. $_"
    }
}

function SupprimerUtilisateur {
    param (
        [string]$NomUtilisateur
    )
    try {
        Remove-LocalUser -Name $NomUtilisateur
        Write-Output "Utilisateur $NomUtilisateur supprimé avec succès."
    } catch {
        Write-Output "Erreur : Impossible de supprimer l'utilisateur $NomUtilisateur. $_"
    }
}

function ListerUtilisateurs {
    try {
        Get-LocalUser
    } catch {
        Write-Output "Erreur : Impossible de lister les utilisateurs. $_"
    }
}

# Exemple d'utilisation
AjouterUtilisateur -NomUtilisateur "TestUser" -MotDePasse "P@ssw0rd!"
ListerUtilisateurs
SupprimerUtilisateur -NomUtilisateur "TestUser"
```

---

### **2. Gestion des Services Windows**

#### **Solution :**
```powershell
function GererService {
    param (
        [string]$NomService
    )
    try {
        $etat = Get-Service -Name $NomService
        if ($etat.Status -ne "Running") {
            Write-Output "Le service $NomService est arrêté. Redémarrage en cours..."
            Start-Service -Name $NomService
            Write-Output "Le service $NomService a été redémarré avec succès."
        } else {
            Write-Output "Le service $NomService est déjà en cours d'exécution."
        }
    } catch {
        Write-Output "Erreur : Impossible de gérer le service $NomService. $_"
    }
}

# Exemple d'utilisation
GererService -NomService "Spooler"
```

---

### **3. Gestion de Fichiers et Rapports**

#### **Solution :**
```powershell
function AnalyserDossier {
    param (
        [string]$CheminDossier
    )
    try {
        if (-Not (Test-Path $CheminDossier)) {
            throw "Le dossier $CheminDossier n'existe pas."
        }

        $fichiers = Get-ChildItem -Path $CheminDossier -File | Select-Object Name, Length
        $rapport = $fichiers | Sort-Object Length -Descending | Select-Object -First 5

        $tailleTotale = ($fichiers | Measure-Object Length -Sum).Sum
        $rapport | Export-Csv -Path "$CheminDossier\rapport.csv" -NoTypeInformation

        Write-Output "Rapport généré dans $CheminDossier\rapport.csv"
        Write-Output "Taille totale des fichiers : $tailleTotale bytes"
    } catch {
        Write-Output "Erreur : $_"
    }
}

# Exemple d'utilisation
AnalyserDossier -CheminDossier "C:\Temp"
```

---

### **4. Lecture et Validation de Fichiers**

#### **Solution :**
```powershell
function ValiderFichier {
    param (
        [string]$CheminFichier,
        [string]$Lettre
    )
    try {
        if (-Not (Test-Path $CheminFichier)) {
            throw "Le fichier $CheminFichier n'existe pas."
        }

        $contenu = Get-Content $CheminFichier
        if (-Not $contenu) {
            throw "Le fichier est vide."
        }

        $nomsValides = $contenu | Where-Object { $_ -like "$Lettre*" }
        $nomsValides | Set-Content -Path "$CheminFichier-validé.txt"

        Write-Output "Fichier validé créé : $CheminFichier-validé.txt"
    } catch {
        Write-Output "Erreur : $_"
    }
}

# Exemple d'utilisation
ValiderFichier -CheminFichier "C:\Temp\noms.txt" -Lettre "A"
```

---

### **5. Automatisation avec Try-Catch-Finally**

#### **Solution :**
```powershell
function CopierRenommerSupprimer {
    param (
        [string]$Source,
        [string]$Destination,
        [string]$NouveauNom
    )
    try {
        if (-Not (Test-Path $Source)) {
            throw "Le fichier source $Source n'existe pas."
        }

        Copy-Item -Path $Source -Destination $Destination
        Rename-Item -Path (Join-Path $Destination (Split-Path $Source -Leaf)) -NewName $NouveauNom
        Remove-Item -Path $Source

        Write-Output "Fichier copié, renommé et supprimé avec succès."
    } catch {
        Write-Output "Erreur : $_"
    } finally {
        Write-Output "Nettoyage terminé."
    }
}

# Exemple d'utilisation
CopierRenommerSupprimer -Source "C:\Temp\source.txt" -Destination "C:\Temp\Backup" -NouveauNom "renommé.txt"
```

---

### **6. Fonction Réutilisable pour les Logs**

#### **Solution :**
```powershell
function GererLogs {
    param (
        [string]$FichierLog,
        [string]$Action,
        [string]$Message
    )
    try {
        switch ($Action) {
            "Ajouter" {
                $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                "$timestamp : $Message" | Add-Content -Path $FichierLog
            }
            "Lire" {
                Get-Content -Path $FichierLog
            }
            "Nettoyer" {
                $dateLimite = (Get-Date).AddDays(-7)
                $contenu = Get-Content -Path $FichierLog | Where-Object { ($_ -match "^\d{4}-\d{2}-\d{2}") -and ([datetime]($_ -split " ")[0]) -gt $dateLimite }
                $contenu | Set-Content -Path $FichierLog
            }
        }
    } catch {
        Write-Output "Erreur : $_"
    }
}

# Exemple d'utilisation
GererLogs -FichierLog "C:\Temp\app.log" -Action "Ajouter" -Message "Log initial."
GererLogs -FichierLog "C:\Temp\app.log" -Action "Lire"
GererLogs -FichierLog "C:\Temp\app.log" -Action "Nettoyer"
```

