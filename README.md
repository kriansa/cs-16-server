# CS 1.6 Dedicated Server

This is a HLDS setup I made for CS with custom addons and an easy ramp-up. It
also fixes several installation issues most people have when trying to create a
dedicated CS server.

## What's in it?

* Custom maps
* Metamod (1.21.1-am)
* AMX Mod X (1.8.2)

Custom AMX plugins:

* Gore
* HPK (High Ping Kicker)
* CS Nade Drops
* No Nade Through Walls

## Setup

1. Install [Docker](https://www.docker.com/)
2. Run `$ bin/setup`
3. Now you have to add yourself as an admin. Edit the file
   `cstrike/addons/amxmodx/configs/users.ini` and add your credentials. See the
   examples below:

   ```conf
   ; Examples of admin accounts:
   ; "STEAM_0:0:123456" "" "abcdefghijklmnopqrstu" "ce"
   ; "123.45.67.89" "" "abcdefghijklmnopqrstu" "de"
   ; "My Name" "my_password" "abcdefghijklmnopqrstu" "a"
   ```

4. **On your client**, edit the file `cstrike/userconfig.cfg` and add your
   password there, like the following:

   ```
   setinfo "_pw" "mypa$$w0rd"
   ```

## Running

To run the server, you can simply run:

`$ bin/server start`

Follow the logs:

`$ bin/server logs -f`

Stop the server:

`$ bin/server stop`

## Configuring

Edit `server.cfg` and files on `cfgs` folder to set different server settings.

Also, configure `AMXModX` as you wish by modifying the files on
`addons/amxmodx`.

There are some settings related to server initialization that are located on
`.env` file. Changes on them will most likely require a restart.

Adding new maps require you to restart the server.

## Common instalation issues

When doing a [clean HLDS
installation](https://developer.valvesoftware.com/wiki/SteamCMD#Linux), as
suggested on Steam manual, a few issues may arise.

1. Installation just doesn't work. Sometimes you would have to run `app_update
   90` several times and it wouldn't install all needed files. This is a hard
   one to solve, and I did it with help of [this
   workaround](https://danielgibbs.co.uk/2013/11/hlds-steamcmd-workaround-appid-90/).
   What it does is basically add 3 manifest files on `hlds/steamapps` folder
   and proceeds the installation.
2. First time you run HLDS, it crashes at the first time. This is some other
   bug caused by a missing `steam_appid.txt` file on `hlds` folder.
3. Warning messages of missing `$HOME/.steam/sdk32/steamclient.so` files. The
   fix is quite easy: we just need to link these files onto the expected path.
4. Warning messages of missing `custom.hpk` file. This can get annoying and
   make us think that there's something wrong. Don't worry, this is just a file
   used to store custom sprays from people who connect to the server. The fix
   for that is creating a blank `cstrike/custom.hpk` file when we start the
   server for the first time.

This Docker image fix all these errors gracefully so you don't have to worry.

## Compatibility

Currently, this server is compatible with MacOS and Linux.

## License

MIT.
