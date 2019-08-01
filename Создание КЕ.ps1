
$org = Read-Host "введите имя организации"
<#$x = Read-Host "введите имя организации"
$1 = switch ($x) {
    1 {1}
    2 {4}
    3 {9}
    Default {"many"}
}
Write-Host $1
#>
$orgname = switch ($org) {
    bil*                            {"БИЛ (БрэндИмпортЛоджистик)" }
    *БрэндИмпортЛоджистик*          {"БИЛ (БрэндИмпортЛоджистик)" }
    БИЛ*                            {"БИЛ (БрэндИмпортЛоджистик)" }
    *'Брэнд Импорт Лоджистик'*      {"БИЛ (БрэндИмпортЛоджистик)" }
    Default                         {Exit; write-host "неизвестная организация"}
}

$notebook = Read-Host "Это ноутбук? (Y or N)"
$type = switch($notebook()) 
{ 
    {($_ -eq "y") -or ($_ -eq "yes")} { "You entered Yes.", $true } 
    {($_ -eq "n") -or ($_ -eq "no")} { "You entered no.", $folse}
    Default {$folse}
}

[string]$OC = Get-WmiObject win32_operatingsystem | % -MemberName caption
[string]$CN = Get-WmiObject win32_operatingsystem | % -MemberName pscomputername
Get-WmiObject Win32_BaseBoard | fl *
$ram = [string]((Get-WmiObject Win32_PhysicalMemory | % Capacity)/1Gb) +'Gb' + ' '+ [string](Get-WmiObject Win32_PhysicalMemory | % Manufacturer) + ' ' + [string](Get-WmiObject Win32_PhysicalMemory | % PartNumber)

#, Manufacturer, PartNumber