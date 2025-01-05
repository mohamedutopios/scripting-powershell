### Démonstrations Complètes : **Gestion des Comptes Utilisateurs et Permissions avec PowerShell**

Voici une série d'exemples, organisés par niveau de difficulté croissant, pour gérer les **comptes utilisateurs locaux**, les **permissions** et les **utilisateurs Active Directory**.

---

### **1. Gestion des Utilisateurs Locaux**

#### **a. Créer un utilisateur local (basique)**
```powershell
# Créer un utilisateur avec un mot de passe
$Password = ConvertTo-SecureString "P@ssword123" -AsPlainText -Force
New-LocalUser -Name "TestUser" -Password $Password -FullName "User Test" -Description "Compte utilisateur pour test"
```

---

#### **b. Modifier les propriétés d’un utilisateur**
```powershell
# Modifier la description d'un utilisateur
Set-LocalUser -Name "TestUser" -Description "Compte modifié pour test"
```

---

#### **c. Désactiver ou activer un compte utilisateur**
```powershell
# Désactiver un utilisateur
Disable-LocalUser -Name "TestUser"

# Réactiver un utilisateur
Enable-LocalUser -Name "TestUser"
```

---

#### **d. Supprimer un utilisateur**
```powershell
# Supprimer un utilisateur local
Remove-LocalUser -Name "TestUser"
```

---

#### **e. Lister tous les utilisateurs locaux**
```powershell
# Lister les utilisateurs locaux avec leurs statuts
Get-LocalUser | Format-Table Name, FullName, Enabled
```

---

### **2. Gestion des Groupes Locaux**

#### **a. Ajouter un utilisateur à un groupe**
```powershell
# Ajouter un utilisateur local au groupe Administrateurs
Add-LocalGroupMember -Group "Administrators" -Member "TestUser"
```

---

#### **b. Retirer un utilisateur d’un groupe**
```powershell
# Retirer un utilisateur du groupe Administrateurs
Remove-LocalGroupMember -Group "Administrators" -Member "TestUser"
```

---

#### **c. Lister les membres d’un groupe**
```powershell
# Lister les membres du groupe Administrateurs
Get-LocalGroupMember -Group "Administrators"
```

---

### **3. Gestion des Permissions de Fichiers et Dossiers**

#### **a. Vérifier les permissions**
```powershell
# Obtenir les permissions d’un dossier
Get-Acl -Path "C:\TestFolder"
```

---

#### **b. Ajouter une permission**
```powershell
# Ajouter une permission "Contrôle total" pour un utilisateur
$Acl = Get-Acl -Path "C:\TestFolder"
$Rule = New-Object System.Security.AccessControl.FileSystemAccessRule("TestUser", "FullControl", "Allow")
$Acl.SetAccessRule($Rule)
Set-Acl -Path "C:\TestFolder" -AclObject $Acl
```

---

#### **c. Supprimer une permission**
```powershell
# Supprimer une règle d'accès pour un utilisateur
$Rule = New-Object System.Security.AccessControl.FileSystemAccessRule("TestUser", "FullControl", "Allow")
$Acl.RemoveAccessRule($Rule)
Set-Acl -Path "C:\TestFolder" -AclObject $Acl
```

---

### **4. Gestion des Utilisateurs dans Active Directory**

#### **Pré-requis :**
- Installer le module Active Directory avec RSAT (Outils d’administration distants).

```powershell
# Installer le module Active Directory sur Windows
Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0
```

---

#### **a. Lister les utilisateurs Active Directory**
```powershell
# Obtenir tous les utilisateurs AD
Get-ADUser -Filter * | Select-Object Name, SamAccountName, Enabled
```

---

#### **b. Créer un nouvel utilisateur AD**
```powershell
# Créer un utilisateur dans une Unité d’Organisation spécifique
$Password = ConvertTo-SecureString "P@ssword123" -AsPlainText -Force
New-ADUser -Name "John Doe" -SamAccountName "jdoe" -UserPrincipalName "jdoe@domain.local" `
           -Path "OU=Users,DC=domain,DC=local" -AccountPassword $Password -Enabled $true
