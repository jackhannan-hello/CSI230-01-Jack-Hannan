$accteptedValues = @('all', 'stopped', 'running', 'quit')

Write-Host "What services do you want to view: All Of Them, Running Services, or Stoped Services"
$userView = Read-Host "Enter either: all, running, or stopped"

while($userView -notin $accteptedValues){
    $userView = Read-Host "Enter either: all, running, or stopped"
}

while($userView -notlike "quit"){
    if($userView -ilike "all"){
        Get-Service
    }
    elseif($userView -ilike "running"){
        Get-Service | where {$_.Status -ilike "Running"}
    }
    else{
        Get-Service | where {$_.Status -ilike "Stopped"}
    }

    $userView = Read-Host "Enter either: all, running, stopped, or quit"

    while($userView -notin $accteptedValues){
        $userView = Read-Host "Enter either: all, running, stopped, or quit"
    }
}