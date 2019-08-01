
$org = Read-Host "введите имя организации"
$orgname = switch ($org) {
    bil*                            {"БИЛ (БрэндИмпортЛоджистик)" }
    *БрэндИмпортЛоджистик*          {"БИЛ (БрэндИмпортЛоджистик)" }
    БИЛ*                            {"БИЛ (БрэндИмпортЛоджистик)" }
    *'Брэнд Импорт Лоджистик'*      {"БИЛ (БрэндИмпортЛоджистик)" }
    "БИЛ (БрэндИмпортЛоджистик)"    {"БИЛ (БрэндИмпортЛоджистик)" }
    Default                         {write-host "неизвестная организация"; Exit}
}

$notebook = Read-Host "Это ноутбук? (Y or N)"
$type = switch($notebook()) 
{ 
    {($_ -eq "y") -or ($_ -eq "yes")} { "You entered Yes.", $true } 
    {($_ -eq "n") -or ($_ -eq "no")} { "You entered no.", $folse}
    Default {$folse}
}

[string]$OC = Get-WmiObject win32_operatingsystem | % -MemberName caption
[string]$OC = $OC -replace "Майкрософт"
[string]$OC = $OC -replace "Microsoft"
[string]$CN = Get-WmiObject win32_operatingsystem | % -MemberName pscomputername
Get-WmiObject Win32_BaseBoard | fl *
$ram = [string]((Get-WmiObject Win32_PhysicalMemory | % Capacity)/1Gb) +'Gb' + ' '+ [string](Get-WmiObject Win32_PhysicalMemory | % Manufacturer) + ' ' + [string](Get-WmiObject Win32_PhysicalMemory | % PartNumber)

#, Manufacturer, PartNumber