param([string]$Kommentar, [int]$Sleep)
$clip = Get-Clipboard
$date = Get-Date -UFormat "%H:%M, %d.%m.%Y"
$kommi=""
$sleeptime="3"
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
$output = "Maximilian, $date$kommi"
Write-Output $output | Set-Clipboard
Get-Clipboard
Write-Host "sleep $sleeptime seconds"
Start-Sleep -s $sleeptime
Write-Output $clip | Set-Clipboard
Write-Host sleepover
