Use CuBox as a thin client / erminal Services / RDP Client

This is just a template for further configuration!

Thanks to https://wiki.archlinux.org/index.php/USB_Storage_Devices .

There's a single user: cubox. No display manager. Login, then issue

    startx

An Unix UID and GID of 1000 is assumed for the cubox user.

Edit /lib/udev/domount accordingly.

Edit /home/cubox/.remmina for details on RDP servers.

Edit /home/.xinitrc to change window manager.

The whole /media Linux directory is visible to the RDP server under 
"Computer" as a system directory or remote unit.

When you put an USB pendrive in your box, a Terminal will popup informing 
you that the device is being mounted and how to unmount.

Enjoy ;)
