----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2023 12:31:45 AM
-- Design Name: 
-- Module Name: AD9467 - Behavioral
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

package AD9467_cmp is

component AD9467 is
    Generic(
        addr_width : positive := 32
    );
    Port (
        rst      : in std_logic;
        adc_clk  : in std_logic;
        dor      : in std_logic;
        d        : in std_logic_vector(7 downto 0);
        dout    : out std_logic_vector(15 downto 0);
        dorout  : out std_logic;
        addr_o  : out std_logic_vector(addr_width -1 downto 0)
        );
end component;

end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity AD9467 is
    Generic(
        addr_width : positive := 32
    );
    Port (
        rst      : in std_logic;
        adc_clk  : in std_logic;
        dor      : in std_logic;
        d        : in std_logic_vector(7 downto 0);
        dout    : out std_logic_vector(15 downto 0);
        dorout  : out std_logic;
        addr_o  : out std_logic_vector(addr_width -1 downto 0)
        );
end AD9467;

architecture rtl of AD9467 is

    constant dor_delay_cnt : natural := 3;
    signal dor_cnt : std_logic_vector(dor_delay_cnt downto 0);
    signal d_cap : std_logic_vector(d'range);
    
    signal rst_cnt : std_logic_vector(dor_delay_cnt downto 0);
    signal adc_rst : std_logic;
    
    signal addr_cnt : unsigned(addr_o'range);

begin

    rst_delay : process(adc_clk)
    begin
        if falling_edge(adc_clk) then
            rst_cnt(0) <= rst;
            rst_cnt(dor_delay_cnt - 1 downto 1) <= rst_cnt(dor_delay_cnt - 2 downto 0);
            adc_rst <= dor_cnt(dor_delay_cnt - 1);
        end if;
    end process;

    dor_delay : process(adc_clk)
    begin
        --falling edge to better match iddr timing diagram (SAME_EDGE_PIPELINED Mode)
        if falling_edge(adc_clk) then
            dor_cnt(0) <= dor;
            dor_cnt(dor_delay_cnt - 1 downto 1) <= dor_cnt(dor_delay_cnt - 2 downto 0);
            dorout <= dor_cnt(dor_delay_cnt - 1);
        end if;
    end process;

    delay_gen : for i in d'range generate
       iddr : IDDRE1
            generic map (
                DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
                IS_CB_INVERTED => '0',
                IS_C_INVERTED => '1' 
                )
            port map (
                Q1 => dout(1 + i*2), -- 1-bit output: Registered parallel output 1
                Q2 => dout(i*2), -- 1-bit output: Registered parallel output 2
                C => adc_clk,   -- 1-bit input: High-speed clock
                CB => adc_clk, -- 1-bit input: Inversion of High-speed clock C
                D => d(i),   -- 1-bit input: Serial Data Input
                R => '0'    -- 1-bit input: Active-High Async Reset
            );
    end generate;

    addr_cnt_proc : process(adc_clk)
    begin
        if falling_edge(adc_clk) then
            if (adc_rst = '1') then
                addr_cnt <= (others => '0');
            else
                addr_cnt <= addr_cnt + 1;
            end if;
        end if;
    end process;
    
    addr_o <= std_logic_vector(addr_cnt);
    
end rtl;
