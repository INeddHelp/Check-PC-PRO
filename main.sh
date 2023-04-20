# goals for this files
# combine CheckPC and CheckPC+ feautures from INeddHelp on github

cd ~/Desktop
touch file_checked.log

lynis audit system >> file_checked.log

clamscan -r / >> file_checked.log

chkrootkit >> file_checked.log

rkhunter -c >> file_checked.log

aide --check >> file_checked.log

tripwire --check >> file_checked.log

osqueryi "SELECT * FROM osquery_info;" >> file_checked.log

openvas-check-setup >> file_checked.log

nmap -sV -p 1-65535 localhost >> file_checked.log

snort -c /etc/snort/snort.conf -T >> file_checked.log