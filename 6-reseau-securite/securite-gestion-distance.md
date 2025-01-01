### **PowerShell Avancé : Remoting, Sécurisation et Automatisation**

---

### **1. Utilisation de PowerShell Remoting**

PowerShell Remoting permet d'exécuter des commandes ou des scripts sur des machines distantes. Il utilise généralement le protocole **WS-Management** via WinRM.

#### **a. Activer PowerShell Remoting**

1. **Activer le Remoting sur la machine locale :**
   ```powershell
   Enable-PSRemoting -Force
   ```

2. **Configurer la confiance mutuelle pour les machines non-domainées (optionnel) :**
   - Ajouter les machines distantes dans la liste des hôtes de confiance :
     ```powershell
     Set-Item WSMan:\localhost\Client\TrustedHosts -Value "NomMachineOuIP"
     ```

3. **Vérifier l’état de WinRM :**
   ```powershell
   Get-Service WinRM
   ```

---

#### **b. Exécuter des commandes à distance**

1. **Exécuter une commande sur une machine distante :**
   ```powershell
   Invoke-Command -ComputerName "NomMachine" -ScriptBlock { Get-Service }
   ```

2. **Passer des informations d'identification :**
   ```powershell
   $Credentials = Get-Credential
   Invoke-Command -ComputerName "NomMachine" -Credential $Credentials -ScriptBlock { Get-Process }
   ```

3. **Exécuter un script complet sur une machine distante :**
   ```powershell
   Invoke-Command -ComputerName "NomMachine" -FilePath "C:\Scripts\MonScript.ps1"
   ```

---

#### **c. Sessions distantes persistantes**

1. **Créer une session distante :**
   ```powershell
   $Session = New-PSSession -ComputerName "NomMachine"
   ```

2. **Exécuter des commandes dans une session :**
   ```powershell
   Invoke-Command -Session $Session -ScriptBlock { Get-Date }
   ```

3. **Fermer la session :**
   ```powershell
   Remove-PSSession -Session $Session
   ```

---

### **2. Sécurisation des Scripts PowerShell**

#### **a. Exécution restreinte**

PowerShell utilise des stratégies d’exécution pour sécuriser les scripts.

1. **Vérifier la stratégie actuelle :**
   ```powershell
   Get-ExecutionPolicy
   ```

2. **Changer la stratégie :**
   - **Restreindre totalement :**
     ```powershell
     Set-ExecutionPolicy Restricted
     ```
   - **Autoriser les scripts signés :**
     ```powershell
     Set-ExecutionPolicy AllSigned
     ```
   - **Autoriser tous les scripts :**
     ```powershell
     Set-ExecutionPolicy Unrestricted
     ```

3. **Exécuter un script temporairement avec bypass :**
   ```powershell
   PowerShell.exe -ExecutionPolicy Bypass -File "C:\Scripts\MonScript.ps1"
   ```

---

#### **b. Signatures de script**

1. **Créer ou obtenir un certificat de signature :**
   - Créer un certificat auto-signé :
     ```powershell
     New-SelfSignedCertificate -CertStoreLocation Cert:\CurrentUser\My -Subject "CN=ScriptSigning"
     ```

2. **Signer un script :**
   ```powershell
   Set-AuthenticodeSignature -FilePath "C:\Scripts\MonScript.ps1" -Certificate (Get-Item Cert:\CurrentUser\My\<Thumbprint>)
   ```

3. **Vérifier la signature :**
   ```powershell
   Get-AuthenticodeSignature -FilePath "C:\Scripts\MonScript.ps1"
   ```

---

### **3. Gestion des Certificats et du Chiffrement**

#### **a. Gestion des certificats**

1. **Lister les certificats :**
   ```powershell
   Get-ChildItem Cert:\CurrentUser\My
   ```

2. **Exporter un certificat :**
   ```powershell
   Export-Certificate -Cert (Get-Item Cert:\CurrentUser\My\<Thumbprint>) -FilePath "C:\Certificats\MonCert.cer"
   ```

