$SudoOrNot = Read-Host -Prompt 'Do you want to run your command in sudo? Y/N'
$lineNum = get-content .\ip.txt | measure-object -line | select -expand lines

$file_data = Get-Content .\ip.txt 

$commands = Get-Content .\commands.txt |% {$_-replace "`r", "";"`n "}

$line = 0

While ($line -le $lineNum)
     {
      if($SudoOrNot -eq 'Y') {
        plink.exe -no-antispoof -ssh $file_data[$line] -l $args[0] -pw $args[1] "echo -e "$args[1]" | sudo -S "$commands""
        echo $file_data[$line]

    }else {
        plink.exe -no-antispoof -ssh $file_data[$line] -l $args[0] -pw $args[1] $commands
    }

    $line++
 } 
