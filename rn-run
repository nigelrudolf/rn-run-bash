## Description: Run react native app on ios or android
## Usage: rn-run <option>
## Options:
##   -i: run ios
##   -I: run ios clean install
##   -a: run android

## Note: This script is meant to be used with react native projects
## Setup: On MacOS you will need to set Ask before closing to never

killProcess()
{
    pids=($(lsof -i :8081 -t))

    if [ ${#pids[@]} -eq 0 ]
    then
        echo "No process running on port 8081"
    else
        # Kill each process with its found PID
        for pid in ${pids[@]}
        do
            kill $pid
        done
    fi
}

quitSimulator() 
{
    osascript -e 'tell application "Simulator" to quit'
}

closeTerminalWindows() 
{
    osascript -e "tell application \"Terminal\" to close (every window)"
}

cleanInstall() 
{
    rm -rf node_modules
    yarn install
    cd ios && pod install && cd ..
}

launchSim()
{
    current_dir=$(pwd)
    osascript -e "tell application \"Terminal\" to do script \"cd $current_dir; ipad-mini\""
}

runIOS() 
{
    WATCH_DIR=$(pwd)
    echo $WATCH_DIR

    killProcess
    quitSimulator
    closeTerminalWindows

    watchman watch-del $WATCH_DIR ; watchman watch-project $WATCH_DIR

    #launching sim will automatically invoke yarn start
    launchSim 
}

runIOSCI()
{
    WATCH_DIR=$(pwd)
    echo $WATCH_DIR

    killProcess
    quitSimulator
    closeTerminalWindows 
    
    cleanInstall

    watchman watch-del $WATCH_DIR ; watchman watch-project $WATCH_DIR

    #launching sim will automatically invoke yarn start
    launchSim 
}

runAndroid()
{
    echo 'launching android x'
}

while getopts ":iIa" option; do
    case $option in
        i) # run ios
            runIOS
            exit;;
        I) # run ios clean install
            runIOSCI
            exit;;
        a) # run android
            runAndroid
            exit;;
        \?) # Invalid option
            echo "Error: Invalid option"
            exit;;
    esac
done
