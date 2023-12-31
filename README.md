# DevOpsSkillingUp
Public repository to upload DevOpsSkillingUp labs 

Instructions:

Shell Script to do a line count over files


Create a Bash Shell script using functions to count the number of lines in text files located in the current directory when:
They belong to an owner OR
When were created in a specific month

The shell script should accept the following options:

-o <owner>
To select files where the owner is <owner>

-m <month>
To select files where the creation month is <month>

When receiving invalid arguments, show help 

Invalid arguments:

./countlines.sh

./countlines.sh -o owner -m month

Other arguments
./countlines.sh -x owner

  --------------------------------------------------------------------------------------------
  
Content information:


Bash shell script that uses functions to count the number of lines in text files located in the current directory based on owner or creation month. It accepts the options -o <owner> and -m <month>, and provides help for invalid arguments.
  
  To use this script, save it as countlines.sh and make it executable (chmod +x countlines.sh). Then you can run it with the desired options. 
  
  Here are a few examples:
  
  ./countlines.sh -o victor.rodriguez
  
  This will count the lines in text files owned by "victor.rodriguez" in the current directory.
  
  --------------------------------------------------------------------------------------------
  
  ./countlines.sh -m Oct

  This will count the lines in text files created in the month of Octuber in the current directory.
  
  --------------------------------------------------------------------------------------------
  
  ./countlines.sh
  
  This will display the script usage and help information.

  The script adjusts the commands stat -c '%U' and stat -c '%y' to use stat -f '%Su' and stat -f '%Sm' -t '%b' on macOS, respectively, to fetch owner and creation month information.
