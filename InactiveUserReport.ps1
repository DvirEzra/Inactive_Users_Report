Import-Module ActiveDirectory

$DaysInactive = 90
$Time = (Get-Date).AddDays(-$DaysInactive)  

Get-ADUser -Filter { LastLogonTimeStamp -lt $Time -and enabled -eq $true } -Properties * | Select-Object Name, LastLogonDate | Export-Csv "C:\temp\InactiveUsers.csv" -Encoding UTF8 -NoTypeInformation

# Send Email
$smtpServer = "smtp.office365.com"
$smtpFrom = "reports@company.com"
$smtpTo = "admin@company.com"  

$message = new-object Net.Mail.MailMessage
$message.From = $smtpFrom
$message.To.Add($smtpTo)
$message.Subject = "Inactive Users Report"
$message.Body = "Attached is the monthly inactive users report."
$message.Attachments.Add("C:\temp\InactiveUsers.csv")

$smtp = new-object Net.Mail.SmtpClient($smtpServer)
$smtp.Send($message)