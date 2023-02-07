----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:26:48 10/30/2019 
-- Design Name: 
-- Module Name:    Splitter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Splitter is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           O1 : out  STD_LOGIC_VECTOR (7 downto 0);
           O2 : out  STD_LOGIC_VECTOR (7 downto 0);
           O3 : out  STD_LOGIC_VECTOR (7 downto 0);
           O4 : out  STD_LOGIC_VECTOR (7 downto 0));
end Splitter;

architecture Behavioral of Splitter is

begin


end Behavioral;

