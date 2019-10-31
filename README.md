# Distance-Measurement-System

This project measures distance between the sensor and any object. It shows the distance on BASYS3's on board LEDs in binary format, on seven segment display of BASYS3 and on a monitor, via VGA, in decimal format.

## Components Used
1. BASYS3 (FPGA)
2. HC-SR04 Ultrasonic Sensor
3. Monitor
4. VGA cable
5. Vivado
6. Breadboard, Jumper cables

## The Design Methodology
The ultrasonic sensor, HC-SR04, throws a 8 cycle sonic burst after receiving a signal (trigger) of at least 10 microseconds high pulse. This is reflected by any object, if in the range 2 cm to 400 cm, and the distance is calculated by measuring the time, in microseconds, of high signal of the echo (output of sensor). Then by dividing this number by 58, distance is obtained in centimeters.

Since this sensor also reads noise from the environment, there are two methods (modes) to eliminate this noise. First mode is to take the peak value of few thousand samples. The other method takes average of few hundred samples, ignoring any reading the differs by more than 5 centimeters from the peak value at that time.

This distance is used, in binary, to directly show it on the on-board LEDs. It also shows the decimal equıvalent of this number on seven segment display by first converting it into decimal and then BCD format. The distance, mode, time (clock) and the location of the object is shown on the screen via VGA.
