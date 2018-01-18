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
		%{
			# Add Dealers & Role_dealer groups to AD accounts
			"dealers","role_dealer" | 
			Add-ADGroupMember -Members $_.SamAccountName
			# Remove Dealer Candidate group from AD accounts
			Remove-ADGroupMember -Identity "Dealer Candidates" -Members $_.SamAccountName -Confirm:$false
		} |
	}
Stop-Transcript		