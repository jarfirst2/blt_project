----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2023 05:06:59 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

use work.AD9467_cmp.all;

entity top is
  Port ( 
    --Reset button on ZCU106
    reset : in std_logic;

    --CLK125 on board
    clk_125_n : in std_logic;
    clk_125_p : in std_logic;
    
    --PL UART2 Connections
    uart_txd : in std_logic;
    uart_rxd : out std_logic;
    
    --LEDs
    up_status : out std_logic_vector(7 downto 0);
    
    --ADC data interface
    adc_clk_in_p : in std_logic;
    adc_clk_in_n : in std_logic;
    adc_data_or_p : in std_logic;
    adc_data_or_n : in std_logic;
    adc_data_in_p : in std_logic_vector(7 downto 0);
    adc_data_in_n : in std_logic_vector(7 downto 0);
    
    --ADC serial interface
    ad9517_csn : out std_logic;
    spi_csn : out std_logic;
    spi_clk : out std_logic;
    spi_sdio : inout std_logic
);
end top;

architecture rtl of top is
    
    signal clk : std_logic;
    signal rst : std_logic;

    signal spi_csn_io : std_logic;
    signal spi_clk_io : std_logic;
    signal spi_sdio1 : std_logic;

    signal adc_clk_in : std_logic;
    signal adc_data_or : std_logic;
    signal adc_data_in : std_logic_vector(7 downto 0);
    signal adc_data_out : std_logic_vector(15 downto 0);
    
    constant addr_width : positive := 32;
    signal addr : std_logic_vector(addr_width - 1 downto 0);

begin
    ad9517_csn <= '1';

    spi_csn <= spi_csn_io;
    spi_clk <= spi_clk_io;

    adc_clk_io_buf : IBUFDS
        port map(
            o => adc_clk_in,
            i => adc_clk_in_p,
            ib => adc_clk_in_n
        );
    adc_data_or_io_buf : IBUFDS
        port map(
            o => adc_data_or,
            i => adc_data_or_p,
            ib => adc_data_or_n
        );

    adc_data_gen : for i in adc_data_in'range generate
        adc_data_in_io_buf : IBUFDS
            port map(
                o => adc_data_in(i),
                i => adc_data_in_p(i),
                ib => adc_data_in_n(i)
            );
    end generate;

    sys_bd : entity work.design_1_wrapper
    port map(
        BRAM_PORTB_0_addr => addr,--input [31:0];
        BRAM_PORTB_0_clk => adc_clk_in,--input ;
        BRAM_PORTB_0_din => adc_data_out,--input [31:0];
        BRAM_PORTB_0_dout => open,--output [31:0];
        BRAM_PORTB_0_en => '1',--input ;
        BRAM_PORTB_0_rst => rst,--input ;
        BRAM_PORTB_0_we => "0011",--input [3:0];
        
        SPI_0_0_io0_io => spi_sdio,--inout ;
        SPI_0_0_io1_io => spi_sdio1,--inout ;
        SPI_0_0_sck_io => spi_clk_io,--inout ;
        SPI_0_0_ss_io => spi_csn_io,--inout [0:0];
        
        UART_0_rxd => uart_txd,
        UART_0_txd => uart_rxd,
        
        peripheral_reset_0 => rst,--output [0:0];
        pl_clk0 => clk --output ;
        );
    
    adc_data_if : AD9467
    generic map(
        addr_width => addr_width
    )
    port map(
        rst => reset,
        adc_clk => adc_clk_in,
        dor => adc_data_or,
        d => adc_data_in,
        dout => adc_data_out,
        dorout => open,
        addr_o => addr
        
    );
    

end rtl;
