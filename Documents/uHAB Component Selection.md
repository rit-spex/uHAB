# µHAB Component Selection
By: Daniel Mitchell - 6/28/2018
----------------------------

## Power Management
Power designs can range from being extremely simple systems to complex systems which involve a multitude of available features and behaviors. After discussing the goals of the project and refining the design requirements, it was decided that the power system for µHAB will resemble that of a COTS Arduino Mega and be more on the simple side. This decision makes the overall board cheaper with the tradeoff of flexibility in expansion since there will not be a lot of extra power available for expansion helmet modules. The power system's functions are:

* To provide a stable power supply from a 2-cell LiPo or Li-ion such as the 18650 (The voltage range for these are  6.6V to 8.4V which can be easily regulated to 5V and 3.3V)

* Power all board components which include the microcontroller, radio module, GPS receiver, active antenna, and storage

* Reverse-polarity protection in the event that the power is connected backwards

* Offer a small amount of power to expansion helmet modules (Note: The Arduino Mega limits total current draw on the USB 5V to 500mA and the 5V LDO regulator limits to 1A total)

* Current-limit protection for both USB supplies and external supplies

Dependencies: In order to choose power system components, the total nominal power consumption should first be known. Because of this, specific components cannot be chosen until the rest of the components have been selected.

**Nominal Power Draw Estimations**

* Microcontroller: Estimating 100mA at 3.3V
* Data Storage: 6mA Active Current at 3.3V
* GPS: 31mA max at 3.3V
* Communications: 140mA at 5V
* Other: LEDs (x3) 30-60mA at 5V

Total 5V: **170-200mA**

Total 3.3V: **150mA**

Conclusion: Linear regulators able to supply at least an amp should be more than enough to supply the needs of µHAB while also allowing for plenty of current to be drawn peripherally. Based on the extremely low cost, bouuntiful protection features, and a flight-proven mission at IREC, the LDL1117 regulators are a strong choice.

