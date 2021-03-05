## ActiveIQPS

This module allows you to interact with NetApp ActiveIQ system via Powershell.  There is a lot of development left in this module so feel free to contiribute. This module is designed to be run by bots via a task scheduler, so there are no required parameters for the public functions.  To this end, a configuration file is required in order to insert customer specific configurations.

There is a dependancy module named Vault that stores and retrieves tokens from the Windows Credential Manager. The code is here: https://github.com/LastMisadventure/Vault

Token management is achieved through loading the module via scheduled task which could contain a simple get cmdlet like Get-ActiveIQInventory.