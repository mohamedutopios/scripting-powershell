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

# SurveillerService -NomService "W32Time" -Intervalle 5