#region Initialization

#endregion

$ScriptName = 'Triumph Windows 11 Config'
$ScriptVersion = '1'

#Variables to define the Windows OS / Edition etc to be applied during OSDCloud
$Product = (Get-MyComputerProduct)
$Model = (Get-MyComputerModel)
$Manufacturer = (Get-CimInstance -ClassName Win32_ComputerSystem).Manufacturer
$OSVersion = 'Windows 11' #Used to Determine Driver Pack
$OSReleaseID = '24H2' #Used to Determine Driver Pack
$OSName = 'Windows 11 24H2 x64'
$OSEdition = 'Enterprise'
$OSActivation = 'Volume'
$OSLanguage = 'en-gb'

#Used to Determine Driver Pack
$DriverPack = Get-OSDCloudDriverPack -Product $Product -OSVersion $OSVersion -OSReleaseID $OSReleaseID

if ($DriverPack){
    $Global:MyOSDCloud.DriverPackName = $DriverPack.Name
}


#write variables to console
Write-Output $Global:MyOSDCloud

#Launch OSDCloud
write-host "Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage -ZTI -Restart"

Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage -ZTI -Restart
