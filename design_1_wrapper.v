//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Mon Jun 12 18:34:48 2023
//Host        : VUA-PRIME running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (BRAM_PORTB_0_addr,
    BRAM_PORTB_0_clk,
    BRAM_PORTB_0_din,
    BRAM_PORTB_0_dout,
    BRAM_PORTB_0_en,
    BRAM_PORTB_0_rst,
    BRAM_PORTB_0_we,
    SPI_0_0_io0_io,
    SPI_0_0_io1_io,
    SPI_0_0_sck_io,
    SPI_0_0_ss_io,
    UART_0_rxd,
    UART_0_txd,
    peripheral_reset_0,
    pl_clk0);
  input [31:0]BRAM_PORTB_0_addr;
  input BRAM_PORTB_0_clk;
  input [31:0]BRAM_PORTB_0_din;
  output [31:0]BRAM_PORTB_0_dout;
  input BRAM_PORTB_0_en;
  input BRAM_PORTB_0_rst;
  input [3:0]BRAM_PORTB_0_we;
  inout SPI_0_0_io0_io;
  inout SPI_0_0_io1_io;
  inout SPI_0_0_sck_io;
  inout [0:0]SPI_0_0_ss_io;
  input UART_0_rxd;
  output UART_0_txd;
  output [0:0]peripheral_reset_0;
  output pl_clk0;

  wire [31:0]BRAM_PORTB_0_addr;
  wire BRAM_PORTB_0_clk;
  wire [31:0]BRAM_PORTB_0_din;
  wire [31:0]BRAM_PORTB_0_dout;
  wire BRAM_PORTB_0_en;
  wire BRAM_PORTB_0_rst;
  wire [3:0]BRAM_PORTB_0_we;
  wire SPI_0_0_io0_i;
  wire SPI_0_0_io0_io;
  wire SPI_0_0_io0_o;
  wire SPI_0_0_io0_t;
  wire SPI_0_0_io1_i;
  wire SPI_0_0_io1_io;
  wire SPI_0_0_io1_o;
  wire SPI_0_0_io1_t;
  wire SPI_0_0_sck_i;
  wire SPI_0_0_sck_io;
  wire SPI_0_0_sck_o;
  wire SPI_0_0_sck_t;
  wire [0:0]SPI_0_0_ss_i_0;
  wire [0:0]SPI_0_0_ss_io_0;
  wire [0:0]SPI_0_0_ss_o_0;
  wire SPI_0_0_ss_t;
  wire UART_0_rxd;
  wire UART_0_txd;
  wire [0:0]peripheral_reset_0;
  wire pl_clk0;

  IOBUF SPI_0_0_io0_iobuf
       (.I(SPI_0_0_io0_o),
        .IO(SPI_0_0_io0_io),
        .O(SPI_0_0_io0_i),
        .T(SPI_0_0_io0_t));
  IOBUF SPI_0_0_io1_iobuf
       (.I(1'b0),
        .IO(SPI_0_0_io1_io),
        .O(SPI_0_0_io1_i),
        .T(SPI_0_0_io1_t));
  IOBUF SPI_0_0_sck_iobuf
       (.I(SPI_0_0_sck_o),
        .IO(SPI_0_0_sck_io),
        .O(SPI_0_0_sck_i),
        .T(SPI_0_0_sck_t));
  IOBUF SPI_0_0_ss_iobuf_0
       (.I(SPI_0_0_ss_o_0),
        .IO(SPI_0_0_ss_io[0]),
        .O(SPI_0_0_ss_i_0),
        .T(SPI_0_0_ss_t));
  design_1 design_1_i
       (.BRAM_PORTB_0_addr(BRAM_PORTB_0_addr),
        .BRAM_PORTB_0_clk(BRAM_PORTB_0_clk),
        .BRAM_PORTB_0_din(BRAM_PORTB_0_din),
        .BRAM_PORTB_0_dout(BRAM_PORTB_0_dout),
        .BRAM_PORTB_0_en(BRAM_PORTB_0_en),
        .BRAM_PORTB_0_rst(BRAM_PORTB_0_rst),
        .BRAM_PORTB_0_we(BRAM_PORTB_0_we),
        .SPI_0_0_io0_i(SPI_0_0_io0_i),
        .SPI_0_0_io0_o(SPI_0_0_io0_o),
        .SPI_0_0_io0_t(SPI_0_0_io0_t),
        .SPI_0_0_io1_i(1'b0),
        .SPI_0_0_io1_o(SPI_0_0_io1_o),
        .SPI_0_0_io1_t(SPI_0_0_io1_t),
        .SPI_0_0_sck_i(SPI_0_0_sck_i),
        .SPI_0_0_sck_o(SPI_0_0_sck_o),
        .SPI_0_0_sck_t(SPI_0_0_sck_t),
        .SPI_0_0_ss_i(SPI_0_0_ss_i_0),
        .SPI_0_0_ss_o(SPI_0_0_ss_o_0),
        .SPI_0_0_ss_t(SPI_0_0_ss_t),
        .UART_0_rxd(UART_0_rxd),
        .UART_0_txd(UART_0_txd),
        .peripheral_reset_0(peripheral_reset_0),
        .pl_clk0(pl_clk0));
endmodule
