#Reset button on ZCU106
#set_property -dict { PACKAGE_PIN G13 IOSTANDARD LVCMOS18 DIRECTION IN} [get_ports { reset }];
set_false_path -from [ get_ports { reset   }];

#CLK125 on board
#set_property -dict { PACKAGE_PIN G9 IOSTANDARD DIFF_SSTL15 DIRECTION IN} [get_ports { clk_125_n }];
#set_property -dict { PACKAGE_PIN H9 IOSTANDARD DIFF_SSTL15 DIRECTION IN} [get_ports { clk_125_p }];

#PL UART2 Connections
set_input_delay -clock clk_pl_0 -min 0 [get_ports { uart_txd }];
set_input_delay -clock clk_pl_0 -max 10 [get_ports { uart_txd }];

set_output_delay -clock clk_pl_0 -min 0 [get_ports { uart_rxd }];
set_output_delay -clock clk_pl_0 -max 5 [get_ports { uart_rxd }];

#LEDs
set_output_delay -clock clk_pl_0 -min 0 [get_ports { up_status[0] }];
set_output_delay -clock clk_pl_0 -min 0 [get_ports { up_status[1] }];
set_output_delay -clock clk_pl_0 -min 0 [get_ports { up_status[2] }];
set_output_delay -clock clk_pl_0 -min 0 [get_ports { up_status[3] }];
set_output_delay -clock clk_pl_0 -min 0 [get_ports { up_status[4] }];
set_output_delay -clock clk_pl_0 -min 0 [get_ports { up_status[5] }];
set_output_delay -clock clk_pl_0 -min 0 [get_ports { up_status[6] }];
set_output_delay -clock clk_pl_0 -min 0 [get_ports { up_status[7] }];

set_output_delay -clock clk_pl_0 -max 10 [get_ports { up_status[0] }];
set_output_delay -clock clk_pl_0 -max 10 [get_ports { up_status[1] }];
set_output_delay -clock clk_pl_0 -max 10 [get_ports { up_status[2] }];
set_output_delay -clock clk_pl_0 -max 10 [get_ports { up_status[3] }];
set_output_delay -clock clk_pl_0 -max 10 [get_ports { up_status[4] }];
set_output_delay -clock clk_pl_0 -max 10 [get_ports { up_status[5] }];
set_output_delay -clock clk_pl_0 -max 10 [get_ports { up_status[6] }];
set_output_delay -clock clk_pl_0 -max 10 [get_ports { up_status[7] }];

create_clock -period 8 -name adc_clk [ get_ports {adc_clk_in_p}];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_or_p    }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_or_n    }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_p[0] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_n[0] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_p[1] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_n[1] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_p[2] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_n[2] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_p[3] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_n[3] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_p[4] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_n[4] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_p[5] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_n[5] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_p[6] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_n[6] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_p[7] }];
set_input_delay -clock adc_clk -min 3 [ get_ports { adc_data_in_n[7] }];

set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_or_p    }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_or_n    }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_p[0] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_n[0] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_p[1] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_n[1] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_p[2] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_n[2] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_p[3] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_n[3] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_p[4] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_n[4] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_p[5] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_n[5] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_p[6] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_n[6] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_p[7] }];
set_input_delay -clock adc_clk -max 4 [ get_ports { adc_data_in_n[7] }];

set_output_delay -clock clk_pl_0 -min 0 [ get_ports { ad9517_csn }];
set_output_delay -clock clk_pl_0 -min 0 [ get_ports { spi_csn    }];
set_output_delay -clock clk_pl_0 -min 0 [ get_ports { spi_clk    }];

set_output_delay -clock clk_pl_0 -max 10 [ get_ports { ad9517_csn }];
set_output_delay -clock clk_pl_0 -max 3 [ get_ports { spi_csn    }];
set_output_delay -clock clk_pl_0 -max 3 [ get_ports { spi_clk    }];

set_min_delay -to [ get_ports { spi_sdio   }] 0;
set_max_delay -to [ get_ports { spi_sdio   }] 10;
set_min_delay -from [ get_ports { spi_sdio   }] 0;
set_max_delay -from [ get_ports { spi_sdio   }] 10;


set_false_path -from [get_clocks clk_pl_0] -to [get_clocks adc_clk]
set_false_path -to [get_clocks clk_pl_0] -from [get_clocks adc_clk]