New-EventLog -LogName 'Application' -Source 'LogoMate' 
Write-EventLog -Source 'LogoMate' -EventId 1 -Message 'Hello from logo mate!' -EntryType 'Information' -LogName 'Application'