//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.11.03
//Part Number: GW5A-LV25MG121NC1/I0
//Device: GW5A-25
//Device Version: A
//Created Time: Sat Sep 19 10:40:03 2026

module Gowin_SP_ram (dout, clk, oce, ce, reset, wre, ad, din);

output [7:0] dout;
input clk;
input oce;
input ce;
input reset;
input wre;
input [16:0] ad;
input [7:0] din;

wire [30:0] sp_inst_0_dout_w;
wire [0:0] sp_inst_0_dout;
wire [30:0] sp_inst_1_dout_w;
wire [0:0] sp_inst_1_dout;
wire [30:0] sp_inst_2_dout_w;
wire [0:0] sp_inst_2_dout;
wire [30:0] sp_inst_3_dout_w;
wire [0:0] sp_inst_3_dout;
wire [30:0] sp_inst_4_dout_w;
wire [0:0] sp_inst_4_dout;
wire [30:0] sp_inst_5_dout_w;
wire [0:0] sp_inst_5_dout;
wire [30:0] sp_inst_6_dout_w;
wire [1:1] sp_inst_6_dout;
wire [30:0] sp_inst_7_dout_w;
wire [1:1] sp_inst_7_dout;
wire [30:0] sp_inst_8_dout_w;
wire [1:1] sp_inst_8_dout;
wire [30:0] sp_inst_9_dout_w;
wire [1:1] sp_inst_9_dout;
wire [30:0] sp_inst_10_dout_w;
wire [1:1] sp_inst_10_dout;
wire [30:0] sp_inst_11_dout_w;
wire [1:1] sp_inst_11_dout;
wire [30:0] sp_inst_12_dout_w;
wire [2:2] sp_inst_12_dout;
wire [30:0] sp_inst_13_dout_w;
wire [2:2] sp_inst_13_dout;
wire [30:0] sp_inst_14_dout_w;
wire [2:2] sp_inst_14_dout;
wire [30:0] sp_inst_15_dout_w;
wire [2:2] sp_inst_15_dout;
wire [30:0] sp_inst_16_dout_w;
wire [2:2] sp_inst_16_dout;
wire [30:0] sp_inst_17_dout_w;
wire [2:2] sp_inst_17_dout;
wire [30:0] sp_inst_18_dout_w;
wire [3:3] sp_inst_18_dout;
wire [30:0] sp_inst_19_dout_w;
wire [3:3] sp_inst_19_dout;
wire [30:0] sp_inst_20_dout_w;
wire [3:3] sp_inst_20_dout;
wire [30:0] sp_inst_21_dout_w;
wire [3:3] sp_inst_21_dout;
wire [30:0] sp_inst_22_dout_w;
wire [3:3] sp_inst_22_dout;
wire [30:0] sp_inst_23_dout_w;
wire [3:3] sp_inst_23_dout;
wire [30:0] sp_inst_24_dout_w;
wire [4:4] sp_inst_24_dout;
wire [30:0] sp_inst_25_dout_w;
wire [4:4] sp_inst_25_dout;
wire [30:0] sp_inst_26_dout_w;
wire [4:4] sp_inst_26_dout;
wire [30:0] sp_inst_27_dout_w;
wire [4:4] sp_inst_27_dout;
wire [30:0] sp_inst_28_dout_w;
wire [4:4] sp_inst_28_dout;
wire [30:0] sp_inst_29_dout_w;
wire [4:4] sp_inst_29_dout;
wire [30:0] sp_inst_30_dout_w;
wire [5:5] sp_inst_30_dout;
wire [30:0] sp_inst_31_dout_w;
wire [5:5] sp_inst_31_dout;
wire [30:0] sp_inst_32_dout_w;
wire [5:5] sp_inst_32_dout;
wire [30:0] sp_inst_33_dout_w;
wire [5:5] sp_inst_33_dout;
wire [30:0] sp_inst_34_dout_w;
wire [5:5] sp_inst_34_dout;
wire [30:0] sp_inst_35_dout_w;
wire [5:5] sp_inst_35_dout;
wire [30:0] sp_inst_36_dout_w;
wire [6:6] sp_inst_36_dout;
wire [30:0] sp_inst_37_dout_w;
wire [6:6] sp_inst_37_dout;
wire [30:0] sp_inst_38_dout_w;
wire [6:6] sp_inst_38_dout;
wire [30:0] sp_inst_39_dout_w;
wire [6:6] sp_inst_39_dout;
wire [30:0] sp_inst_40_dout_w;
wire [6:6] sp_inst_40_dout;
wire [30:0] sp_inst_41_dout_w;
wire [6:6] sp_inst_41_dout;
wire [30:0] sp_inst_42_dout_w;
wire [7:7] sp_inst_42_dout;
wire [30:0] sp_inst_43_dout_w;
wire [7:7] sp_inst_43_dout;
wire [30:0] sp_inst_44_dout_w;
wire [7:7] sp_inst_44_dout;
wire [30:0] sp_inst_45_dout_w;
wire [7:7] sp_inst_45_dout;
wire [30:0] sp_inst_46_dout_w;
wire [7:7] sp_inst_46_dout;
wire [30:0] sp_inst_47_dout_w;
wire [7:7] sp_inst_47_dout;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire mux_o_0;
wire mux_o_1;
wire mux_o_2;
wire mux_o_3;
wire mux_o_6;
wire mux_o_7;
wire mux_o_8;
wire mux_o_9;
wire mux_o_12;
wire mux_o_13;
wire mux_o_14;
wire mux_o_15;
wire mux_o_18;
wire mux_o_19;
wire mux_o_20;
wire mux_o_21;
wire mux_o_24;
wire mux_o_25;
wire mux_o_26;
wire mux_o_27;
wire mux_o_30;
wire mux_o_31;
wire mux_o_32;
wire mux_o_33;
wire mux_o_36;
wire mux_o_37;
wire mux_o_38;
wire mux_o_39;
wire mux_o_42;
wire mux_o_43;
wire mux_o_44;
wire mux_o_45;
wire ce_w;
wire gw_gnd;

