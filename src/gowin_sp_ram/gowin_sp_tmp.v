//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.11.03
//Part Number: GW5A-LV25MG121NC1/I0
//Device: GW5A-25
//Device Version: A
//Created Time: Sat Sep 19 10:40:03 2026

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_SP your_instance_name(
        .dout(dout), //output [7:0] dout
        .clk(clk), //input clk
        .oce(oce), //input oce
        .ce(ce), //input ce
        .reset(reset), //input reset
        .wre(wre), //input wre
        .ad(ad), //input [16:0] ad
        .din(din) //input [7:0] din
    );

//--------Copy end-------------------
