module Traffic #(
    parameter Green  = 2'b00,
    parameter Yellow = 2'b01,
    parameter Red    = 2'b10,
    parameter TIME_LIMIT = 1
	
)(
    input clk, reset,
    output [1:0] resilt
);

    reg [1:0] current_state;
    reg [3:0] timer; 

    assign resilt = current_state; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= Green;
            timer <= 0;
        end 
        else begin
            if (timer >= TIME_LIMIT) begin
                timer <= 0;
                case (current_state)
                    Green:  current_state <= Yellow;
                    Yellow: current_state <= Red;
                    Red:    current_state <= Green;
                    default: current_state <= Green;
                endcase
            end
            else begin
                timer <= timer + 1;
            end
        end
    end

endmodule