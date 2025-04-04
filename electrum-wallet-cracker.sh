#!/bin/bash

# Set the wallet path and wordlist file path
WORDLIST_PATH="/home/user/wherever/my-wordlist.txt"
WALLET_PATH="/home/user/.electrum/wallets/my-wallet"
LOG_FILE_PATH="electrum_password_test.log"

# Check if the password file (wordlist) exists
if [ ! -f "$WORDLIST_PATH" ]; then
    echo "ERROR: Password file does not exist at $WORDLIST_PATH" | tee -a "$LOG_FILE_PATH"
    exit 1
fi

# Check if the wallet file exists
if [ ! -f "$WALLET_PATH" ]; then
    echo "ERROR: Wallet file does not exist at $WALLET_PATH" | tee -a "$LOG_FILE_PATH"
    exit 1
fi

# Ensure the Electrum daemon is running
electrum daemon -d
sleep 2  # Wait for the daemon to fully start

# Read the file line by line and try each password
while IFS= read -r password; do
    echo "Testing password: $password" | tee -a "$LOG_FILE_PATH"

    # Try to load the wallet with the password
    if electrum load_wallet -w "$WALLET_PATH" --password "$password" 2>/dev/null; then
        echo "SUCCESS: Password found -> $password" | tee -a "$LOG_FILE_PATH"
        electrum stop
        exit 0
    fi

done < "$WORDLIST_PATH"

echo "No password worked." | tee -a "$LOG_FILE_PATH"
electrum stop
exit 1