5V Generation: [LDL1117S50R ($0.45)](https://www.digikey.com/product-detail/en/stmicroelectronics/LDL1117S50R/497-17240-1-ND/7102080).
> 1.2A output at a fixed 5V

> Over Current, Over Temperature, Under Voltage Lockout Protection

> Operating Temperatures from -40°C ~ 125°C

3.3V Generation: [LDL1117S33R ($0.45)](https://www.digikey.com/product-detail/en/stmicroelectronics/LDL1117S33R/497-17239-1-ND/7102079).
> 1.2A output at a fixed 3.3V

> Over Current, Over Temperature, Under Voltage Lockout Protection

> Operating Temperatures from -40°C ~ 125°C

## Program Execution
The selection for this component is one of the most difficult because there are so many options to choose from that meet the design requirements. The general plan for component selection with this part is to overshoot a bit in terms of processing power and then scale back if the total cost of components rises above 100 dollars. Having this added processing power lends immensely to the total expandability of µHAB. To reiterate the design requirements, the microcontrollers functions are:

* Arduino-Programmable (This is something that will need to be handled with software at a later date)

* I2C, SPI, UART, CAN, USB interfaces

* Watchdog Timer Peripheral (WDT)

* Clock >= 16MHz

* On-board program storage >= 256K

* On-board RAM >= 16K

* I/O >= 86

* ADC >= 16 and at least 10-bit

* 5V-tolerant pins are a plus
	>Without 5V tolerant pins, level-shifters should be looked into for each digital pin for COTS Arduino shield compatibility

The current choice is the ARM Cortex-M7: [Digikey Link - $11.98](https://www.digikey.com/product-detail/en/microchip-technology/ATSAMV70Q20B-AABT/ATSAMV70Q20B-AABT-CT-ND/7644979) which features:
>32-Bit instruction set

>300MHz clock

>EBI/EMI, I²C, IrDA, LINbus, MMC/SD/SDIO, SPI, UART/USART, USB Interfaces

>Brown-out Detect/Reset, DMA, I²S, POR, PWM, WDT Peripherals

>114 I/O

>1 MB Flash

>384K RAM

>24 12-bit ADCs

>3.3V Logic Levels (Would need level shifting)

>144-LQFP (20x20) Package Size (Solderable by hand with proper equipment)

As stated earlier, if the total cost of this system is over $100, then this can be scaled back. However, the design will proceed forward with the intention of using this component. 

## Data Storage
The storage decision is a relatively easy one because it effectively comes down to cost. Large amounts of storage are not necessary for a successful HAB mission and so only a smalll amount is required for µHAB. The requirements are: 

* Storage size >= 4K

* I2C or SPI Interface

* Low-End Operating Temperature <= -40°C

* Surface Mount

The main options for storage are:

* EEPROM: Ranges from [4K for $0.25](https://www.digikey.com/product-detail/en/microchip-technology/93LC66BT-I-OT/93LC66BT-I-OTCT-ND/857649) to [2M for $2.50](https://www.digikey.com/product-detail/en/microchip-technology/AT25M02-SSHM-T/AT25M02-SSHM-TCT-ND/5313453). The search can be found [here](https://www.digikey.com/products/en/integrated-circuits-ics/memory/774?FV=1c0002%2C1140003%2C238046d%2C238046e%2C238046f%2C2380516%2C238051d%2C238051e%2C23805c0%2C23805c1%2C23805c6%2C23805c7%2C23805ca%2C23805d4%2C23805d6%2C23805d7%2C23805d8%2C23805d9%2C23805db%2C23805dc%2C23805dd%2C23805de%2C23805e0%2C23805e2%2C23805e3%2C23805ed%2C23805f8%2C2380602%2C238060a%2C238060e%2C2380612%2C2380615%2C2380617%2C2380618%2C2380619%2C2380621%2C2380624%2C2380627%2C2380630%2C2380632%2C2380633%2C2380635%2C2380638%2C2380639%2C238063b%2C238063c%2C238063f%2C2380641%2C2380642%2C2380643%2C2380644%2C2380653%2C2380659%2C2380661%2C2380662%2C2380663%2C2380664%2C2380665%2C238066b%2C238066c%2C238066e%2C238066f%2C2380677%2C2380679%2C238067c%2C238067d%2C2380686%2C238068b%2C238068f%2C2380690%2C2380692%2C2380694%2C2380695%2C2380697%2C23806a1%2C23806a8%2C23806a9%2C23806aa%2C23806ab%2C23806ac%2C23806ad%2C23806ae%2C23806b0%2C23806b1%2C2380062%2C2540057%2C3f0041f%2C3f00420%2C3f00421%2C3f00424%2C3f00002%2C3f0001a%2C3f0001b%2C3f002df%2C3f002e2%2C3f002e6%2C3f00306%2C3f00314%2C3f0032b%2C3f00376%2Cf040010%2C1f140000%2C1fec000a%2C1fec000b%2C1fec000d%2C1fec000e%2C1fec0002%2C1fec0009%2Cffe00306&quantity=&ColumnSort=-142&page=1&stock=1&datasheet=1&photo=1&pageSize=25).

* Flash: Ranges from [256K for $0.33](https://www.digikey.com/product-detail/en/adesto-technologies/AT25DN256-SSHF-T/1265-1120-1-ND/4702551) to [1G for $3.89](https://www.digikey.com/product-detail/en/winbond-electronics/W25N01GVZEIG-TR/W25N01GVZEIGCT-ND/7393545). The search can be found [here](https://www.digikey.com/products/en/integrated-circuits-ics/memory/774?FV=1c0002%2C1140003%2C238046d%2C238046e%2C238046f%2C2380516%2C238051d%2C238051e%2C23805c0%2C23805c1%2C23805c6%2C23805c7%2C23805ca%2C23805d4%2C23805d6%2C23805d7%2C23805d8%2C23805d9%2C23805db%2C23805dc%2C23805dd%2C23805de%2C23805e0%2C23805e2%2C23805e3%2C23805ed%2C23805f8%2C2380602%2C238060a%2C238060e%2C2380612%2C2380615%2C2380617%2C2380618%2C2380619%2C2380621%2C2380624%2C2380627%2C2380630%2C2380632%2C2380633%2C2380635%2C2380638%2C2380639%2C238063b%2C238063c%2C238063f%2C2380641%2C2380642%2C2380643%2C2380644%2C2380653%2C2380659%2C2380661%2C2380662%2C2380663%2C2380664%2C2380665%2C238066b%2C238066c%2C238066e%2C238066f%2C2380677%2C2380679%2C238067c%2C238067d%2C2380686%2C238068b%2C238068f%2C2380690%2C2380692%2C2380694%2C2380695%2C2380697%2C23806a1%2C23806a8%2C23806a9%2C23806aa%2C23806ab%2C23806ac%2C23806ad%2C23806ae%2C23806b0%2C23806b1%2C2380062%2C2540057%2C3f0041f%2C3f00420%2C3f00421%2C3f00424%2C3f00002%2C3f0001a%2C3f0001b%2C3f002df%2C3f002e2%2C3f002e6%2C3f00306%2C3f00314%2C3f0032b%2C3f00376%2Cf040005%2C1f140000%2C1fec000a%2C1fec000b%2C1fec000d%2C1fec000e%2C1fec0002%2C1fec0009%2Cffe00306&quantity=&ColumnSort=-142&page=1&stock=1&datasheet=1&photo=1&pageSize=25).

* µSD: Requires a PCB connector that ranges from [$1.00 - $4.00](https://www.digikey.com/products/en/connectors-interconnects/memory-connectors-pc-card-sockets/414?FV=1c0002%2C85c0050%2C1f140000%2Cffe0019e&quantity=&ColumnSort=1000011&page=1&stock=1&datasheet=1&photo=1&pageSize=100) and the µSD card itself [$6.00+](https://smile.amazon.com/Kingston-16GB-microSDHC-microSD-SDCS/dp/B079H6PDCK/ref=sr_1_6?s=pc&ie=UTF8&qid=1530212214&sr=1-6&keywords=micro+SD+card).

It should be noted that although more storage can be written to faster for a lower cost with flash memory, the number of rated write cycles is typically on the order of 100,000 while EEPROM is rated on the order of 1,000,000 cycles. 

Based on the requirements, goals of the project, and the above options, the chosen option is 256K flash memory for only 33 cents. If more memory is required for future projects, then it can be added with a custom helmet. 

## Global Positioning
The GPS recievers available on the market are unfortunately more expensive at the low end than the higher-end microcontroller selected above. Requirements of the selected module include:

* External antenna input

* Standard interface to communicate with microcontroller (UART, SPI, I2C, etc.)

* Either 3.3V or 5V 

* Update rate >= 1Hz

* Max working altitude >= 150,000 feet

* Max working speed >= 500 mph

The prices of these modules vary greatly but the functionality does not change much when comparing each end of the spectrum. The more expensive modules boast a much higher accuracy at a higher update rate. However, for the scope of this project, high levels of accuracy and update rates are not required. Therefore, the cheapest module that meets the project's needs is the [Antenova M10578-A2 ($15.62)](https://www.digikey.com/product-detail/en/antenova/M10578-A2/627-1073-1-ND/5959796). 
>External antenna input

>UART communications protocol at a configurable baud rate

>3.3V Voltage supply

>Update rate up to 5Hz

>Max altitude of 59 million feet

>Max speed 1150 mph

Other modules can be found [here](https://www.digikey.com/products/en/rf-if-and-rfid/rf-receivers/870?k=&pkeyword=&pv276=414&pv276=983&pv276=4584&pv276=20&pv276=19&pv276=3352&pv276=30&FV=1c0002%2C1f140000%2Cffe00366%2C22c093d%2C22c163f%2C22c17da%2C22c036c&quantity=0&ColumnSort=1000011&page=1&stock=1&datasheet=1&photo=1&pageSize=500).

## Communications
As stated in the design requirements, APRS has been selected as the network by which the positioning data will be transmitted. Because of the numerous repeaters operated all over the state and country, the minimum distance needed for location tranmission is only to the nearest repeater. Although there are multiple requirements that would be desireable here, there is only 1 available radio module that is operable at the 144.390MHz frequency.

Without designing a radio from the ground-up, the only option available is the [Radiometrix HX-1 ($43.15)](http://radiometrix.mybigcommerce.com/hx1-vhf-narrow-band-fm-300mw-transmitter-standard-frequencies-144-390-144-800-and-169-4125mhz/). This radio transmits at 300mW and is also used with the Tracksoar APRS module. With past experiences, there have not been any issues with the radio module and its ability to properly transmit the data. 

##  Cutdown
Cutdown is very simply sending a large amount of current directly from the power supply through a thin nichrome wire to heat it up. This willl pop the balloon and induce descent. In order to do so, a single FET is needed in order to enable this current to flow through the nichrome wire. In order to improve safety in testing and avoid burning individuals or starting fires, another FET stage is added on the high side as well. By having two stages that are each tied to a red indication LED, there is less of a chance for accidents to happen. FET requirements: 

* The first stage (High-side P-Channel FET) is chosen from a previous design: [SSM3J3 ($0.56)](https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3J358RLF/SSM3J358RLFCT-ND/7394090).

	> Can handle 6 amps

	> SOT-23 package (easy to solder)

	> Flight-proven during IREC mission

* The second stage (Low-side N-Channel FET) is also chosen from a previous design: [IRLML6244 ($0.76)](https://www.digikey.com/product-detail/en/infineon-technologies/IRLML6244TRPBF/IRLML6244TRPBFCT-ND/2393877).

	> Can handle 6.3 amps

	> SOT-23 package (easy to solder)

Note: Each stage (when active) will illuminate a red LED to indicate that it is active. This will serve as a visual warning to anyone who may be handling any part of the system. 

## Remove Before Flight
The remove before flight mechanism may look like a lot of different things when it is hooked up on the external of the HAB. Maybe it is like rocketry with a lock and key that connects a circuit when turned. Maybe it looks like a pin that needs to be pulled in order to allow two conductive terminals to touch each other. Regardless of the external mechanism, the remove before flight connection to this PCB will allow a circuit to be connected and enable power to flow to the controller. In the event that this functionality is not desired, a jumper resistor can be placed between two pads. If the remove before flight functionality is needed for future helmets, then it can be accessed through two pins on the headers.



