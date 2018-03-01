param([string]$Kommentar, [int]$Sleep)

# Default Sleep Time #
$sleeptime="3"

# Default Name #
$name = "Maximilian"

$clip = Get-Clipboard
$date = Get-Date -UFormat "%H:%M, %d.%m.%Y"
$kommi=""
if($Kommentar -ne "")
{
	$kommi=", $Kommentar"
}
if($Sleep -ne "")
{
	$sleeptime=$Sleep
}
elseif($Kommentar -match "^\d+$")
{
	$sleeptime=$Kommentar
	$kommi=""
}
$output = "$name, $date$kommi"
Write-Output $output | Set-Clipboard
Write-Host 
Get-Clipboard
Write-Host 
Write-Host "+++ sleep $sleeptime seconds +++"
Start-Sleep -s $sleeptime
Write-Output $clip | Set-Clipboard
Write-Host "+++ sleepover +++"