assign ce_w = ~wre & ce;
assign gw_gnd = 1'b0;

SP sp_inst_0 (
    .DO({sp_inst_0_dout_w[30:0],sp_inst_0_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[0]})
);

defparam sp_inst_0.READ_MODE = 1'b0;
defparam sp_inst_0.WRITE_MODE = 2'b00;
defparam sp_inst_0.BIT_WIDTH = 1;
defparam sp_inst_0.BLK_SEL = 3'b000;
defparam sp_inst_0.RESET_MODE = "SYNC";

SP sp_inst_1 (
    .DO({sp_inst_1_dout_w[30:0],sp_inst_1_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[0]})
);

defparam sp_inst_1.READ_MODE = 1'b0;
defparam sp_inst_1.WRITE_MODE = 2'b00;
defparam sp_inst_1.BIT_WIDTH = 1;
defparam sp_inst_1.BLK_SEL = 3'b001;
defparam sp_inst_1.RESET_MODE = "SYNC";

SP sp_inst_2 (
    .DO({sp_inst_2_dout_w[30:0],sp_inst_2_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[0]})
);

defparam sp_inst_2.READ_MODE = 1'b0;
defparam sp_inst_2.WRITE_MODE = 2'b00;
defparam sp_inst_2.BIT_WIDTH = 1;
defparam sp_inst_2.BLK_SEL = 3'b010;
defparam sp_inst_2.RESET_MODE = "SYNC";

SP sp_inst_3 (
    .DO({sp_inst_3_dout_w[30:0],sp_inst_3_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[0]})
);

defparam sp_inst_3.READ_MODE = 1'b0;
defparam sp_inst_3.WRITE_MODE = 2'b00;
defparam sp_inst_3.BIT_WIDTH = 1;
defparam sp_inst_3.BLK_SEL = 3'b011;
defparam sp_inst_3.RESET_MODE = "SYNC";

SP sp_inst_4 (
    .DO({sp_inst_4_dout_w[30:0],sp_inst_4_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[0]})
);

defparam sp_inst_4.READ_MODE = 1'b0;
defparam sp_inst_4.WRITE_MODE = 2'b00;
defparam sp_inst_4.BIT_WIDTH = 1;
defparam sp_inst_4.BLK_SEL = 3'b100;
defparam sp_inst_4.RESET_MODE = "SYNC";

SP sp_inst_5 (
    .DO({sp_inst_5_dout_w[30:0],sp_inst_5_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[0]})
);

