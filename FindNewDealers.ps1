$OUs = "OU=Dealer Candidates,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local", "OU=Dealer Candidates,OU=CSOKI,DC=CSOKI,DC=local"

ForEach ($OU in $OUs) {Get-ADUser -Filter {Title -like "Sales Rep*"} -Properties Title -SearchBase $OU | FT SamAccountName,Company,Name,Title | Out-File c:\!Support\NewDealers.txt}