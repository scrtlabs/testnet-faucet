#! /bin/bash

sudo secretcli config indent true
sudo secretcli config keyring-backend test
sudo secretcli config trust-node true
sudo secretcli keys add testAcc