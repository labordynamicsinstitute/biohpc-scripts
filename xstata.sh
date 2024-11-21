#!/bin/bash
call=$(basename $0 .sh)
# If modules are used, there might be a path, which we re-use
modulesbin=$(which $call 2>/dev/null)
if [[ -z $modulesbin ]]
then
	statabin=/usr/local/stata$stataversion/$call
else
	statabin=$modulesbin
fi

# Start xstata
$statabin

# Get the PID of the Stata process
sleep 1
ps ux | grep $statabin 
mypid=$(ps ux | grep $statabin | grep -v grep | awk ' { print $2 } ')
echo $mypid

if ! kill -0 "$mypid" 2>/dev/null; then
    echo "Error: Process with PID $mypid does not exist"
    exit 1
fi

echo "Monitoring process $mypid..."

# Loop while the process exists
while kill -0 "$mypid" 2>/dev/null; do
    # Sleep for a short interval to reduce CPU usage
    sleep 1
done

echo "Process $mypid has terminated"

