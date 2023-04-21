#!/bin/bash

# Create processes.log file and write process information to it
echo "Listing processes..."
echo "This process can take up to 2 hours while it checks the whole computer."
echo -n "Do you want to save the log file? (Y/N): "
read save_log
if [ "$save_log" == "Y" ] || [ "$save_log" == "y" ]
then
    echo "Saving processes to ~/Desktop/processes.log"
    ruby -e 'require "sys/proctable"; procs = Sys::ProcTable.ps(); File.open("#{Dir.home}/Desktop/processes.log", "w") { |f| procs.each { |p| f.puts "Process ID: #{p.pid}\nCommand line: #{p.cmdline}\nMemory usage: #{p.rss} KB\n---------------------" } }'
    echo "Processes saved successfully."
else
    echo "Processes not saved."
fi

# Run clamscan and save output to file_checked.log
echo "Running antivirus scan..."
clamscan -r / > ~/Desktop/file_checked.log 2>&1

if [ $? -eq 0 ]; then
    echo "Antivirus scan completed successfully."
else
    echo "Error running antivirus scan." >> ~/Desktop/file_checked.log
fi

# Look for corrupt files and store in corrupted_files.log
echo "Looking for corrupt files..."
grep -i "corrupt" ~/Desktop/file_checked.log > ~/Desktop/corrupted_files.log

if [ -f ~/Desktop/corrupted_files.log ]; then
  echo "Corrupt files found and stored in ~/Desktop/corrupted_files.log"
else
  echo "No corrupt files found."
fi
