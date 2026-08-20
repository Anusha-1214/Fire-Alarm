`timescale 1ns/1ps

module fire_alarm_tb;

    reg clk;
    reg reset;

    reg smoke_detected;
    reg high_temperature;

    wire alarm;
    wire warning;

    // Instantiate Fire Alarm
    fire_alarm uut (
        .clk(clk),
        .reset(reset),
        .smoke_detected(smoke_detected),
        .high_temperature(high_temperature),
        .alarm(alarm),
        .warning(warning)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("fire_alarm.vcd");
        $dumpvars(0, fire_alarm_tb);

        // Initial values
        clk = 0;
        reset = 1;
        smoke_detected = 0;
        high_temperature = 0;

        #10;

        // Release reset
        reset = 0;

        // ------------------------------------
        // TEST 1: Normal Condition
        // ------------------------------------

        #10;
        smoke_detected = 0;
        high_temperature = 0;

        #10;

        // ------------------------------------
        // TEST 2: Smoke Detected
        // Alarm should turn ON
        // ------------------------------------

        smoke_detected = 1;
        high_temperature = 0;

        #10;

        // ------------------------------------
        // TEST 3: High Temperature
        // Alarm should remain ON
        // ------------------------------------

        smoke_detected = 0;
        high_temperature = 1;

        #10;

        // ------------------------------------
        // TEST 4: Both Smoke and
        // High Temperature
        // ------------------------------------

        smoke_detected = 1;
        high_temperature = 1;

        #10;

        // ------------------------------------
        // TEST 5: Return to Normal
        // Alarm should turn OFF
        // ------------------------------------

        smoke_detected = 0;
        high_temperature = 0;

        #20;

        $finish;

    end

    // Display simulation output
    initial begin

        $monitor(
            "Time=%0t | Smoke=%b | High_Temp=%b | Alarm=%b | Warning=%b",
            $time,
            smoke_detected,
            high_temperature,
            alarm,
            warning
        );

    end

endmodule
