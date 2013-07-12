This project is created to allow Arcemu users to spawn and despawn blizzlike calendar events.
In each folder in this project you will find 2 files. The names of the files are self-explanatory.
You use one of them to spawn the selected event and the other to despawn (remove) it.
In order to do this, you need to execute the sql files in your world database and then restart the server.
If the event has another folder included next to the sql files, you will need to move her into your server's
script folder. These folders contain some scripts related to the events they are placed next to. 
Don't forget to remove the scripts related to the spawned event from your core scripts folder
after you despawn the event.
The script "Gm_Event_Controll.lua" is used to check what events are currently spawned. Only GM can use it.
The command for displaying a list of the event names is: "#event list". Note that this file must always be in
your arcemu script folder and it is not used for any specific event. It is just a controlling tool for the GM's.