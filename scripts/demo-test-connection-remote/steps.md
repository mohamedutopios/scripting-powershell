Voici un résumé de toutes les étapes nécessaires pour configurer **WinRM** et exécuter un script PowerShell à distance, couvrant les configurations à effectuer sur la machine locale et sur la VM distante.

---

## **Sur la VM distante (192.168.1.70)**

1. **Activer et configurer WinRM**
   Exécutez ces commandes en tant qu'administrateur sur la VM distante :
   ```powershell
   Enable-PSRemoting -Force
   winrm quickconfig
   ```

   Ces commandes :
   - Démarrent le service WinRM.
   - Configurent WinRM pour écouter sur le port HTTP (5985).

2. **Configurer le pare-feu**
   Autorisez les connexions entrantes pour WinRM via HTTP (port 5985) :
   ```powershell
   Set-NetFirewallRule -Name "WINRM-HTTP-In-TCP" -Enabled True
   ```

3. **Ajouter l'utilisateur au groupe Remote Management Users**
   Assurez-vous que l'utilisateur utilisé pour la connexion distante appartient au groupe **Remote Management Users** :
   ```powershell
   Add-LocalGroupMember -Group "Remote Management Users" -Member "Administrator"
   ```

   Si vous utilisez un autre compte, remplacez `"Administrator"` par le nom de cet utilisateur.

4. **Autoriser les connexions non sécurisées (optionnel)**
   Si vous ne configurez pas HTTPS, autorisez les connexions non sécurisées (HTTP) sur la VM distante :
   ```powershell
   winrm set winrm/config/service @{AllowUnencrypted="true"}
   ```

5. **Redémarrer le service WinRM**
   Redémarrez le service WinRM pour appliquer toutes les configurations :
   ```powershell
   Restart-Service WinRM
   ```

6. **Vérifier l’état de WinRM**
   Assurez-vous que WinRM est correctement configuré en exécutant :
   ```powershell
   winrm enumerate winrm/config/listener
   ```

   Vous devriez voir une configuration pour **Transport = HTTP**.

---

## **Sur la machine locale**

1. **Activer et configurer WinRM localement**
   Configurez WinRM pour qu'il fonctionne sur votre machine locale :
   ```powershell
   winrm quickconfig
   ```

2. **Ajouter la machine distante à TrustedHosts**
   Si vous ne travaillez pas dans un domaine ou n'utilisez pas Kerberos, ajoutez l'adresse IP de la machine distante aux TrustedHosts :
   ```powershell
   Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value "192.168.1.70" -Force
   ```

   Pour vérifier que l’adresse a été ajoutée :
   ```powershell
   Get-Item -Path WSMan:\localhost\Client\TrustedHosts
   ```

3. **Tester la connexion WinRM**
   Testez si vous pouvez vous connecter à la machine distante via WinRM :
   ```powershell
   Test-WSMan -ComputerName "192.168.1.70"
   ```

   Si cette commande réussit, WinRM est prêt pour une utilisation distante.

---

## **Exécution du script PowerShell**

Voici un script fonctionnel pour récupérer les services en cours d'exécution sur la machine distante :

### Script PowerShell
```powershell
# Variables
$remoteComputer = "192.168.1.70"
$remoteUser = "WIN-79JIHNKCUUM\Administrator"
$password = Read-Host "Entrez le mot de passe pour $remoteUser" -AsSecureString
$credential = New-Object System.Management.Automation.PSCredential($remoteUser, $password)

# Test de connectivité
if (Test-Connection -ComputerName $remoteComputer -Count 2 -Quiet) {
    Write-Host "Connexion réseau réussie avec $remoteComputer"

    # Récupérer la liste des services en cours d'exécution
    Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock {
        Get-Service | Where-Object { $_.Status -eq 'Running' }
    }
} else {
    Write-Host "Impossible de se connecter au réseau de $remoteComputer"
}
```

---

## **Points de vérification en cas de problème**

1. **Test de connectivité réseau**
   - Assurez-vous que la machine locale peut ping la machine distante :
     ```powershell
     Test-Connection -ComputerName "192.168.1.70"
     ```

2. **Permissions utilisateur**
   - L'utilisateur utilisé pour la connexion doit être membre des groupes **Remote Management Users** et, idéalement, **Administrators** sur la machine distante.

3. **Pare-feu**
   - Vérifiez que le port **5985** est ouvert sur les deux machines.

4. **WinRM activé sur les deux machines**
   - Testez les connexions WinRM avec :
     ```powershell
     Test-WSMan -ComputerName "192.168.1.70"
     ```

5. **Connexion non sécurisée ou HTTPS**
   - Si vous n’utilisez pas Kerberos, configurez TrustedHosts ou configurez HTTPS pour des connexions sécurisées.

---

Avec ces étapes correctement suivies, votre script PowerShell devrait fonctionner pour récupérer la liste des services en cours d'exécution sur la machine distante. 😊