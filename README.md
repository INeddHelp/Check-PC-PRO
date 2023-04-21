# Check-PC-PRO

(It only works on Linux for now)

Check Pc PRO is a combination of [Check PC](https://github.com/INeddHelp/CheckPC) and [Check PC PLUS](https://github.com/INeddHelp/CheckPcPLUS) and it deeply checks your whole computer and list every process running. It also can relevate malwares and list them.

![screenshot](https://i.ibb.co/FB595J4/Screenshot-from-2023-04-21-21-52-56.png)
![screenshot2](https://i.ibb.co/J2ssZKS/Screenshot-from-2023-04-21-21-53-37.png)

# Installation 

Clone this repository:

```bash
git clone https://github.com/INeddHelp/Check-PC-PRO
cd path/to/checkpcPRO
```

Make the file install_checkpcPRO executable by running this command:
```bash
chmod +x install_checkpcPRO
./install_checkpcPRO
```

Once it's done, you can run the command in the terminal:
```bash
checkpcPRO  
```

# Usage 

The script is designed to perform a thorough check on a computer by listing all running processes and running an antivirus scan using ClamAV. The script saves the process list to a file called "processes.log" on the desktop and saves the output of the ClamAV scan to a file called "file_checked.log" on the desktop. Additionally, the script looks for any corrupt files and saves them to a file called "corrupted_files.log" on the desktop. The script is intended to be run on a Linux or macOS operating system.

# Licence 

Check PC PRO is released under MIT License.
