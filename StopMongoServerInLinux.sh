# This Shell script is to Stop the Mongo in Linux machines
# ----------------------------------------------------------------------------
# Author(s): Srikrishna Jena
# ----------------------------------------------------------------------------

#!/bin/bash
#!/bin/sh
#!/bin/ksh
#set -x

#Get the status mongod service
STATUS="$(systemctl is-active mongod.service)"
#Validate if the Mongod service is up and running, if yes then stop the mongod service
if [ "$(systemctl is-active mongod.service)" = "active" ]; then
   echo "$(systemctl is-active mongod.service)"
   echo "mongod Service Is Running"
   echo "Stop mongod Service"
   # Stop the Mongo service
   sudo systemctl stop mongod 2>/dev/null
   sleep 20s
   echo "$(systemctl is-active mongod.service)"
   #After stopping the mongod service validate the mongod service is stopped, if not then throw an error message.
   if [ "$(systemctl is-active mongod.service)" = "active" ]; then
      echo "Error Not able to Stop mongod Service"
      exit 1
   else 
      echo "mongod Service Is Stopped"
   fi
#Mongod service is Not running
else 
    echo "$(systemctl is-active mongod.service)"
    echo "mongod Service Is Not Running"  
fi