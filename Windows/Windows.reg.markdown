This file is supposed to explain [Windows.reg](Windows.reg).

```
Windows Registry Editor Version 5.00
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"ConsentPromptBehaviorAdmin"=dword:00000002
"ConsentPromptBehaviorUser"=dword:00000002
```

* Make the file Windows Registry Editor script
* Ask admins yes/no on UAC
    * 1 would also ask for password, 0 disable entirely.
* prompt standard users for username and password.
    * The other option (1) doesn't even give them UAC prompt so you must
    always login as admin to do anything.

```
"dontdisplaylastusername"=dword:00000000
"shutdownwithoutlogon"=dword:00000001
"undockwithoutlogon"=dword:00000001
"VerboseStatus"=dword:00000001
"HideStartupScripts"=dword:00000000
"HideShutdownScripts"=dword:00000000
"EnableFirstLogonAnimation"=dword:00000000
```

* Display the user list.
* Allows shutdown without being logged in
* Allows undocking without logging in
* Shows verbose information on login (starting service...)
* Shows output of startup scripts
* Shows output of shutdown scripts
* Disables the first logon animation on Windows 8 and newer

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation]
"RealTimeIsUniversal"=dword:00000001
"RealTimeIsUniversal"=qword:00000001
```

* Sets hardware clock to UTC time (doesn't affect system clock!)
    * qword for 64-bit, dword for 32-bit systems. The actual reg file has
      only qword as I haven't seen 32-bit Windowses lately.

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters]
"AddrConfigControl"=dword:00000000
```

* be able to resolve IPv6 even when connection isn't native.

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TCPIP\v6Transition]
"Teredo_DefaultQualified"="Enabled"
"Teredo_State"="Enterprise Client"
"Teredo_ServerName"="teredo.trex.fi"
```

* Enable Teredo
* Enable Teredo even when joined to domain.
* Use `teredo.trex.fi` as Teredo server as it's in Finland where I am.

```
[HKEY_USERS\.DEFAULT\Control Panel\Keyboard]
"InitialKeyboardIndicators"="2147483650"
```

* Enable numlock on boot.
