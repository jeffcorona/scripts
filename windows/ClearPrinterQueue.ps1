stop-service "spooler"

remove-item -path C:\Windows\System32\spool\PRINTERS\*

start-service "spooler"