defparam sp_inst_5.READ_MODE = 1'b0;
defparam sp_inst_5.WRITE_MODE = 2'b00;
defparam sp_inst_5.BIT_WIDTH = 1;
defparam sp_inst_5.BLK_SEL = 3'b101;
defparam sp_inst_5.RESET_MODE = "SYNC";

SP sp_inst_6 (
    .DO({sp_inst_6_dout_w[30:0],sp_inst_6_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1]})
);

defparam sp_inst_6.READ_MODE = 1'b0;
defparam sp_inst_6.WRITE_MODE = 2'b00;
defparam sp_inst_6.BIT_WIDTH = 1;
defparam sp_inst_6.BLK_SEL = 3'b000;
defparam sp_inst_6.RESET_MODE = "SYNC";

SP sp_inst_7 (
    .DO({sp_inst_7_dout_w[30:0],sp_inst_7_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1]})
);

defparam sp_inst_7.READ_MODE = 1'b0;
defparam sp_inst_7.WRITE_MODE = 2'b00;
defparam sp_inst_7.BIT_WIDTH = 1;
defparam sp_inst_7.BLK_SEL = 3'b001;
defparam sp_inst_7.RESET_MODE = "SYNC";

SP sp_inst_8 (
    .DO({sp_inst_8_dout_w[30:0],sp_inst_8_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1]})
);

defparam sp_inst_8.READ_MODE = 1'b0;
defparam sp_inst_8.WRITE_MODE = 2'b00;
defparam sp_inst_8.BIT_WIDTH = 1;
defparam sp_inst_8.BLK_SEL = 3'b010;
defparam sp_inst_8.RESET_MODE = "SYNC";

SP sp_inst_9 (
    .DO({sp_inst_9_dout_w[30:0],sp_inst_9_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1]})
);

defparam sp_inst_9.READ_MODE = 1'b0;
defparam sp_inst_9.WRITE_MODE = 2'b00;
defparam sp_inst_9.BIT_WIDTH = 1;
defparam sp_inst_9.BLK_SEL = 3'b011;
defparam sp_inst_9.RESET_MODE = "SYNC";

SP sp_inst_10 (
    .DO({sp_inst_10_dout_w[30:0],sp_inst_10_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1]})
);

defparam sp_inst_10.READ_MODE = 1'b0;
defparam sp_inst_10.WRITE_MODE = 2'b00;
defparam sp_inst_10.BIT_WIDTH = 1;
defparam sp_inst_10.BLK_SEL = 3'b100;
defparam sp_inst_10.RESET_MODE = "SYNC";

SP sp_inst_11 (
    .DO({sp_inst_11_dout_w[30:0],sp_inst_11_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1]})
);

defparam sp_inst_11.READ_MODE = 1'b0;
defparam sp_inst_11.WRITE_MODE = 2'b00;
defparam sp_inst_11.BIT_WIDTH = 1;
defparam sp_inst_11.BLK_SEL = 3'b101;
defparam sp_inst_11.RESET_MODE = "SYNC";

SP sp_inst_12 (
    .DO({sp_inst_12_dout_w[30:0],sp_inst_12_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[2]})
);

defparam sp_inst_12.READ_MODE = 1'b0;
defparam sp_inst_12.WRITE_MODE = 2'b00;
defparam sp_inst_12.BIT_WIDTH = 1;
defparam sp_inst_12.BLK_SEL = 3'b000;
defparam sp_inst_12.RESET_MODE = "SYNC";

SP sp_inst_13 (
    .DO({sp_inst_13_dout_w[30:0],sp_inst_13_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[2]})
);

defparam sp_inst_13.READ_MODE = 1'b0;
defparam sp_inst_13.WRITE_MODE = 2'b00;
defparam sp_inst_13.BIT_WIDTH = 1;
defparam sp_inst_13.BLK_SEL = 3'b001;
defparam sp_inst_13.RESET_MODE = "SYNC";

SP sp_inst_14 (
    .DO({sp_inst_14_dout_w[30:0],sp_inst_14_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[2]})
);

