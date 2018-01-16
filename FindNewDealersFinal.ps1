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
		
		# Move New Dealers to respective Market OUs
		# Alabama Market
		Get-ADUser -Filter {Company -like "AL"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=AL,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Arizona Market
		Get-ADUser -Filter {Company -like "AZ"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=AZ,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Central California Market
		Get-ADUser -Filter {Company -like "CC"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=CC,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Central Florida Market
		Get-ADUser -Filter {Company -like "CF"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=CF,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Colorado Market
		Get-ADUser -Filter {Company -like "CO"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=CO,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Coastal Texas Market
		Get-ADUser -Filter {Company -like "CT"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=CT,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# East Carolina Market
		Get-ADUser -Filter {Company -like "EC"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=EC,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Eastern Pennsylvania Market
		Get-ADUser -Filter {Company -like "EP"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=EP,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# East Tennessee Market
		Get-ADUser -Filter {Company -like "ET"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=ET,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Gulf Coast Market
		Get-ADUser -Filter {Company -like "GC"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=GC,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Illinois Market
		Get-ADUser -Filter {Company -like "IL"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=IL,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Indiana Market
		Get-ADUser -Filter {Company -like "IN"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=IN,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Kansas City Market
		Get-ADUser -Filter {Company -like "KC"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=KC,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Knoxville Market
		Get-ADUser -Filter {Company -like "KX"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=KX,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Kentucky Market
		Get-ADUser -Filter {Company -like "KY"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=KY,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Maryland Market
		Get-ADUser -Filter {Company -like "MD"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=MD,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Middle Tennessee Market
		Get-ADUser -Filter {Company -like "MT"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=MT,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# North Carolina Market
		Get-ADUser -Filter {Company -like "NC"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=NC,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# New England Market
		Get-ADUser -Filter {Company -like "NE"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=NE,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# North Georgia Market
		Get-ADUser -Filter {Company -like "NG"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=NG,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# North Texas Market
		Get-ADUser -Filter {Company -like "NT"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=NT,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# New York Market
		Get-ADUser -Filter {Company -like "NY"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=NY,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Oklahoma Market
		Get-ADUser -Filter {Company -like "OK"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=OK,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Orlando Market
		Get-ADUser -Filter {Company -like "OR"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=OR,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# South Florida Market
		Get-ADUser -Filter {Company -like "SF"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=SF,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# South Georgia Market
		Get-ADUser -Filter {Company -like "SG"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=SG,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# South Texas Market
		Get-ADUser -Filter {Company -like "ST"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=ST,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Upstate New York Market
		Get-ADUser -Filter {Company -like "UN"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=UN,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Virginia Market
		Get-ADUser -Filter {Company -like "VA"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=VA,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Washington Market
		Get-ADUser -Filter {Company -like "WA"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=WA,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Wisconsin Market
		Get-ADUser -Filter {Company -like "WI"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=WI,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
		
		# Western Pennsylvania Market
		Get-ADUser -Filter {Company -like "WP"} -Properties Company -SearchBase $_ |
		Move-ADObject -TargetPath "OU=Dealers,OU=WP,OU=Markets,OU=Employees,OU=CSOKI,DC=CSOKI,DC=local"
	}

Stop-Transcript