#Create a new PSDrive, default drive for HKEY_CLASSES_ROOT does not exist
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null

#HKCR:\Computer\HKEY_CLASSES_ROOT\Directory\Background\shell\Notepad\command
$regpath = "HKCR:\Directory\Background\shell\Notepad\command"
$value = "C:\Windows\System32\notepad.exe"

if(!(Test-Path $regpath))
{
    New-Item -Path $regpath -Force | Out-Null
    New-ItemProperty -Path $regpath -Name "(Default)" -Value $value -Force | Out-Null
}
else{
    New-ItemProperty -Path $regpath -Name "(Default)" -Value $value -Force | Out-Null
}
#Remove PSDrive 
Remove-PSDrive -Name HKCR
