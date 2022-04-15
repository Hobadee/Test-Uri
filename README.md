# Test-Uri
This project aims to create a single function which will take any URI and, using plugins, test to see if that URI is accessible or not


## Running
This project is intended to be run on PowerShell Core.  All plugins should ideally run on all OSes.


## Building
This project may be built using `make`.  To build, simply run `make` then `make test` to run the Pester tests.

For ease of testing, you may also run `make shell` to dump you into a shell with the module imported.


## Installing
`make install` should work on *NIX systems.  Installation on Windows is currently manual.

To install manually, copy all the files in the "build" directory into a new folder in your PowerShell modules directory.  The Windows installation directory is `$HOME\Documents\PowerShell\Modules`


## Public functions
The following functions are publicly exported from this module for use.  These functions may be used either manually, or in automated jobs.

* Test-Uri
  This function will test a given URI to see if it is accessible.
