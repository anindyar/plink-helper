# plink-helper

So, I wrote this tiny script out of frustration when I was asked to configured some 60 odd servers from a restricted windows machines which only had putty allowed. so to automate running scripts / commands on all or many machines at one go I wrote this helper script for [plink.exe](https://the.earth.li/~sgtatham/putty/latest/w64/plink.exe)

plink.exe is a tiny utility that gets installed with putty, and can let you execute a command on the target Linux host straight from CMD/PowerShell and receive an output right there. 

but by design, you have to run each command for each linux host. So to automate that process I wrote this script. running it is very simple. it basically takes 4 inputes.

but before that lets first talk about setting up the folder for running plink-helper. 

1. Create a folder. or cd into the folder where you have the plink.exe file
2. Download and copy rmcmd.ps1 from this repository.
3. Create a file called command.txt in the same folder and paste all your commands (that needs to be executed on the Linux hosts) there.
4. Create a file called ip.txt and paste the IP of FQDN of all the Linux hosts where you want to run the commands on

Now you are all set to run the command. simply open powershell and execute

```
.\rmcmd <username> <password>
```
This will ask you whether you want to run those commands as sudo or not. if any of your command in the command.txt starts with a sudo, you select 'Y', else select 'N' and hit enter.

and Thats it ....



