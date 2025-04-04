# Electrum Wallet Cracker

Simple yet effective script that allows users to quickly test a list of passwords. By using a custom wordlist provided by the user, the program sequentially tries each password to help the user identify the correct one in a fraction of the time, making it a useful tool for password recovery or testing.

The project is called **Electrum Wallet Cracker**, but it should actually be called **Electrum Wallet Password Fast Checker** since it simply speeds up the process of trying password entries provided by the user.

## Usage

The script is a Bash (`.sh`) script, designed to run on Linux-based systems. To use the script, follow these steps:

1. **Set up the script**:  
   Open the script and modify the following two parameters:
    - `WORDLIST_PATH`: Path to your custom wordlist file containing potential passwords.
    - `WALLET_PATH`: Path to the wallet file you wish to unlock.

2. **Run the script**:  
   Once you've configured the parameters, run the script from your terminal:

   ```bash
   ./electrum-wallet-cracker.sh

3. **Review the logs**:
   All results will be logged in `electrum_password_test.log` by default. If the correct password is found, it will be indicated as a success in the log file.  
   Output example:

   ```bash
   $ ./electrum-wallet-cracker.sh 
   starting daemon (PID 1240975)
   Testing password: password123
   Testing password: qwerty
   Testing password: admin
   Testing password: 123456
   Testing password: iloveyou
   Testing password: monkey
   Testing password: 666666
   Testing password: sunshine
   Testing password: football
   Testing password: princess
   Testing password: welcome
   Testing password: abc123
   Testing password: superman
   SUCCESS: Password found -> superman
   Daemon stopped

## Requirements

Ensure that you have Bash and necessary permissions to execute `.sh` scripts.  
Electrum must be installed on the system before using the script.
