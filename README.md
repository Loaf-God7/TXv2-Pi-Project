# Introduction
### What is this?
Resources to modify your TX V2 board/firmware to allow any device to control your printer via UART.

### Why?
I wonder that myself. I so preoccupied with whether or not I could, I didn’t stop to think if I should bother. Also, you spent your hard earned money on this printer, why not have full control? The stock V2 board has an SOC that runs Klipper and outputs to the screen. The system is underpowerd, and is utilizing an embedded OS that is a bit annoying to add onto. Also, returing to stock is just a couple of commands away if you so please.

### How?
Reflashing the STM32 on board. The default OS already has the capibility to put the STM32 into DFU mode using a script and uplaod a new firmware file. Even after changing the communication port in the firmware on the STM32, the DFU and firmware upload script still works. With that said, bricking your board is actually not that easy, unless you lose power during the firmware flash which takes maybe two seconds.

### What do I need?
- Any Linux system with decent specs that you can install Klipper on. I'd reccomend Raspberry Pi 3 or better. No Zeros boards!
- USB to UART adapter if your system doesn't have GPIO or UART.
- 3 Dupont wires or something similar so you can hook up the UART connection
- 5 more Dupont wires if you'd like to hook up your acceleroneter via GPIO. If you're using a BTT Pi or something similar with an SPI port you can just plug it right in.
- Some time and patience

### Consideration
If you just flash the firmware on your V2 board and hook up your Linux device, your screen will just show the SOC's status which will say MCU is disconnected. I'm working on getting the SOC OS completely rebuilt so KlipperScreen can run on the SOC and be fed information via USB OTG. Also, the accellerometere and Z touch sensors are wired straight to the SOC on the board. Becuase of that, you will need to hook them up to your device. The Z touch isn't technically needed for the device to work, and well. However you're going to want the acceleroneter which connects via SPI.

# Walkthrough
