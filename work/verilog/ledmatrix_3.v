/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     GND = 7
     DIV = 16
*/
module ledmatrix_3 (
    input clk,
    input rst,
    input [146:0] values,
    input [48:0] blinking,
    output reg [6:0] row,
    output reg [6:0] columnred,
    output reg [6:0] columngreen,
    output reg [6:0] columnblue
  );
  
  localparam GND = 3'h7;
  localparam DIV = 5'h10;
  
  
  localparam GND_BITS = 2'h3;
  
  wire [3-1:0] M_ctr_value;
  counter_10 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  wire [1-1:0] M_myBlinker_blink;
  blinker_11 myBlinker (
    .clk(clk),
    .rst(rst),
    .blink(M_myBlinker_blink)
  );
  
  wire [49-1:0] M_ledDecoder_outred;
  wire [49-1:0] M_ledDecoder_outgreen;
  wire [49-1:0] M_ledDecoder_outblue;
  reg [147-1:0] M_ledDecoder_in;
  ledmatrixdecoder_12 ledDecoder (
    .in(M_ledDecoder_in),
    .outred(M_ledDecoder_outred),
    .outgreen(M_ledDecoder_outgreen),
    .outblue(M_ledDecoder_outblue)
  );
  
  wire [7-1:0] M_digitDecoder_out;
  reg [3-1:0] M_digitDecoder_in;
  myDigitsDecoder_13 digitDecoder (
    .in(M_digitDecoder_in),
    .out(M_digitDecoder_out)
  );
  
  wire [49-1:0] M_blinkDecoder_out;
  reg [49-1:0] M_blinkDecoder_in;
  blinkingdecoder_14 blinkDecoder (
    .in(M_blinkDecoder_in),
    .out(M_blinkDecoder_out)
  );
  
  always @* begin
    M_ledDecoder_in = values;
    columnred = M_ledDecoder_outred[(M_ctr_value)*7+6-:7];
    columngreen = M_ledDecoder_outgreen[(M_ctr_value)*7+6-:7];
    columnblue = M_ledDecoder_outblue[(M_ctr_value)*7+6-:7];
    M_digitDecoder_in = M_ctr_value;
    row = M_digitDecoder_out;
    M_blinkDecoder_in = blinking;
    if (M_blinkDecoder_out[(M_ctr_value)*7+0+0-:1] == 1'h1) begin
      if (M_ledDecoder_outred[(M_ctr_value)*7+0+0-:1] == 1'h1) begin
        columnred[0+0-:1] = M_myBlinker_blink;
      end else begin
        if (M_ledDecoder_outgreen[(M_ctr_value)*7+0+0-:1] == 1'h1) begin
          columngreen[0+0-:1] = M_myBlinker_blink;
        end else begin
          if (M_ledDecoder_outblue[(M_ctr_value)*7+0+0-:1] == 1'h1) begin
            columnblue[0+0-:1] = M_myBlinker_blink;
          end else begin
            columnred[0+0-:1] = M_myBlinker_blink;
            columngreen[0+0-:1] = M_myBlinker_blink;
            columnblue[0+0-:1] = M_myBlinker_blink;
          end
        end
      end
    end
    if (M_blinkDecoder_out[(M_ctr_value)*7+1+0-:1] == 1'h1) begin
      if (M_ledDecoder_outred[(M_ctr_value)*7+1+0-:1] == 1'h1) begin
        columnred[1+0-:1] = M_myBlinker_blink;
      end else begin
        if (M_ledDecoder_outgreen[(M_ctr_value)*7+1+0-:1] == 1'h1) begin
          columngreen[1+0-:1] = M_myBlinker_blink;
        end else begin
          if (M_ledDecoder_outblue[(M_ctr_value)*7+1+0-:1] == 1'h1) begin
            columnblue[1+0-:1] = M_myBlinker_blink;
          end else begin
            columnred[1+0-:1] = M_myBlinker_blink;
            columngreen[1+0-:1] = M_myBlinker_blink;
            columnblue[1+0-:1] = M_myBlinker_blink;
          end
        end
      end
    end
    if (M_blinkDecoder_out[(M_ctr_value)*7+2+0-:1] == 1'h1) begin
      if (M_ledDecoder_outred[(M_ctr_value)*7+2+0-:1] == 1'h1) begin
        columnred[2+0-:1] = M_myBlinker_blink;
      end else begin
        if (M_ledDecoder_outgreen[(M_ctr_value)*7+2+0-:1] == 1'h1) begin
          columngreen[2+0-:1] = M_myBlinker_blink;
        end else begin
          if (M_ledDecoder_outblue[(M_ctr_value)*7+2+0-:1] == 1'h1) begin
            columnblue[2+0-:1] = M_myBlinker_blink;
          end else begin
            columnred[2+0-:1] = M_myBlinker_blink;
            columngreen[2+0-:1] = M_myBlinker_blink;
            columnblue[2+0-:1] = M_myBlinker_blink;
          end
        end
      end
    end
    if (M_blinkDecoder_out[(M_ctr_value)*7+3+0-:1] == 1'h1) begin
      if (M_ledDecoder_outred[(M_ctr_value)*7+3+0-:1] == 1'h1) begin
        columnred[3+0-:1] = M_myBlinker_blink;
      end else begin
        if (M_ledDecoder_outgreen[(M_ctr_value)*7+3+0-:1] == 1'h1) begin
          columngreen[3+0-:1] = M_myBlinker_blink;
        end else begin
          if (M_ledDecoder_outblue[(M_ctr_value)*7+3+0-:1] == 1'h1) begin
            columnblue[3+0-:1] = M_myBlinker_blink;
          end else begin
            columnred[3+0-:1] = M_myBlinker_blink;
            columngreen[3+0-:1] = M_myBlinker_blink;
            columnblue[3+0-:1] = M_myBlinker_blink;
          end
        end
      end
    end
    if (M_blinkDecoder_out[(M_ctr_value)*7+4+0-:1] == 1'h1) begin
      if (M_ledDecoder_outred[(M_ctr_value)*7+4+0-:1] == 1'h1) begin
        columnred[4+0-:1] = M_myBlinker_blink;
      end else begin
        if (M_ledDecoder_outgreen[(M_ctr_value)*7+4+0-:1] == 1'h1) begin
          columngreen[4+0-:1] = M_myBlinker_blink;
        end else begin
          if (M_ledDecoder_outblue[(M_ctr_value)*7+4+0-:1] == 1'h1) begin
            columnblue[4+0-:1] = M_myBlinker_blink;
          end else begin
            columnred[4+0-:1] = M_myBlinker_blink;
            columngreen[4+0-:1] = M_myBlinker_blink;
            columnblue[4+0-:1] = M_myBlinker_blink;
          end
        end
      end
    end
    if (M_blinkDecoder_out[(M_ctr_value)*7+5+0-:1] == 1'h1) begin
      if (M_ledDecoder_outred[(M_ctr_value)*7+5+0-:1] == 1'h1) begin
        columnred[5+0-:1] = M_myBlinker_blink;
      end else begin
        if (M_ledDecoder_outgreen[(M_ctr_value)*7+5+0-:1] == 1'h1) begin
          columngreen[5+0-:1] = M_myBlinker_blink;
        end else begin
          if (M_ledDecoder_outblue[(M_ctr_value)*7+5+0-:1] == 1'h1) begin
            columnblue[5+0-:1] = M_myBlinker_blink;
          end else begin
            columnred[5+0-:1] = M_myBlinker_blink;
            columngreen[5+0-:1] = M_myBlinker_blink;
            columnblue[5+0-:1] = M_myBlinker_blink;
          end
        end
      end
    end
    if (M_blinkDecoder_out[(M_ctr_value)*7+6+0-:1] == 1'h1) begin
      if (M_ledDecoder_outred[(M_ctr_value)*7+6+0-:1] == 1'h1) begin
        columnred[6+0-:1] = M_myBlinker_blink;
      end else begin
        if (M_ledDecoder_outgreen[(M_ctr_value)*7+6+0-:1] == 1'h1) begin
          columngreen[6+0-:1] = M_myBlinker_blink;
        end else begin
          if (M_ledDecoder_outblue[(M_ctr_value)*7+6+0-:1] == 1'h1) begin
            columnblue[6+0-:1] = M_myBlinker_blink;
          end else begin
            columnred[6+0-:1] = M_myBlinker_blink;
            columngreen[6+0-:1] = M_myBlinker_blink;
            columnblue[6+0-:1] = M_myBlinker_blink;
          end
        end
      end
    end
  end
endmodule
