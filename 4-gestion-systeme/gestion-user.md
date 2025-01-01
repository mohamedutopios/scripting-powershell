### **Gestion des Comptes Utilisateurs et Permissions avec PowerShell**

---

### **1. Création et Gestion des Comptes Utilisateurs Locaux**

Pour gérer les utilisateurs locaux, PowerShell utilise les cmdlets du module `Microsoft.PowerShell.LocalAccounts`. Ce module est disponible à partir de Windows 10 et Windows Server 2016.

#### **a. Création d’un utilisateur local**

##### **Cmdlet : `New-LocalUser`**
- Permet de créer un utilisateur local.

##### **Syntaxe :**
```powershell
New-LocalUser -Name <NomUtilisateur> -Password <MotDePasse> [-FullName <NomComplet>] [-Description <Description>]
```

##### **Exemple :**
```powershell
$Password = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force
New-LocalUser -Name "UtilisateurTest" -Password $Password -FullName "Utilisateur de Test" -Description "Compte utilisateur de test"
```

---

#### **b. Modification d’un utilisateur local**

##### **Cmdlet : `Set-LocalUser`**
- Permet de modifier les propriétés d’un utilisateur local.

##### **Syntaxe :**
```powershell
Set-LocalUser -Name <NomUtilisateur> [-Password <MotDePasse>] [-Description <Description>]
```

##### **Exemple :**
```powershell
Set-LocalUser -Name "UtilisateurTest" -Description "Compte modifié"
```

---

#### **c. Suppression d’un utilisateur local**

##### **Cmdlet : `Remove-LocalUser`**
- Permet de supprimer un utilisateur local.

##### **Syntaxe :**
```powershell
Remove-LocalUser -Name <NomUtilisateur>
```

##### **Exemple :**
```powershell
Remove-LocalUser -Name "UtilisateurTest"
```

---

#### **d. Lister les utilisateurs locaux**

##### **Cmdlet : `Get-LocalUser`**
- Liste les utilisateurs locaux sur la machine.

##### **Syntaxe :**
```powershell
Get-LocalUser
```

##### **Exemple :**
```powershell
Get-LocalUser | Format-Table Name, FullName, Enabled
```

---

### **2. Modification des Permissions avec PowerShell**

Pour gérer les permissions sur des fichiers, des dossiers ou d’autres ressources, PowerShell utilise les cmdlets associées au module `NTFS` ou à l’API .NET via les classes ACL.

#### **a. Récupérer les permissions d’un fichier ou dossier**

##### **Cmdlet : `Get-Acl`**
- Permet de récupérer les informations ACL d’un fichier ou d’un dossier.

##### **Syntaxe :**
```powershell
Get-Acl -Path <Chemin>
```

##### **Exemple :**
```powershell
Get-Acl -Path "C:\DossierTest"
```

---

#### **b. Modifier les permissions**

##### **Cmdlet : `Set-Acl`**
- Applique une liste de contrôle d’accès (ACL) à un fichier ou dossier.

##### **Syntaxe :**
```powershell
$Acl = Get-Acl -Path <Chemin>
$Acl.SetAccessRule(<RègleAccès>)
Set-Acl -Path <Chemin> -AclObject $Acl
```

##### **Exemple :**
1. **Créer une règle d’accès :**
   ```powershell
   $Acl = Get-Acl -Path "C:\DossierTest"
   $Règle = New-Object System.Security.AccessControl.FileSystemAccessRule("UtilisateurTest", "FullControl", "Allow")
   $Acl.SetAccessRule($Règle)
   Set-Acl -Path "C:\DossierTest" -AclObject $Acl
   ```

2. **Supprimer une règle d’accès :**
   ```powershell
   $Règle = New-Object System.Security.AccessControl.FileSystemAccessRule("UtilisateurTest", "FullControl", "Allow")
   $Acl.RemoveAccessRule($Règle)
   Set-Acl -Path "C:\DossierTest" -AclObject $Acl
   ```

