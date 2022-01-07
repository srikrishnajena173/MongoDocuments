# This Shell script is to Start the Mongo in Linux machines
# ----------------------------------------------------------------------------
# Author(s): Srikrishna Jena
# ----------------------------------------------------------------------------

#!/bin/bash
#!/bin/sh
#!/bin/ksh
#set -x

#Get the status mongod service
STATUS="$(systemctl is-active mongod.service)"
#If the Mongod service is up and running then stop the serivce and start the mongod service
if [ "$(systemctl is-active mongod.service)" = "active" ]; then
   echo "$(systemctl is-active mongod.service)"
   echo "Mongod Service Is Running"
   echo "Stoping mongod Service"
   # Stop the mongo service
   sudo systemctl stop mongod 2>/dev/null
   sleep 20s
   #After stopping the mongod service validate the mongod service is stopped, if not then throw an error message.
   if [ "$(systemctl is-active mongod.service)" = "active" ]; then
       echo "Error Not able to Stop mongod Service"
       exit 1
   else 
       echo "mongod Service Is Stopped"
   fi
   echo "$(systemctl is-active mongod.service)"
   echo "Starting mongod Service"
   # Start the mongo service
   sudo systemctl start mongod 2>/dev/null
   sleep 20s
   #After restarting the mongod service, validate the service is up and running else throw an error message
   echo "$(systemctl is-active mongod.service)"
   if [ "$(systemctl is-active mongod.service)" = "active" ]; then
      echo "Mongod Service Is Up And Running"
   else
      echo "Error Not able to Restart the mongod Service"    
      exit 1
   fi  
else 
    #If the mongod service is not running then start the mongod serivce  
    echo "$(systemctl is-active mongod.service)" 
    echo "Mongod Service Is Not Running"
    echo "Starting mongod Service"
    # Start the mongo service
    sudo systemctl start mongod 2>/dev/null
    sleep 20s
    #After starting the mongod service, validate the service is up and running else throw an error message
    echo "$(systemctl is-active mongod.service)" 
    if [ "$(systemctl is-active mongod.service)" = "active" ]; then
       echo "mongod Service Is Running"
    else 
       echo "Error Not able to Restart the mongod Service"
       exit 1             
    fi		     
fi