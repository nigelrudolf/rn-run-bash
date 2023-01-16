# rn-run

## Description: 

Run react native app on ios or android. Run this script in the root of your react native project.

## Usage: 

`rn-run <option>`

## Options
```
-i: run ios
-I: run ios clean install
-a: run android
```

## Dependencies
This script needs the alias `ipad-mini` to work: https://github.com/nigelrudolf/useful-aliases

## Setup

On MacOS you will need to set **Ask before closing** to **Never** in Terminal settings
![image](./media/terminal.png)

## Installation
```
git clone ~/Downloads/https://github.com/nigelrudolf/rn-run.git

sudo cp ~/Downloads/rn-run/rn-run /usr/local/bin

sudo chmod +x /usr/local/bin/rn-run

Close the shell and start a new one
```