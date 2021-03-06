/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module move_8 (
    input clk,
    input rst,
    input [48:0] selectedpositionfromselect,
    input [48:0] player1,
    input [48:0] player2,
    input player,
    input [2:0] buttons,
    input [0:0] confirmbutton,
    output reg [48:0] positionmovedto,
    output reg [48:0] newplayer1,
    output reg [48:0] newplayer2,
    output reg [48:0] test
  );
  
  
  
  localparam IDLE_movestates = 3'd0;
  localparam UP_movestates = 3'd1;
  localparam DOWN_movestates = 3'd2;
  localparam LEFT_movestates = 3'd3;
  localparam RIGHT_movestates = 3'd4;
  
  reg [2:0] M_movestates_d, M_movestates_q = IDLE_movestates;
  wire [49-1:0] M_adjacencymat_currentposition;
  wire [49-1:0] M_adjacencymat_adjmatrix;
  reg [3-1:0] M_adjacencymat_button;
  reg [1-1:0] M_adjacencymat_player;
  reg [49-1:0] M_adjacencymat_currentstate;
  adjacencymat_30 adjacencymat (
    .rst(rst),
    .clk(clk),
    .button(M_adjacencymat_button),
    .player(M_adjacencymat_player),
    .currentstate(M_adjacencymat_currentstate),
    .currentposition(M_adjacencymat_currentposition),
    .adjmatrix(M_adjacencymat_adjmatrix)
  );
  wire [49-1:0] M_lightupbeforemove_positionstolightup;
  reg [49-1:0] M_lightupbeforemove_selectedposition;
  reg [49-1:0] M_lightupbeforemove_player1;
  reg [49-1:0] M_lightupbeforemove_player2;
  reg [1-1:0] M_lightupbeforemove_player;
  lightupbeforemove_32 lightupbeforemove (
    .rst(rst),
    .clk(clk),
    .selectedposition(M_lightupbeforemove_selectedposition),
    .player1(M_lightupbeforemove_player1),
    .player2(M_lightupbeforemove_player2),
    .player(M_lightupbeforemove_player),
    .positionstolightup(M_lightupbeforemove_positionstolightup)
  );
  reg [48:0] M_selectedpositiontomoveto_d, M_selectedpositiontomoveto_q = 1'h0;
  reg [48:0] M_checkposition_d, M_checkposition_q = 1'h0;
  
  reg [48:0] selectedpositiontomovetoSIG;
  
  reg [48:0] checkpositionSIG;
  
  always @* begin
    M_movestates_d = M_movestates_q;
    M_selectedpositiontomoveto_d = M_selectedpositiontomoveto_q;
    
    test = M_lightupbeforemove_positionstolightup;
    M_lightupbeforemove_player = player;
    M_lightupbeforemove_player1 = player1;
    M_lightupbeforemove_player2 = player2;
    M_lightupbeforemove_selectedposition = selectedpositionfromselect;
    M_adjacencymat_button = buttons;
    M_adjacencymat_currentstate = selectedpositionfromselect;
    M_adjacencymat_player = player;
    newplayer1 = player1;
    newplayer2 = player2;
    positionmovedto = selectedpositionfromselect;
    M_movestates_d = IDLE_movestates;
    
    case (M_movestates_q)
      IDLE_movestates: begin
        positionmovedto = selectedpositionfromselect;
        newplayer1 = player1;
        newplayer2 = player2;
        if (buttons == 3'h6) begin
          selectedpositiontomovetoSIG = M_adjacencymat_currentposition;
          checkpositionSIG = selectedpositiontomovetoSIG & M_lightupbeforemove_positionstolightup;
          positionmovedto = selectedpositionfromselect;
          newplayer1 = player1;
          newplayer2 = player2;
          if (checkpositionSIG == selectedpositiontomovetoSIG) begin
            M_movestates_d = UP_movestates;
            M_selectedpositiontomoveto_d = M_adjacencymat_currentposition;
          end
        end else begin
          if (buttons == 3'h2) begin
            selectedpositiontomovetoSIG = M_adjacencymat_currentposition;
            checkpositionSIG = selectedpositiontomovetoSIG & M_lightupbeforemove_positionstolightup;
            positionmovedto = selectedpositionfromselect;
            newplayer1 = player1;
            newplayer2 = player2;
            if (checkpositionSIG == selectedpositiontomovetoSIG) begin
              M_movestates_d = LEFT_movestates;
              M_selectedpositiontomoveto_d = M_adjacencymat_currentposition;
            end
          end else begin
            if (buttons == 3'h1) begin
              selectedpositiontomovetoSIG = M_adjacencymat_currentposition;
              checkpositionSIG = selectedpositiontomovetoSIG & M_lightupbeforemove_positionstolightup;
              positionmovedto = selectedpositionfromselect;
              newplayer1 = player1;
              newplayer2 = player2;
              if (checkpositionSIG == selectedpositiontomovetoSIG) begin
                M_movestates_d = RIGHT_movestates;
                M_selectedpositiontomoveto_d = M_adjacencymat_currentposition;
              end
            end else begin
              if (buttons == 3'h7) begin
                selectedpositiontomovetoSIG = M_adjacencymat_currentposition;
                checkpositionSIG = selectedpositiontomovetoSIG & M_lightupbeforemove_positionstolightup;
                positionmovedto = selectedpositionfromselect;
                newplayer1 = player1;
                newplayer2 = player2;
                if (checkpositionSIG == selectedpositiontomovetoSIG) begin
                  M_movestates_d = DOWN_movestates;
                  M_selectedpositiontomoveto_d = M_adjacencymat_currentposition;
                end
              end else begin
                M_movestates_d = IDLE_movestates;
              end
            end
          end
        end
      end
      UP_movestates: begin
        positionmovedto = M_selectedpositiontomoveto_q;
        if (player == 1'h0) begin
          newplayer1 = (player1 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
          newplayer2 = player2;
        end else begin
          if (player == 1'h1) begin
            newplayer2 = (player2 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
            newplayer1 = player1;
          end
        end
        if (buttons == 3'h7) begin
          M_movestates_d = IDLE_movestates;
          positionmovedto = selectedpositionfromselect;
          newplayer1 = player1;
          newplayer2 = player2;
        end else begin
          if (confirmbutton == 1'h1) begin
            M_movestates_d = IDLE_movestates;
          end else begin
            M_movestates_d = UP_movestates;
            positionmovedto = M_selectedpositiontomoveto_q;
            if (player == 1'h0) begin
              newplayer1 = (player1 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
              newplayer2 = player2;
            end else begin
              if (player == 1'h1) begin
                newplayer2 = (player2 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
                newplayer1 = player1;
              end
            end
          end
        end
      end
      LEFT_movestates: begin
        positionmovedto = M_selectedpositiontomoveto_q;
        if (player == 1'h0) begin
          newplayer1 = (player1 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
          newplayer2 = player2;
        end else begin
          if (player == 1'h1) begin
            newplayer2 = (player2 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
            newplayer1 = player1;
          end
        end
        if (buttons == 3'h1) begin
          M_movestates_d = IDLE_movestates;
          positionmovedto = selectedpositionfromselect;
          newplayer1 = player1;
          newplayer2 = player2;
        end else begin
          if (confirmbutton == 1'h1) begin
            M_movestates_d = IDLE_movestates;
          end else begin
            M_movestates_d = LEFT_movestates;
            positionmovedto = M_selectedpositiontomoveto_q;
            if (player == 1'h0) begin
              newplayer1 = (player1 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
              newplayer2 = player2;
            end else begin
              if (player == 1'h1) begin
                newplayer2 = (player2 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
                newplayer1 = player1;
              end
            end
          end
        end
      end
      DOWN_movestates: begin
        positionmovedto = M_selectedpositiontomoveto_q;
        if (player == 1'h0) begin
          newplayer1 = (player1 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
          newplayer2 = player2;
        end else begin
          if (player == 1'h1) begin
            newplayer2 = (player2 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
            newplayer1 = player1;
          end
        end
        if (buttons == 3'h6) begin
          M_movestates_d = IDLE_movestates;
          positionmovedto = selectedpositionfromselect;
          newplayer1 = player1;
          newplayer2 = player2;
        end else begin
          if (confirmbutton == 1'h1) begin
            M_movestates_d = IDLE_movestates;
          end else begin
            M_movestates_d = DOWN_movestates;
            positionmovedto = M_selectedpositiontomoveto_q;
            if (player == 1'h0) begin
              newplayer1 = (player1 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
              newplayer2 = player2;
            end else begin
              if (player == 1'h1) begin
                newplayer2 = (player2 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
                newplayer1 = player1;
              end
            end
          end
        end
      end
      RIGHT_movestates: begin
        positionmovedto = M_selectedpositiontomoveto_q;
        if (player == 1'h0) begin
          newplayer1 = (player1 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
          newplayer2 = player2;
        end else begin
          if (player == 1'h1) begin
            newplayer2 = (player2 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
            newplayer1 = player1;
          end
        end
        if (buttons == 3'h2) begin
          M_movestates_d = IDLE_movestates;
          positionmovedto = selectedpositionfromselect;
          newplayer1 = player1;
          newplayer2 = player2;
        end else begin
          if (confirmbutton == 1'h1) begin
            M_movestates_d = IDLE_movestates;
          end else begin
            M_movestates_d = RIGHT_movestates;
            positionmovedto = M_selectedpositiontomoveto_q;
            if (player == 1'h0) begin
              newplayer1 = (player1 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
              newplayer2 = player2;
            end else begin
              if (player == 1'h1) begin
                newplayer2 = (player2 & ~selectedpositionfromselect) | M_selectedpositiontomoveto_q;
                newplayer1 = player1;
              end
            end
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_selectedpositiontomoveto_q <= 1'h0;
      M_checkposition_q <= 1'h0;
      M_movestates_q <= 1'h0;
    end else begin
      M_selectedpositiontomoveto_q <= M_selectedpositiontomoveto_d;
      M_checkposition_q <= M_checkposition_d;
      M_movestates_q <= M_movestates_d;
    end
  end
  
endmodule
