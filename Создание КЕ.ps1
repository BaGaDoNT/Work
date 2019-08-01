
#Ввод организации
$org = Read-Host "введите имя организации" #Требует точного совпадения
$orgname = switch ($org) {
    bil*                            {"БИЛ (БрэндИмпортЛоджистик)" }
    *БрэндИмпортЛоджистик*          {"БИЛ (БрэндИмпортЛоджистик)" }
    БИЛ*                            {"БИЛ (БрэндИмпортЛоджистик)" }
    *'Брэнд Импорт Лоджистик'*      {"БИЛ (БрэндИмпортЛоджистик)" }
    "БИЛ (БрэндИмпортЛоджистик)"    {"БИЛ (БрэндИмпортЛоджистик)" }
    Default                         {write-host "неизвестная организация"; Exit}
}

#Идентификация ПК
$notebook = Read-Host "Это ноутбук? (Y or N)"
[bool]$type = switch($notebook) 
{ 
    y {$true; Write-Host "You entered Yes."} 
    n {$false; Write-Host "You entered no."}
    Default {$false}
}

#Добавление Критичности
$Critical = Read-Host "Укажите притичность. 1 - низкая; 2- высокая"
If ($Critical -eq 2) {$crit="высокая"} else { $crit="низкая"}

#Добавление статуса
$status = "Выдано"

#Добавление описания.
$discr = Read-Host "Есть TeamViewer (N или ID)"
if ($discr -ne 'N') 
    {$twid = $discr
        $tdpw = Read-Host "введите пароль TeamViewer"
    }
$helper = Read-Host "пользователь Helper? (N или Пароль от него)"
    if ($discr -ne 'N') 
        {$helperpw = $helper}


#Идентификация OC
[string]$OC = Get-WmiObject win32_operatingsystem | % -MemberName caption
[string]$OC = $OC -replace "Майкрософт "
[string]$OC = $OC -replace "Microsoft "
$OCfam = "Windows"
#Идентификация железа
[string]$CN = Get-WmiObject win32_operatingsystem | % -MemberName pscomputername
Get-WmiObject Win32_BaseBoard | fl *
$ram = [string]((Get-WmiObject Win32_PhysicalMemory | % Capacity)/1Gb) +'Gb' + ' '+ [string](Get-WmiObject Win32_PhysicalMemory | % Manufacturer) + ' ' + [string](Get-WmiObject Win32_PhysicalMemory | % PartNumber)
$MBman = Get-WmiObject Win32_BaseBoard | % Manufacturer
$MB = switch ($MBman) {
    'ASUSTeK COMPUTER INC.' {'ASUS'}
    Default {}
}
$mbmodel = $MBman + ' ' + (Get-WmiObject Win32_BaseBoard | % Product)

# Сбор в CSV
