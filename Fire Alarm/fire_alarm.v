`timescale 1ns/1ps

module fire_alarm (
    input  wire clk,
    input  wire reset,

    // Smoke sensor
    // 0 = No smoke
    // 1 = Smoke detected
    input  wire smoke_detected,

    // Temperature sensor
    // 0 = Normal temperature
    // 1 = High temperature
    input  wire high_temperature,

    // Outputs
    output reg alarm,
    output reg warning
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            alarm   <= 1'b0;
            warning <= 1'b0;
        end

        else begin

            // Fire condition:
            // Smoke OR high temperature

            if (smoke_detected || high_temperature) begin
                alarm   <= 1'b1;
                warning <= 1'b1;
            end

            else begin
                alarm   <= 1'b0;
                warning <= 1'b0;
            end

        end
    end

endmodule