defparam sp_inst_14.READ_MODE = 1'b0;
defparam sp_inst_14.WRITE_MODE = 2'b00;
defparam sp_inst_14.BIT_WIDTH = 1;
defparam sp_inst_14.BLK_SEL = 3'b010;
defparam sp_inst_14.RESET_MODE = "SYNC";

SP sp_inst_15 (
    .DO({sp_inst_15_dout_w[30:0],sp_inst_15_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[2]})
);

defparam sp_inst_15.READ_MODE = 1'b0;
defparam sp_inst_15.WRITE_MODE = 2'b00;
defparam sp_inst_15.BIT_WIDTH = 1;
defparam sp_inst_15.BLK_SEL = 3'b011;
defparam sp_inst_15.RESET_MODE = "SYNC";

SP sp_inst_16 (
    .DO({sp_inst_16_dout_w[30:0],sp_inst_16_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[2]})
);

defparam sp_inst_16.READ_MODE = 1'b0;
defparam sp_inst_16.WRITE_MODE = 2'b00;
defparam sp_inst_16.BIT_WIDTH = 1;
defparam sp_inst_16.BLK_SEL = 3'b100;
defparam sp_inst_16.RESET_MODE = "SYNC";

SP sp_inst_17 (
    .DO({sp_inst_17_dout_w[30:0],sp_inst_17_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[2]})
);

defparam sp_inst_17.READ_MODE = 1'b0;
defparam sp_inst_17.WRITE_MODE = 2'b00;
defparam sp_inst_17.BIT_WIDTH = 1;
defparam sp_inst_17.BLK_SEL = 3'b101;
defparam sp_inst_17.RESET_MODE = "SYNC";

SP sp_inst_18 (
    .DO({sp_inst_18_dout_w[30:0],sp_inst_18_dout[3]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3]})
);

defparam sp_inst_18.READ_MODE = 1'b0;
defparam sp_inst_18.WRITE_MODE = 2'b00;
defparam sp_inst_18.BIT_WIDTH = 1;
defparam sp_inst_18.BLK_SEL = 3'b000;
defparam sp_inst_18.RESET_MODE = "SYNC";

SP sp_inst_19 (
    .DO({sp_inst_19_dout_w[30:0],sp_inst_19_dout[3]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3]})
);

defparam sp_inst_19.READ_MODE = 1'b0;
defparam sp_inst_19.WRITE_MODE = 2'b00;
defparam sp_inst_19.BIT_WIDTH = 1;
defparam sp_inst_19.BLK_SEL = 3'b001;
defparam sp_inst_19.RESET_MODE = "SYNC";

SP sp_inst_20 (
    .DO({sp_inst_20_dout_w[30:0],sp_inst_20_dout[3]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3]})
);

defparam sp_inst_20.READ_MODE = 1'b0;
defparam sp_inst_20.WRITE_MODE = 2'b00;
defparam sp_inst_20.BIT_WIDTH = 1;
defparam sp_inst_20.BLK_SEL = 3'b010;
defparam sp_inst_20.RESET_MODE = "SYNC";

SP sp_inst_21 (
    .DO({sp_inst_21_dout_w[30:0],sp_inst_21_dout[3]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3]})
);

defparam sp_inst_21.READ_MODE = 1'b0;
defparam sp_inst_21.WRITE_MODE = 2'b00;
defparam sp_inst_21.BIT_WIDTH = 1;
defparam sp_inst_21.BLK_SEL = 3'b011;
defparam sp_inst_21.RESET_MODE = "SYNC";

SP sp_inst_22 (
    .DO({sp_inst_22_dout_w[30:0],sp_inst_22_dout[3]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3]})
);

defparam sp_inst_22.READ_MODE = 1'b0;
defparam sp_inst_22.WRITE_MODE = 2'b00;
defparam sp_inst_22.BIT_WIDTH = 1;
defparam sp_inst_22.BLK_SEL = 3'b100;
defparam sp_inst_22.RESET_MODE = "SYNC";

SP sp_inst_23 (
    .DO({sp_inst_23_dout_w[30:0],sp_inst_23_dout[3]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3]})
);

defparam sp_inst_23.READ_MODE = 1'b0;
defparam sp_inst_23.WRITE_MODE = 2'b00;
defparam sp_inst_23.BIT_WIDTH = 1;
defparam sp_inst_23.BLK_SEL = 3'b101;
defparam sp_inst_23.RESET_MODE = "SYNC";

