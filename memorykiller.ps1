Write-Host "WELCOME TO MEMORY KILLER"

$fileDetails=Get-ChildItem | Where-Object{$_.Name -eq "memorykillerfile.txt"}

Write-Host $fileDetails

New-Item -ItemType Directory -Name "memorykillerbin"

$howManyGb=[Int64](Read-Host -Prompt "How many Gb you want to kill?")

$howManyBytes=$howManyGb*1000000000

Write-Host "You selected $howManyGb"

$howManyTimes=[int](Read-Host -Prompt "How many times you want to kill memory in your system?")

Write-Host "You selected $howManyTimes"

Write-Host ("MemoryKiller File size: " + $fileDetails.Lenght) 

$copyTimes=$howManyBytes/([Int64]($fileDetails.Length))

Write-Host $copyTimes

Write-Host ("So we will have $copyTimes / memory killing cycle ") -BackgroundColor Red

Write-Host "Starting killing memory...."

$counterCycle=0

for($i=0; $i -lt $howManyTimes; $i++){

    $counterTimes=0

    for($j=0; $j -lt $copyTimes; $j++){

        $operationTimes=($counterTimes + 1)
        $percent= (($fileDetails.Length*$operationTimes)/$howManyBytes)*100
        Write-Host "Killing Memory!- time $counterTimes"
        Copy-Item memorykillerfile.txt -Destination memorykillerbin
        $randomNumber=Get-Random -Maximum 999999999999 -Minimum 0
        $randomNumber=$randomNumber.ToString()
        Rename-Item -Path .\memorykillerbin/memorykillerfile.txt -NewName ($randomNumber+".txt")

        if($percent -gt 100){
            $percent=100
        }

        Write-Host "      +Cycle completion: $percent %"
        $counterTimes=$counterTimes+1

    }

    Remove-Item -Path memorykillerbin/*
    Remove-Item -path memorykillerbin
    $counterCycle=$counterCycle+1
    Write-Host "Cycle $counterCycle completed"
    
}