3. **Supprimer un certificat :**
   ```powershell
   Remove-Item Cert:\CurrentUser\My\<Thumbprint>
   ```

---

#### **b. Chiffrement et déchiffrement**

1. **Chiffrer un texte avec une clé sécurisée :**
   ```powershell
   $Texte = "Message secret"
   $Clé = New-Object byte[] 16
   [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Clé)
   $TexteChiffré = [System.Security.Cryptography.ProtectedData]::Protect([Text.Encoding]::UTF8.GetBytes($Texte), $Clé, [System.Security.Cryptography.DataProtectionScope]::CurrentUser)
   ```

2. **Déchiffrer le texte :**
   ```powershell
   $TexteDéchiffré = [Text.Encoding]::UTF8.GetString([System.Security.Cryptography.ProtectedData]::Unprotect($TexteChiffré, $Clé, [System.Security.Cryptography.DataProtectionScope]::CurrentUser))
   ```

---

### **4. Cas Pratique : Automatisation d'une Tâche Complète**

#### **Contexte**
Créer un script PowerShell pour :
- Planifier une tâche de sauvegarde.
- Chiffrer les fichiers sauvegardés.
- Générer un rapport HTML des sauvegardes.

---

#### **Script Exemple : Sauvegarde et Rapport**

```powershell
# Script : AutomatisationSauvegarde.ps1

# 1. Configuration des variables
$Source = "C:\Dossiers"
$Destination = "D:\Sauvegardes"
$Rapport = "D:\Rapports\RapportSauvegarde.html"
$Clé = New-Object byte[] 16
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Clé)

# 2. Sauvegarde des fichiers
Write-Output "Démarrage de la sauvegarde..."
Copy-Item -Path $Source\* -Destination $Destination -Recurse

# 3. Chiffrement des fichiers
Write-Output "Chiffrement des fichiers sauvegardés..."
foreach ($Fichier in Get-ChildItem -Path $Destination) {
    $Contenu = [Text.Encoding]::UTF8.GetBytes((Get-Content -Path $Fichier.FullName -Raw))
    $ContenuChiffré = [System.Security.Cryptography.ProtectedData]::Protect($Contenu, $Clé, [System.Security.Cryptography.DataProtectionScope]::CurrentUser)
    [IO.File]::WriteAllBytes($Fichier.FullName, $ContenuChiffré)
}

# 4. Génération du rapport HTML
Write-Output "Génération du rapport..."
$RapportData = Get-ChildItem -Path $Destination | Select-Object Name, LastWriteTime, Length
$RapportData | ConvertTo-Html -Title "Rapport de Sauvegarde" | Out-File -FilePath $Rapport

Write-Output "Rapport généré : $Rapport"

# 5. Planification de la tâche
Write-Output "Planification de la tâche..."
$Trigger = New-ScheduledTaskTrigger -Daily -At "02:00AM"
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Scripts\AutomatisationSauvegarde.ps1"
Register-ScheduledTask -TaskName "SauvegardeQuotidienne" -Trigger $Trigger -Action $Action -Description "Sauvegarde quotidienne automatique"
```

---

### **Résumé**

| Fonctionnalité                    | Cmdlet / Méthode                                      |
|-----------------------------------|------------------------------------------------------|
| **PowerShell Remoting**           | `Enable-PSRemoting`, `Invoke-Command`, `New-PSSession` |
| **Sécurisation des scripts**      | `Set-ExecutionPolicy`, `Set-AuthenticodeSignature`   |
| **Gestion des certificats**       | `Get-ChildItem Cert:\`, `Export-Certificate`         |
| **Chiffrement et déchiffrement**  | `ProtectedData` avec .NET                           |
| **Planification de tâches**       | `New-ScheduledTask`, `Register-ScheduledTask`        |

---

### **Conclusion**
Avec PowerShell, vous pouvez automatiser des tâches complexes de bout en bout tout en assurant la sécurité et la fiabilité de vos scripts. En combinant remoting, signatures, chiffrement et planification, vous créez des solutions robustes et sécurisées pour vos besoins d'administration.