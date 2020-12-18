$SudoOrNot = Read-Host -Prompt 'Do you want to run your command in sudo? Y/N'
$lineNum = get-content .\ip.txt | measure-object -line | select -expand lines
echo $lineNum
$file_data = Get-Content .\ip.txt 
$commands = Get-Content .\commands.txt |% {$_-replace "`r", "";"`n "}

$line = 1

While ($line -lt $lineNum)
     {
      if($SudoOrNot -eq 'Y') {
        plink.exe -no-antispoof -ssh $file_data[$lineNum] -l $args[0] -pw $args[1] "echo -e "$args[1]" | sudo -S "$commands""
    }else {
        plink.exe -no-antispoof -ssh $file_data[$lineNum] -l $args[0] -pw $args[1] $commands
    }

    $line++
 } 



