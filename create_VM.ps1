Import-Module VMware.PowerCLI
Connect-VIServer -Server 'XXXXX' -User root -Password "XXXXX" -Force
Start-Sleep 10

$vmname = "vm1"


New-VM -Name $vmname -Datastore 'XXXXXX' -NumCpu 2 -DiskGB 20 -MemoryGB 1 -DiskStorageFormat 'thin' -NetworkName 'VM Network' -CD -GuestID 'rhel8_64Guest'

New-AdvancedSetting -Entity $vmname -Name isolation.tools.copy.disable -Value TRUE -Force
#Disconnect-VIServer -Confirm:$false