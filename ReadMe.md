## ActiveIQPS

This module allows you to interact with NetApp ActiveIQ system via Powershell.  There is a lot of development left so feel free to contribute. This module is designed to be run by bots via a task scheduler, so there are no required parameters for the public functions.  To this end, a configuration file is required in order to insert customer specific configurations.  See sample config file in the module for guidance.

There is a dependancy module Vault that stores and retrieves tokens from the Windows Credential Manager. The code is here: https://github.com/LastMisadventure/Vault

On-going token management can be achieved through loading the module via scheduled task which could contain a simple get cmdlet like Get-ActiveIQInventory. The frequency of the task should run less than the frequency of the access token expiry, which is one hour.