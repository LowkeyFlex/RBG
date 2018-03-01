param([string]$Kommentar, [int]$Sleep=1337, [int]$RestoreClipboard=1337)

#############################
# Default Restore Clipboard #
$restore = $true            #
#                           #
#    Default Sleep Time     #
$defsleep="3"               #
#                           #
#       Default Name        #
$name = "Maximilian"        #
#############################

$clip = Get-Clipboard
$date = Get-Date -UFormat "%H:%M, %d.%m.%Y"
$kommi = ""
$sleeptime = $defsleep
if($Kommentar -ne "")
{
	$kommi = ", $Kommentar"
}
if($Sleep -ne 1337 -and $Sleep -ne 1)
{
	$sleeptime = $Sleep
}
elseif($Kommentar -match "^\d+$")
{
	$sleeptime = $Kommentar
	$kommi = ""
}
if ($Kommentar -eq 0 -or $Kommentar -eq 1)
{
	$restore = $Kommentar
	$kommi = ""
	$sleeptime = $defsleep
}
elseif ($Sleep -eq 0 -or $Sleep -eq 1)
{
	$restore = $Sleep
}
elseif($RestoreClipboard -ne 1337)
{
	$restore = $RestoreClipboard
}

$output = "$name, $date$kommi"
Write-Output $output | Set-Clipboard
Write-Host 
Get-Clipboard
Write-Host

if ($restore -eq $true -or $restore -eq 1)
{
	Write-Host "++++ sleep $sleeptime seconds ++++"
	Start-Sleep -s $sleeptime
	Write-Output $clip | Set-Clipboard
	Write-Host "+++ restored Clipboard +++"
}
