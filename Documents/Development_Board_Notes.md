# ARM Cortex M7 Development Board Notes

### Description: 
Atmel has created a hardware platform to help potential customers evaluate the ATSAMV71Q21 and other ARM Cortex-M7 microcontrollers. This board is called the "SAMV71 Xplained Ultra". A lot of specifications about this board are provided by Atmel. This document contains a list of notes from reviewing the provided information. To avoid errors and expedite the design process, the design documentation for this development platform will be referenced heavily during the implementation of the ARM Cortex-M7 into µHAB., 

## Source: 
[Xplained Ultra User Guide](http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-42408-SAMV71-Xplained-Ultra_User-Guide.pdf)

### Features (Hardware Additions to MCU)
* Mechanical Reset Button
* Power Switch Button 
* User Pushbuttons
* LEDs (x2 yellow)
* Supercapacitor 
* 12.0 MHz Crystal
* 32.768 MHz Crystal
* 2MB SDRAM
* 2MB QSPI Flash
* 256KB EEPROM
* Stereo Audio Codec (mic and headphone jack)
* CAN Trasnciever
* SD Card Connector
* Camera Interface Connector
* External Debugger Connector
* USB Interface
* Embedded Debugger 
	* Auto-ID for board identification in Atmel Studio
	* One yellow status LED
	* One green board power LED
	* Symbolic debug of complex data types including scope information
	* Programming and debugging
	* Data Gateway Interface: SPI, I2C, four GPIOs
	* Virtual COM port (CDC)
* External Power (5-14V)
* USB powered

![Figure 1-1](https://i.imgur.com/nXpTwl9.png)

#### Design Documentation & Relevant Links
* IDE: [Atmel Studio](http://www.microchip.com/mplab/avr-support/atmel-studio-7)
* Software Development Environment: [Keil MDK](http://www2.keil.com/mdk5)
* Design Documentation: [Archive .zip](http://www.atmel.com/Images/Atmel-42408-SAMV71-Xplained-Ultra_User-Guide.zip)

### Embedded Debugger
* The SAM V71 Xplained Ultra contains the Atmel Embedded Debugger (EDBG) for on-board debugging.
The EDBG is a composite USB device of three interfaces; a debugger, Virtual COM Port, and a Data
Gateway Interface (DGI).

* Together with Atmel Studio, the EDBG debugger interface can program and debug the ATSAMV71Q21.
On SAM V71 Xplained Ultra, the SWD interface is connected between the EDBG and the
ATSAMV71Q21.

* The Virtual COM Port is connected to a UART on the ATSAMV71Q21 and provides an easy way to
communicate with the target application through terminal software. It offers variable baud rate, parity, and
stop bit settings. Note that the settings on the ATSAMV71Q21 must match the settings given in the
terminal software.

* The DGI consists of several physical interfaces for communication with the host computer.
Communication over the interfaces is bidirectional. It can be used to send events and values from the
ATSAMV71Q21 or as a generic printf-style data channel. 


### Notes for Development


### Notes for Future Helmets

* Nonvolatile Memory for Helmet Identification: [AT24MAC402-MAHM-T ($0.34)](https://www.digikey.com/product-detail/en/microchip-technology/AT24MAC402-MAHM-T/AT24MAC402-MAHM-TCT-ND/3973046)
	
	> Comes with a factory-programmed unique EUI-48 or EUI-64 Compatible Address that is llocked, read-only, and guaranteed to be unique.

	> If multiple of the same helmet are being made, the settable I2C addresses have 8 different combinations for a total of 8 different boards that all use this exact IC. 
