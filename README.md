# Inactive Users Report

This PowerShell script generates a report of inactive AD users that have not logged in for a specified number of days. It exports the inactive users to a CSV file and emails the report.

## Usage

1. Customize the script configuration:
   - `$DaysInactive` - The number of inactive days threshold  
   - `$smtpServer` - Your SMTP server address
   - `$smtpFrom` - The from email address
   - `$smtpTo` - The email address to send the report to
   
2. Run the script:

```powershell  
.\InactiveUserReport.ps1
```

It will export the CSV file to C:\temp\InactiveUsers.csv

And email the report to the configured recipient. 

## Script Overview

The script does the following:

- Gets all AD users with lastLogonTimestamp older than the inactive day threshold
- Selects the Name and LastLogonDate properties  
- Exports the results to a CSV file
- Sends the CSV file via email using the configured SMTP server and email addresses

## Customization

- Set the inactive day threshold with `$DaysInactive` 
- Configure the SMTP server and email addresses
- Change the output CSV path if needed

## Contributing

Pull requests are welcome to improve this script! 

Some ideas:

- Additional filtering of inactive users
- Different output format options  
- Error handling and logging

## License

This script is licensed under the MIT License. Feel free to use, modify, and distribute it.

Let me know if you would like any changes to this README!
