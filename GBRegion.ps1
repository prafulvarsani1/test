# Script to define regional settings on Azure Virtual Machines deployed from the market place



#variables
$regionalsettingsURL = "https://github.com/prafulvarsani1/test/blob/master/GBRegion.xml"
$RegionalSettings = "C:\temp\GBRegion.xml"


#downdload regional settings file
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)


# Set Locale, language etc. 
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""

# Set languages/culture. Not needed perse.
Set-WinSystemLocale en-gb
Set-WinUserLanguageList -LanguageList en-gb -Force
Set-Culture -CultureInfo en-gb
Set-WinHomeLocation -GeoId 242
# Set-TimeZone -Name "E. GMT Standard Time"

# restart virtual machine to apply regional settings to current user. You could also do a logoff and login.
Start-sleep -Seconds 40
Restart-Computer
