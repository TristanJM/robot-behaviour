# robot-behaviour
E-Puck robot programming for behaviour coursework

### Set Up
You can find the files under `program > demo`. Each coursework task has its own .c and .h file (prefixed as cwk_).

1. Clone git repo
2. Create your own branch
3. Open the workspace: [program > demo > Coursework.mcw](/program/demo/Coursework.mcw)
4. Use main_c.c and edit your task files (eg. cwk_fear.c and cwk_fear.h)
5. Build the project
6. Use Tiny Bootloader to load the [program > demo > Coursework.hex](/program/demo/Coursework.hex) file onto the E-Puck. Or use the multi-device shell script with `./bootloader/epuckupload -f ./program/demo/Coursework.hex /dev/tty.e-puck_3532-COM1`. You can find the correct COM port by using `ls /dev/tty.*`.