SP sp_inst_24 (
    .DO({sp_inst_24_dout_w[30:0],sp_inst_24_dout[4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[4]})
);

defparam sp_inst_24.READ_MODE = 1'b0;
defparam sp_inst_24.WRITE_MODE = 2'b00;
defparam sp_inst_24.BIT_WIDTH = 1;
defparam sp_inst_24.BLK_SEL = 3'b000;
defparam sp_inst_24.RESET_MODE = "SYNC";

SP sp_inst_25 (
    .DO({sp_inst_25_dout_w[30:0],sp_inst_25_dout[4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[4]})
);

defparam sp_inst_25.READ_MODE = 1'b0;
defparam sp_inst_25.WRITE_MODE = 2'b00;
defparam sp_inst_25.BIT_WIDTH = 1;
defparam sp_inst_25.BLK_SEL = 3'b001;
defparam sp_inst_25.RESET_MODE = "SYNC";

SP sp_inst_26 (
    .DO({sp_inst_26_dout_w[30:0],sp_inst_26_dout[4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[4]})
);

defparam sp_inst_26.READ_MODE = 1'b0;
defparam sp_inst_26.WRITE_MODE = 2'b00;
defparam sp_inst_26.BIT_WIDTH = 1;
defparam sp_inst_26.BLK_SEL = 3'b010;
defparam sp_inst_26.RESET_MODE = "SYNC";

SP sp_inst_27 (
    .DO({sp_inst_27_dout_w[30:0],sp_inst_27_dout[4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[4]})
);

defparam sp_inst_27.READ_MODE = 1'b0;
defparam sp_inst_27.WRITE_MODE = 2'b00;
defparam sp_inst_27.BIT_WIDTH = 1;
defparam sp_inst_27.BLK_SEL = 3'b011;
defparam sp_inst_27.RESET_MODE = "SYNC";

SP sp_inst_28 (
    .DO({sp_inst_28_dout_w[30:0],sp_inst_28_dout[4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[4]})
);

defparam sp_inst_28.READ_MODE = 1'b0;
defparam sp_inst_28.WRITE_MODE = 2'b00;
defparam sp_inst_28.BIT_WIDTH = 1;
defparam sp_inst_28.BLK_SEL = 3'b100;
defparam sp_inst_28.RESET_MODE = "SYNC";

SP sp_inst_29 (
    .DO({sp_inst_29_dout_w[30:0],sp_inst_29_dout[4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[4]})
);

defparam sp_inst_29.READ_MODE = 1'b0;
defparam sp_inst_29.WRITE_MODE = 2'b00;
defparam sp_inst_29.BIT_WIDTH = 1;
defparam sp_inst_29.BLK_SEL = 3'b101;
defparam sp_inst_29.RESET_MODE = "SYNC";

SP sp_inst_30 (
    .DO({sp_inst_30_dout_w[30:0],sp_inst_30_dout[5]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5]})
);

defparam sp_inst_30.READ_MODE = 1'b0;
defparam sp_inst_30.WRITE_MODE = 2'b00;
defparam sp_inst_30.BIT_WIDTH = 1;
defparam sp_inst_30.BLK_SEL = 3'b000;
defparam sp_inst_30.RESET_MODE = "SYNC";

SP sp_inst_31 (
    .DO({sp_inst_31_dout_w[30:0],sp_inst_31_dout[5]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5]})
);

defparam sp_inst_31.READ_MODE = 1'b0;
defparam sp_inst_31.WRITE_MODE = 2'b00;
defparam sp_inst_31.BIT_WIDTH = 1;
defparam sp_inst_31.BLK_SEL = 3'b001;
defparam sp_inst_31.RESET_MODE = "SYNC";

SP sp_inst_32 (
    .DO({sp_inst_32_dout_w[30:0],sp_inst_32_dout[5]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5]})
);

defparam sp_inst_32.READ_MODE = 1'b0;
defparam sp_inst_32.WRITE_MODE = 2'b00;
defparam sp_inst_32.BIT_WIDTH = 1;
defparam sp_inst_32.BLK_SEL = 3'b010;
defparam sp_inst_32.RESET_MODE = "SYNC";

SP sp_inst_33 (
    .DO({sp_inst_33_dout_w[30:0],sp_inst_33_dout[5]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5]})
);

defparam sp_inst_33.READ_MODE = 1'b0;
defparam sp_inst_33.WRITE_MODE = 2'b00;
defparam sp_inst_33.BIT_WIDTH = 1;
defparam sp_inst_33.BLK_SEL = 3'b011;
defparam sp_inst_33.RESET_MODE = "SYNC";

SP sp_inst_34 (
    .DO({sp_inst_34_dout_w[30:0],sp_inst_34_dout[5]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5]})
);

defparam sp_inst_34.READ_MODE = 1'b0;
defparam sp_inst_34.WRITE_MODE = 2'b00;
defparam sp_inst_34.BIT_WIDTH = 1;
defparam sp_inst_34.BLK_SEL = 3'b100;
defparam sp_inst_34.RESET_MODE = "SYNC";

SP sp_inst_35 (
    .DO({sp_inst_35_dout_w[30:0],sp_inst_35_dout[5]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5]})
);

