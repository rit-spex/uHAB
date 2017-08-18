##Necessary Functions
* Power Management

* Program Execution (Brain)

* Data Acquisition (Sensors)

* Data Storage (Memory)

* Communications

##Power Management
* Battery as source (what voltage?)

* What other voltages do we need? (depends on what is used)

* Can we run the entire circuit off of a single rail? (Ideal scenario)

##Program Execution
* Needs to be Arduino-compatible for new members

* Needs to be able to interface with selected sensors, radios, and memory

##Data Acquisition
* IMU

* Pressure/temp/humidity

##Data Storage
* On-board memory vs. micro-SD [needs cost analysis]

* Do not need a large amount of storage

##Communications
* LoRa

* GPS?

* APRS?

* What is the minimal required to ensure recovery?

##Ideas
Power Management | Program Execution | Data Acquisition | Data Storage | Communications
----- | ----- | ----- | ----- | -----
- | M0 Processor | - | 9DOF IMU | LoRa
- | - | -| BME280 | APRS
