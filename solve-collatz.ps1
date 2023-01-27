function Solve-Collatz{
    param(
         [Parameter(Mandatory)]
         [long]$Number
     )
    $count = 0;
    $maximum = 0;
    $start = $Number
    $Results = @()

    while($Number -gt 1){
    if($Number %2 -gt 0){
    $Number = ($Number*3)+1
    }else{
    $Number = $Number/2
    }
    $count++;
    if($Number -gt $maximum){
    $maximum = $Number
    }
    }
     
    $Results += [PSCustomObject] @{
    Start = $start
    Count = $count
    Maximum = $maximum
    }

    return $Results
}
