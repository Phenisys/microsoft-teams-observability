
$User = "YOURDOMAIN\youruser"
$Credential = Get-Credential -UserName $User -Message "Enter your password for $User"
$PlainPassword = $Credential.GetNetworkCredential().Password

$Action = New-ScheduledTaskAction -Execute "YourPath\Phenisys\Agent_MSTeams_windows_x64.exe" -Argument '--config "YourPath\Phenisys\config.yaml"'

$Trigger = New-ScheduledTaskTrigger -AtStartup

$Settings = New-ScheduledTaskSettingsSet `
            -ExecutionTimeLimit (New-TimeSpan -Days 3) `
            -StartWhenAvailable:$true `
            -MultipleInstances "IgnoreNew" -RunOnlyIfIdle:$false

$Principal = New-ScheduledTaskPrincipal -UserId $User -LogonType Password -RunLevel Highest

$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings -Principal $Principal

Register-ScheduledTask -TaskName "MSTeamsObservabilityAgent" -InputObject $Task -User $Credential.UserName -Password $PlainPassword -Force