defparam sp_inst_35.READ_MODE = 1'b0;
defparam sp_inst_35.WRITE_MODE = 2'b00;
defparam sp_inst_35.BIT_WIDTH = 1;
defparam sp_inst_35.BLK_SEL = 3'b101;
defparam sp_inst_35.RESET_MODE = "SYNC";

SP sp_inst_36 (
    .DO({sp_inst_36_dout_w[30:0],sp_inst_36_dout[6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[6]})
);

defparam sp_inst_36.READ_MODE = 1'b0;
defparam sp_inst_36.WRITE_MODE = 2'b00;
defparam sp_inst_36.BIT_WIDTH = 1;
defparam sp_inst_36.BLK_SEL = 3'b000;
defparam sp_inst_36.RESET_MODE = "SYNC";

SP sp_inst_37 (
    .DO({sp_inst_37_dout_w[30:0],sp_inst_37_dout[6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[6]})
);

defparam sp_inst_37.READ_MODE = 1'b0;
defparam sp_inst_37.WRITE_MODE = 2'b00;
defparam sp_inst_37.BIT_WIDTH = 1;
defparam sp_inst_37.BLK_SEL = 3'b001;
defparam sp_inst_37.RESET_MODE = "SYNC";

SP sp_inst_38 (
    .DO({sp_inst_38_dout_w[30:0],sp_inst_38_dout[6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[6]})
);

defparam sp_inst_38.READ_MODE = 1'b0;
defparam sp_inst_38.WRITE_MODE = 2'b00;
defparam sp_inst_38.BIT_WIDTH = 1;
defparam sp_inst_38.BLK_SEL = 3'b010;
defparam sp_inst_38.RESET_MODE = "SYNC";

SP sp_inst_39 (
    .DO({sp_inst_39_dout_w[30:0],sp_inst_39_dout[6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[6]})
);

defparam sp_inst_39.READ_MODE = 1'b0;
defparam sp_inst_39.WRITE_MODE = 2'b00;
defparam sp_inst_39.BIT_WIDTH = 1;
defparam sp_inst_39.BLK_SEL = 3'b011;
defparam sp_inst_39.RESET_MODE = "SYNC";

SP sp_inst_40 (
    .DO({sp_inst_40_dout_w[30:0],sp_inst_40_dout[6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[6]})
);

defparam sp_inst_40.READ_MODE = 1'b0;
defparam sp_inst_40.WRITE_MODE = 2'b00;
defparam sp_inst_40.BIT_WIDTH = 1;
defparam sp_inst_40.BLK_SEL = 3'b100;
defparam sp_inst_40.RESET_MODE = "SYNC";

SP sp_inst_41 (
    .DO({sp_inst_41_dout_w[30:0],sp_inst_41_dout[6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[6]})
);

defparam sp_inst_41.READ_MODE = 1'b0;
defparam sp_inst_41.WRITE_MODE = 2'b00;
defparam sp_inst_41.BIT_WIDTH = 1;
defparam sp_inst_41.BLK_SEL = 3'b101;
defparam sp_inst_41.RESET_MODE = "SYNC";

SP sp_inst_42 (
    .DO({sp_inst_42_dout_w[30:0],sp_inst_42_dout[7]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7]})
);

defparam sp_inst_42.READ_MODE = 1'b0;
defparam sp_inst_42.WRITE_MODE = 2'b00;
defparam sp_inst_42.BIT_WIDTH = 1;
defparam sp_inst_42.BLK_SEL = 3'b000;
defparam sp_inst_42.RESET_MODE = "SYNC";

SP sp_inst_43 (
    .DO({sp_inst_43_dout_w[30:0],sp_inst_43_dout[7]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7]})
);

defparam sp_inst_43.READ_MODE = 1'b0;
defparam sp_inst_43.WRITE_MODE = 2'b00;
defparam sp_inst_43.BIT_WIDTH = 1;
defparam sp_inst_43.BLK_SEL = 3'b001;
defparam sp_inst_43.RESET_MODE = "SYNC";

SP sp_inst_44 (
    .DO({sp_inst_44_dout_w[30:0],sp_inst_44_dout[7]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7]})
);

defparam sp_inst_44.READ_MODE = 1'b0;
defparam sp_inst_44.WRITE_MODE = 2'b00;
defparam sp_inst_44.BIT_WIDTH = 1;
defparam sp_inst_44.BLK_SEL = 3'b010;
defparam sp_inst_44.RESET_MODE = "SYNC";

SP sp_inst_45 (
    .DO({sp_inst_45_dout_w[30:0],sp_inst_45_dout[7]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7]})
);

defparam sp_inst_45.READ_MODE = 1'b0;
defparam sp_inst_45.WRITE_MODE = 2'b00;
defparam sp_inst_45.BIT_WIDTH = 1;
defparam sp_inst_45.BLK_SEL = 3'b011;
defparam sp_inst_45.RESET_MODE = "SYNC";

SP sp_inst_46 (
    .DO({sp_inst_46_dout_w[30:0],sp_inst_46_dout[7]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7]})
);

defparam sp_inst_46.READ_MODE = 1'b0;
defparam sp_inst_46.WRITE_MODE = 2'b00;
defparam sp_inst_46.BIT_WIDTH = 1;
defparam sp_inst_46.BLK_SEL = 3'b100;
defparam sp_inst_46.RESET_MODE = "SYNC";

SP sp_inst_47 (
    .DO({sp_inst_47_dout_w[30:0],sp_inst_47_dout[7]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[16],ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7]})
);

