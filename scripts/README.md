# Convenience scripts
These scripts aims to aid unexperienced people to be able to build and use the project.

## Setup Steps
### 1 - dotnet_install.sh
this script is a helper around the .NET Core 3.1 installation.
#### Attention - this script only works on debian, ubuntu and apt enabled linux systems
#### Usage
`sudo ./dotnet_install.sh`

### 2 - build.sh
this script builds the project into a folder called _runtime_, it only needs to run once every repository update.
#### Usage
`./build.sh`


### 3 - record.sh
this script opens the record server to record your gaming session
#### Usage
`./record.sh`

### 4 - create_map.sh
this script converts all your recording sessions into an OTBM map file.

#### Usage
##### With default otb (client_ids used)
`./create_map.sh`
##### With your custom otb file (remember to move the otb file to the script directory)
`./create_map.sh --otb=$(pwd)/items.otb`
