$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path C:\!Support\DealerOutput.txt

# OUs to search in
$OUs = "OU=Dealer Candidates,OU=CSOKI,DC=CSOKI,DC=local","OU=Dealer Candidates,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"

# OU loop
$OUs | ForEach{
		# Search for newly coded Dealers
		Get-ADUser -Filter {Title -like "Sales Rep*"} -Properties Company,Title -SearchBase $_ |
		FT SamAccountName,Company,Title,DistinguishedName
	} |
	Out-file "c:\!Support\NewDealers.txt"
		
Stop-Transcript		