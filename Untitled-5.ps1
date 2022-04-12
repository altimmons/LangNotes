
#set location
$location = Join-Path -Path $env:APPDATA -ChildPath \..\Local\Microsoft\BingWallpaperApp\WPImages\

if (Test-Path  -PathType Container  $location) {}

$list = Get-ChildItem -Path $location -Name -Include *.jpg,*.png
$len = $list.length

if ($len -gt 0 ){
    Write-Debug "$len Files were found"
} else { Write-Output "Error: No Files found"  }

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Copy-Item   
}
else {
    Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$(Get-Location)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
}