```

---

#### **c. Modifier les propriétés d’un utilisateur AD**
```powershell
# Modifier le titre et le département d’un utilisateur
Set-ADUser -Identity "jdoe" -Title "Développeur" -Department "Informatique"
```

---

#### **d. Ajouter un utilisateur à un groupe AD**
```powershell
# Ajouter un utilisateur au groupe Administrateurs
Add-ADGroupMember -Identity "Administrateurs" -Members "jdoe"
```

---

#### **e. Supprimer un utilisateur AD**
```powershell
# Supprimer un utilisateur AD
Remove-ADUser -Identity "jdoe"
```

---

### **5. Cas Pratique : Gestion Dynamique des Comptes**

#### **a. Création en masse d’utilisateurs locaux**
```powershell
# Liste des utilisateurs à créer
$Utilisateurs = @(
    @{Name = "User1"; FullName = "Utilisateur 1"; Password = "P@ssword1"}
    @{Name = "User2"; FullName = "Utilisateur 2"; Password = "P@ssword2"}
)

# Création des comptes
foreach ($User in $Utilisateurs) {
    $Password = ConvertTo-SecureString $User.Password -AsPlainText -Force
    New-LocalUser -Name $User.Name -Password $Password -FullName $User.FullName -Description "Compte créé par script"
}
```

---

#### **b. Ajouter en masse des utilisateurs à un groupe**
```powershell
# Ajouter une liste d’utilisateurs au groupe Administrateurs
$Users = @("User1", "User2")
foreach ($User in $Users) {
    Add-LocalGroupMember -Group "Administrators" -Member $User
}
```

---

#### **c. Générer un rapport des permissions**
```powershell
# Récupérer les permissions d’un dossier et les exporter en CSV
$Acl = Get-Acl -Path "C:\TestFolder"
$Acl.Access | Select-Object IdentityReference, FileSystemRights, AccessControlType | Export-Csv -Path "C:\PermissionsReport.csv" -NoTypeInformation
```

---

### **6. Exemple Complet : Gestion Active Directory**

#### **Scénario : Créer un département informatique**
```powershell
# Créer des utilisateurs pour le département IT
$ITUsers = @(
    @{Name = "Alice"; SamAccountName = "alice"; Title = "IT Manager"}
    @{Name = "Bob"; SamAccountName = "bob"; Title = "IT Support"}
)

foreach ($User in $ITUsers) {
    $Password = ConvertTo-SecureString "P@ssword123" -AsPlainText -Force
    New-ADUser -Name $User.Name -SamAccountName $User.SamAccountName `
               -UserPrincipalName "$($User.SamAccountName)@domain.local" `
               -Title $User.Title -Path "OU=IT,DC=domain,DC=local" `
               -AccountPassword $Password -Enabled $true
}

# Ajouter les utilisateurs au groupe "IT Team"
$UserSamAccounts = $ITUsers | ForEach-Object { $_.SamAccountName }
Add-ADGroupMember -Identity "IT Team" -Members $UserSamAccounts
```

---

### **Résumé des Cmdlets**

#### **Utilisateurs Locaux**
| Cmdlet                | Description                                    |
|-----------------------|------------------------------------------------|
| `New-LocalUser`       | Crée un nouvel utilisateur local.              |
| `Set-LocalUser`       | Modifie les propriétés d’un utilisateur local. |
| `Remove-LocalUser`    | Supprime un utilisateur local.                 |
| `Add-LocalGroupMember`| Ajoute un utilisateur à un groupe.             |

#### **Active Directory**
| Cmdlet                | Description                                    |
|-----------------------|------------------------------------------------|
| `New-ADUser`          | Crée un utilisateur AD.                        |
| `Set-ADUser`          | Modifie les propriétés d’un utilisateur AD.    |
| `Add-ADGroupMember`   | Ajoute un utilisateur à un groupe AD.          |

---

### **Conclusion**
Ces démonstrations illustrent comment PowerShell facilite la gestion des utilisateurs et des permissions, à la fois localement et dans Active Directory. Les cmdlets proposées permettent de créer, gérer, et automatiser des tâches complexes, simplifiant ainsi l’administration système. Si vous souhaitez approfondir un cas spécifique, faites-le-moi savoir !