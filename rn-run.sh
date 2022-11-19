# yarn install

# if rn-run ios:
# cd ios && pod install
# cd ..
# yarn start

# if rn-run ios && simulator open:
# close xcode simulator, clean build folder (if possible)

# in a new terminal
# if rn-run ios:
# yarn react-native run-ios

# if rn-run android:
# yarn react-native run-android

runIOS()
{
    WATCH_DIR=$(pwd)
    echo $WATCH_DIR

    rm -rf node_modules
    yarn install
    cd ios && pod install && cd ..
    watchman watch-del $WATCH_DIR ; watchman watch-project $WATCH_DIR
    yarn start
}

runAndroid()
{
    echo 'launching android x'
}

while getopts ":ia" option; do
   case $option in
      i) # run ios
         runIOS
         exit;;
      a) # run android
         runAndroid
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done