defparam sp_inst_47.READ_MODE = 1'b0;
defparam sp_inst_47.WRITE_MODE = 2'b00;
defparam sp_inst_47.BIT_WIDTH = 1;
defparam sp_inst_47.BLK_SEL = 3'b101;
defparam sp_inst_47.RESET_MODE = "SYNC";

DFFRE dff_inst_0 (
  .Q(dff_q_0),
  .D(ad[16]),
  .CLK(clk),
  .CE(ce_w),
  .RESET(gw_gnd)
);
DFFRE dff_inst_1 (
  .Q(dff_q_1),
  .D(ad[15]),
  .CLK(clk),
  .CE(ce_w),
  .RESET(gw_gnd)
);
DFFRE dff_inst_2 (
  .Q(dff_q_2),
  .D(ad[14]),
  .CLK(clk),
  .CE(ce_w),
  .RESET(gw_gnd)
);
MUX2 mux_inst_0 (
  .O(mux_o_0),
  .I0(sp_inst_0_dout[0]),
  .I1(sp_inst_1_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_1 (
  .O(mux_o_1),
  .I0(sp_inst_2_dout[0]),
  .I1(sp_inst_3_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_2 (
  .O(mux_o_2),
  .I0(sp_inst_4_dout[0]),
  .I1(sp_inst_5_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_3 (
  .O(mux_o_3),
  .I0(mux_o_0),
  .I1(mux_o_1),
  .S0(dff_q_1)
);
MUX2 mux_inst_5 (
  .O(dout[0]),
  .I0(mux_o_3),
  .I1(mux_o_2),
  .S0(dff_q_0)
);
MUX2 mux_inst_6 (
  .O(mux_o_6),
  .I0(sp_inst_6_dout[1]),
  .I1(sp_inst_7_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_7 (
  .O(mux_o_7),
  .I0(sp_inst_8_dout[1]),
  .I1(sp_inst_9_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_8 (
  .O(mux_o_8),
  .I0(sp_inst_10_dout[1]),
  .I1(sp_inst_11_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_9 (
  .O(mux_o_9),
  .I0(mux_o_6),
  .I1(mux_o_7),
  .S0(dff_q_1)
);
MUX2 mux_inst_11 (
  .O(dout[1]),
  .I0(mux_o_9),
  .I1(mux_o_8),
  .S0(dff_q_0)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(sp_inst_12_dout[2]),
  .I1(sp_inst_13_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_13 (
  .O(mux_o_13),
  .I0(sp_inst_14_dout[2]),
  .I1(sp_inst_15_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_14 (
  .O(mux_o_14),
  .I0(sp_inst_16_dout[2]),
  .I1(sp_inst_17_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_15 (
  .O(mux_o_15),
  .I0(mux_o_12),
  .I1(mux_o_13),
  .S0(dff_q_1)
);
MUX2 mux_inst_17 (
  .O(dout[2]),
  .I0(mux_o_15),
  .I1(mux_o_14),
  .S0(dff_q_0)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(sp_inst_18_dout[3]),
  .I1(sp_inst_19_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(sp_inst_20_dout[3]),
  .I1(sp_inst_21_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_20 (
  .O(mux_o_20),
  .I0(sp_inst_22_dout[3]),
  .I1(sp_inst_23_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_21 (
  .O(mux_o_21),
  .I0(mux_o_18),
  .I1(mux_o_19),
  .S0(dff_q_1)
);
MUX2 mux_inst_23 (
  .O(dout[3]),
  .I0(mux_o_21),
  .I1(mux_o_20),
  .S0(dff_q_0)
);
MUX2 mux_inst_24 (
  .O(mux_o_24),
  .I0(sp_inst_24_dout[4]),
  .I1(sp_inst_25_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(sp_inst_26_dout[4]),
  .I1(sp_inst_27_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_26 (
  .O(mux_o_26),
  .I0(sp_inst_28_dout[4]),
  .I1(sp_inst_29_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_27 (
  .O(mux_o_27),
  .I0(mux_o_24),
  .I1(mux_o_25),
  .S0(dff_q_1)
);
MUX2 mux_inst_29 (
  .O(dout[4]),
  .I0(mux_o_27),
  .I1(mux_o_26),
  .S0(dff_q_0)
);
MUX2 mux_inst_30 (
  .O(mux_o_30),
  .I0(sp_inst_30_dout[5]),
  .I1(sp_inst_31_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(sp_inst_32_dout[5]),
  .I1(sp_inst_33_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_32 (
  .O(mux_o_32),
  .I0(sp_inst_34_dout[5]),
  .I1(sp_inst_35_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(mux_o_30),
  .I1(mux_o_31),
  .S0(dff_q_1)
);
MUX2 mux_inst_35 (
  .O(dout[5]),
  .I0(mux_o_33),
  .I1(mux_o_32),
  .S0(dff_q_0)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(sp_inst_36_dout[6]),
  .I1(sp_inst_37_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_37 (
  .O(mux_o_37),
  .I0(sp_inst_38_dout[6]),
  .I1(sp_inst_39_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_38 (
  .O(mux_o_38),
  .I0(sp_inst_40_dout[6]),
  .I1(sp_inst_41_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(mux_o_36),
  .I1(mux_o_37),
  .S0(dff_q_1)
);
MUX2 mux_inst_41 (
  .O(dout[6]),
  .I0(mux_o_39),
  .I1(mux_o_38),
  .S0(dff_q_0)
);
MUX2 mux_inst_42 (
  .O(mux_o_42),
  .I0(sp_inst_42_dout[7]),
  .I1(sp_inst_43_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_43 (
  .O(mux_o_43),
  .I0(sp_inst_44_dout[7]),
  .I1(sp_inst_45_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_44 (
  .O(mux_o_44),
  .I0(sp_inst_46_dout[7]),
  .I1(sp_inst_47_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_45 (
  .O(mux_o_45),
  .I0(mux_o_42),
  .I1(mux_o_43),
  .S0(dff_q_1)
);
MUX2 mux_inst_47 (
  .O(dout[7]),
  .I0(mux_o_45),
  .I1(mux_o_44),
  .S0(dff_q_0)
);
endmodule //Gowin_SP_ram
