# Solve-Collatz
A PowerShell function to solve the Collatz-Conjecture in an organised way

# How to use
Firstly, import the function by simply running the script Solve-Collatz.ps1

After that, you're able to use the function within a PowerShell script by typing "Solve" and hitting CTRL+Space.

The function accepts 1 number as input, either directly after calling the function name, or by passing the parameter "-Number" folowed by the number.

`Solve-Collatz 444 # Solve the conjecture for the start number '444'`
or
`Solve-Collatz -Number 444 # Solve the conjecture for the start number '444'`

Result will be an output formatted as table:

Start Count Maximum
----- ----- -------
  444    71    9232

You can also save the function into a variable and then access the seperate objects of the table.

`
$result = Solve-Collatz 1234

$result.start
#OUTPUT 1234

$result.maximum
#OUTPUT 9232

$result.count
#OUTPUT 132
`

My favorite technique is to use this function within a for loop for a given set of numbers like this:

`
$Results = @()  # Create an empty array where the results of multiple calculations will be saved

for($i = 1; $i -lt 1000000; $i++){
$Results += Solve-Collatz $i # Solve the conjecture for the current index within the for loop and append it to the 'Results'-array
}

$Results | sort maximum -Descending | Export-Csv -Path .\Documents\collatz.csv -Encoding UTF8 -Delimiter "`t" -NoTypeInformation -Append -Force # Export the complete list as a CSV-file which is sorted by the maximum number descending
`
