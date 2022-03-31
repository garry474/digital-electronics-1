------------------------------------------------------------
--
-- Template for 4-digit 7-segment display driver testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;
    
------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    -- Local signals
    signal s_clk_100MHz : std_logic;
    signal s_dig : std_logic_vector(4 - 1 downto 0);
    -- WRITE YOUR CODE HERE

begin
    -- Connecting testbench signals with driver_7seg_4digits
    -- entity (Unit Under Test)

    -- WRITE YOUR CODE HERE

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    -- WRITE YOUR CODE HERE

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    -- WRITE YOUR CODE HERE
    p_mux : process(clk)
        begin
            if rising_edge(clk) then
                if (reset = '1') then
                    s_hex <= data0_i;
                    dp_o  <= dp_i(0);
                    dig_o <= "1110";
                else
                    case s_cnt is
                        when "11" =>
                            s_hex <= data3_i;
                            dp_o  <= dp_i(3);
                            dig_o <= "1110";

                        when "10" =>
                            s_hex <= data2_i;
                            dp_o  <= dp_i(2);
                            dig_o <= "1101";

                        when "01" =>
                            s_hex <= data1_i;
                            dp_o  <= dp_i(1);
                            dig_o <= "1011";

                        when others =>
                            s_hex <= data0_i;
                            dp_o  <= dp_i(0);
                            dig_o <= "0111";
                    end case;
                end if;
            end if;
    end process p_mux;
end architecture testbench;
