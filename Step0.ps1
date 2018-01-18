$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path C:\!Support\DealerOutput.txt

# OUs to search in
$OUs = "OU=Dealer Candidates,OU=CSOKI,DC=CSOKI,DC=local","OU=Dealer Candidates,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"

# OU loop
$OUs | ForEach{
		# Search for newly coded Dealers
		Get-ADUser -Filter * -Properties Company,Title,Description -SearchBase $_ |
		FT SamAccountName,Company,Title,Description
	} |
	Out-file "c:\!Support\DealerCandidates.txt"
		
Stop-Transcript		