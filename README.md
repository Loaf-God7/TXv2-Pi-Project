# Introduction
### What is this?
Resources to modify your TX V2 board/firmware to allow any device to control your printer via UART.

### How?
Reflashing the STM32 on board. The default OS already has the capibility to put the STM32 into DFU mode using a script, and upload a new firmware file. Even after changing the communication port in the firmware on the STM32, DFU and firmware upload script still works on the stock SOC.

### What do I need?
- Any Linux system with decent specs that you can install Klipper on **(device with GPOI reccomended)**. I'd reccomend Raspberry Pi 3 or better. No Zeros boards!
- USB to UART adapter if your system doesn't have GPIO or UART.
- 3 Dupont wires or something similar so you can hook up the UART connection
- 5 more Dupont wires if you'd like to hook up your acceleroneter via GPIO. If you device has an spi port you may be able to plug it right in, but that will depend on the pin layout.
- Some time and patience

### Considerations
If you just flash the firmware on your V2 board and hook up your Linux device, your screen will not be able to control the printer. The screen will stay on a message saying MCU connection failed. Also, the accellerometere and Z touch sensor reset are wired straight to the SOC on the board. Becuase of that, you will need to hook them up to your device. The Z touch isn't technically needed for the device to work.

# Walkthrough