---

### **3. Introduction à Active Directory**

Active Directory (AD) est un service annuaire utilisé pour gérer les utilisateurs, groupes et ressources dans un environnement réseau. PowerShell offre des cmdlets via le module **Active Directory** (module AD).

#### **a. Installation du module Active Directory**

1. **Sur un contrôleur de domaine Windows Server :**
   ```powershell
   Install-WindowsFeature -Name RSAT-AD-PowerShell
   ```

2. **Sur un poste Windows 10/11 ou Windows Server :**
   - Installer les outils d’administration distants (RSAT) via les fonctionnalités facultatives :
     ```powershell
     Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0
     ```

---

#### **b. Cmdlets pour gérer les objets Active Directory**

| Cmdlet                 | Description                                        |
|------------------------|----------------------------------------------------|
| `Get-ADUser`           | Récupère des informations sur un utilisateur.      |
| `New-ADUser`           | Crée un nouvel utilisateur dans AD.                |
| `Set-ADUser`           | Modifie les propriétés d’un utilisateur AD.        |
| `Remove-ADUser`        | Supprime un utilisateur de l’Active Directory.     |
| `Get-ADGroup`          | Récupère des informations sur un groupe.           |
| `Add-ADGroupMember`    | Ajoute un utilisateur ou un objet à un groupe.     |
| `Get-ADComputer`       | Récupère des informations sur un ordinateur AD.    |

---

#### **c. Exemples Pratiques**

##### **1. Lister tous les utilisateurs d’un domaine :**
```powershell
Get-ADUser -Filter * | Select-Object Name, SamAccountName, Enabled
```

##### **2. Créer un nouvel utilisateur :**
```powershell
New-ADUser -Name "UtilisateurAD" -SamAccountName "UtilisateurAD" -UserPrincipalName "utilisateur@domaine.local" -Path "OU=Utilisateurs,DC=domaine,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) -Enabled $true
```

##### **3. Ajouter un utilisateur à un groupe :**
```powershell
Add-ADGroupMember -Identity "Administrateurs" -Members "UtilisateurAD"
```

##### **4. Modifier les informations d’un utilisateur :**
```powershell
Set-ADUser -Identity "UtilisateurAD" -Title "Développeur" -Department "Informatique"
```

##### **5. Supprimer un utilisateur :**
```powershell
Remove-ADUser -Identity "UtilisateurAD"
```

---

### **Résumé**

#### **Gestion des utilisateurs locaux :**
| Cmdlet            | Description                                    |
|-------------------|------------------------------------------------|
| `New-LocalUser`   | Crée un utilisateur local.                     |
| `Set-LocalUser`   | Modifie un utilisateur local.                  |
| `Remove-LocalUser`| Supprime un utilisateur local.                 |
| `Get-LocalUser`   | Liste les utilisateurs locaux.                 |

#### **Gestion des permissions :**
| Cmdlet            | Description                                    |
|-------------------|------------------------------------------------|
| `Get-Acl`         | Récupère les permissions d’un fichier/dossier. |
| `Set-Acl`         | Modifie les permissions d’un fichier/dossier.  |

#### **Active Directory :**
| Cmdlet            | Description                                    |
|-------------------|------------------------------------------------|
| `Get-ADUser`      | Liste ou récupère un utilisateur AD.           |
| `New-ADUser`      | Crée un nouvel utilisateur dans AD.            |
| `Set-ADUser`      | Modifie les propriétés d’un utilisateur AD.    |
| `Add-ADGroupMember`| Ajoute un utilisateur à un groupe AD.         |

---

### **Conclusion**
PowerShell est un outil puissant pour gérer les utilisateurs locaux, les permissions et les objets Active Directory. Ces cmdlets permettent d’automatiser des tâches complexes, de simplifier l’administration système et de centraliser la gestion des utilisateurs et des ressources réseau.