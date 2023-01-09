# AK3 Prototyping Harness

## Now
|Nice!NanoV2|Connector Wire||Nice!NanoV2|Connector Wire|
|---|---|---|---|---|
|P0.06| 9||Battery+||
|P0.08|12||GND||
|GND|||RESET|PWSET|
|GND|||3.3V|SHIFTR|
|P0.17|SRCLK||P0.31|1|
|P0.20|RCLK||P0.29|2|
|P0.22|SER||P0.02|3|
|P0.24|8||P1.15|4|
|P1.00|7||P1.13|15|
|P0.11|20||P1.11|5|
|P1.04|10||P0.10|18|
|P1.06|11||P0.09|17|


SPI 

- [x] SER MOSI P0.24
- [x] SRCLK SCK P0.22
- [x] RCLK (LATCH) P0.20 (doesn't really matter but convenient)

    1 move P0.22 to P0.24 

    2 move P0.24 to P0.17

    3 Move P0.17 P0.22

## After

|Nice!NanoV2|Connector Wire||Nice!NanoV2|Connector Wire|
|---|---|---|---|---|
|P0.06| 9||Battery+||
|P0.08|12||GND||
|GND|||RESET|PWSET|
|GND|||3.3V|SHIFTR|
|P0.17|8||P0.31|1|
|P0.20|RCLK||P0.29|2|
|P0.22|SRCLK||P0.02|3|
|P0.24|SER||P1.15|4|
|P1.00|7||P1.13|15|
|P0.11|20||P1.11|5|
|P1.04|10||P0.10|18|
|P1.06|11||P0.09|17|



&pro_micro_spi {
    compatible = "nordic,nrf-spim";
	status = "okay";
	cs-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
    sck-pin = <22>;
	mosi-pin = <24>;
	shifter: 595@0 {
		compatible = "zmk,gpio-595";
		status = "okay";
		gpio-controller;
		spi-max-frequency = <200000>;
		reg = <0>;
		label = "4HC595";
		#gpio-cells = <2>;
		ngpios = <8>;
    };
};