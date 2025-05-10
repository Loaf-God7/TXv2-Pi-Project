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

### Flash the custom firmware
- SSH into your system
  - Username: `root`
  - Password: `zhuochen1`
- `chroot /server/tmp`
- `su gem`
- `cd ~/`
- `sudo apt-get install git`
- `git clone https://github.com/Loaf-God7/TXv2-Pi-Project.git`
- `exit` until you leave chroot and are back to being root of the base system
- `sh /server/tmp/home/gem/TXv2-Pi-Project/update_stm32.sh`
- You should see DFU util start. There may be some errors, but as long as you see the loading bar at 100%, and file upload complete the flash went through.
- Restart your system completely
- On the screen of your printer it should say the printer could not connect to the MCU

### Wire up your SBC via UART
- Now that the firmware is flashed, the SBC will need to be hooked up to the printer via uart. Whether you're using GPIO or a USB to UART adapter the wiring will be the same.
- Connect RX, TX and GND to your GPIO/adapter, see the screenshots below. Make sure you wire TX to RX and RX to TX!
![overview](https://github.com/Loaf-God7/TXv2-Pi-Project/blob/main/images/Board-Overview.png)


![pins](https://github.com/Loaf-God7/TXv2-Pi-Project/blob/main/images/UART-Pins.png)

### Adjust your printer.cfg
- Make backups of any config files you are going to change.
- Change the MCU path in your printer.cfg to your UART connection. Eg. /dev/AMA0, /dev/ttyS*, or USB if you're using an adapter.
- Comment out lines containing rpi for now

### Reverting to stock firmware
- SSH into your system
- `sh sh /server/tmp/update_stm32.sh`
- This will flash the infimech firmware that was last downloaded on your system.
- Once the flash compeltes, power off and on the printer. You can now use the printer stock again.

### Troubleshooting
- If you're having issues with connection in Klipper, check klippy.log. You can also run screen, minicon, or a similar console on the SBC to view the UART signal the baud rate of the custom firmware is 250000. Power cycle the printer while keeping the SBC on and run your console of choise. Power on the pritner. You should see some sort of jubberish come through a few seconds after turning on the printer. The outout is not going to be plain text so do not worry about that.
- If you're still having trouble, I have included a UART test firmware. You can edit flash_mainboard.sh to use that bin file insted, then flash as mentioned above. That bin file will output "Hello from UART 3" in plain text from the STM32 every second. Connect your SBC via uart and open a console as mentioned above, but use a baudrate of 115200 this time. If you're wired up correctly, you should see the hello message after power cycling the printer.
- Any questions, let me know in Discord.
