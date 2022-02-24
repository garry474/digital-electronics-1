------------------------------------------------------------
--
-- Example of 4-bit binary comparator using the when/else
-- assignments.
-- EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
------------------------------------------------------------
entity mux_2bit_4to1 is
    port(
    
          a_i				: in  std_logic_vector(3 - 1 downto 0);
          b_i				: in  std_logic_vector(3 - 1 downto 0);    
          c_i				: in  std_logic_vector(3 - 1 downto 0);
          d_i				: in  std_logic_vector(3 - 1 downto 0); 
          s_i				: in  std_logic_vector(2 - 1 downto 0);         
          f_o		        : out std_logic_vector(3 - 1 downto 0)
    );
end entity mux_2bit_4to1;

------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------
architecture Behavioral of mux_2bit_4to1 is
begin
	f_o <= '001' when (b_i > a_i) else '000';

end architecture Behavioral;
