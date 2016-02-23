# SysEnum
Simple Bash script to retrieve basic system information including but not limited to; current user, IP Configuration, ARP table and running processes. Will be expanded on with additional functionality in the future.

# Usage
The script takes two arguments.

```
SysEnum.sh -print
```
Will print the retrieved information to the terminal.

```
SysEnum.sh -dump /example/path/output.txt
```
Will dump your output to a location of your sepcification

# Note
I realize having to pass an argument to dump output to an outfile is a little redundant since usually we'd just ```>>``` append to a textfile but as i may expand on this script in the future i might want to add more arguments to only dump or print specific portions of the retrieved information. Basically i just wrote this quickly with the idea in mind of later making it so that it enumerates selected components or component sections. In fact, i just might get rid of the commandline arguments entirely and replace it with an options menu.
