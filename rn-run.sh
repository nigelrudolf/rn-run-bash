# yarn install

# if rn-run ios:
# cd ios && pod install
# cd ..

# may need 'path/to/Tee-On-Mobile' variable
# watchman watch-del '/Users/nigelmansell/Work/Tee-On-Mobile' ; watchman watch-project '/Users/nigelmansell/Work/Tee-On-Mobile'

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
    rm -rf node_modules
    yarn install
    cd ios && pod install && cd ..
    watchman watch-del '/Users/nigelmansell/Work/Tee-On-POS' ; watchman watch-project '/Users/nigelmansell/Work/Tee-On-POS'
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
