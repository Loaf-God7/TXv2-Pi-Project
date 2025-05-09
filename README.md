# Introduction

This guide will walk you through flashing the STM32 on board to control it via UART with a SBC or similar device. The default OS already has the capibility to put the STM32 into DFU mode using a script, and upload a new firmware file. Even after changing the communication port in the firmware on the STM32, DFU and firmware upload scripts still works on the stock SOC.

### What you will need
- Any Linux system with decent specs that you can install Klipper on **(device with GPOI reccomended)**. I'd reccomend Raspberry Pi 3 or better. No Zeros boards!
- USB to UART adapter if your system doesn't have GPIO or UART.
- 3 Dupont wires or something similar so you can hook up the UART connection
- 5 more Dupont wires to hook up your acceleroneter via GPIO. If you device has an spi port you can use that insted of GPIO.
- Some time and patience

### Considerations
If you just flash the firmware on your V2 board and hook up your Linux device, your screen will not be able to control the printer. The screen will stay on a message saying MCU connection failed. Also, the accellerometere and Z touch sensor reset are wired straight to the SOC on the board. Becuase of that, you will need to wire them up to your device. The Z touch isn't technically needed for the device to work or home/level.

# Walkthrough

- SSH into your system
  - Username: `root`
  - Password: `zhuochen1`
- `chroot /server/tmp`
- `su gem`
- `cd ~/`
- `sudo apt-get install git`
- `git clone LINK`
- `exit` until you leave chroot and are back to being root of the base system
- `sh /server/tmp/home/gem/REPO/SCRIPT.sh`
- You should see DFU util start. There may be some errors, but as long as you see the loading bar at 100%, and file upload complete the flash went through.
- Restart your system completely
- On the screen of your printer it should say the printer could not connect to the MCU
- 
