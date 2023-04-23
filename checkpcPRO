#!/bin/bash

echo "Listing processes..."
echo "This process can take up to 2 hours while it checks the whole computer."
echo -n "Do you want to save the log file? (Y/N): "
read save_log
if [ "$save_log" == "Y" ] || [ "$save_log" == "y" ]
then
    echo "Saving processes to ~/Desktop/processes.log ..."
    echo "Listing every process might take a minute or so. Please wait..."
    # shellcheck disable=SC2016
    ruby -e '
      require "sys/proctable"

      procs = Sys::ProcTable.ps()

      log_file_path = File.join(File.expand_path("~/Desktop"), "processes.log")
      File.open(log_file_path, "w") do |f|
        procs.each do |p|
          f.write("Process ID: #{p.pid}\n")
          f.write("Command line: #{p.cmdline}\n")
          f.write("Memory usage: #{p.rss} KB\n")

          # Get the port number used by the process using lsof
          ports = `lsof -i -P -n -p #{p.pid} | grep LISTEN | awk "{print $9}"`
          f.write("Port(s) used: #{ports}\n")

          f.write("---------------------\n")
        end
      end

      puts "Log file saved to #{log_file_path}"
    '


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
