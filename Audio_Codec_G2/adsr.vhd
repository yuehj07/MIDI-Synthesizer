-- Original Author : Hans Huebner
-- Additional Authors : Eric Lunty, Kyle Brooks, Peter Roland

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adsr is port
	(
    reset : in std_logic;
    clk : in std_logic;
    attackTime : in std_logic_vector(7 downto 0);
    sustainLevel : in std_logic_vector(11 downto 0);
    releaseTime : in std_logic_vector(7 downto 0);
    velocity : in std_logic_vector(11 downto 0);
    input : in std_logic_vector(11 downto 0);
    output : out std_logic_vector(11 downto 0)
    );
end adsr;

architecture rtl of adsr is
  
  type state_type is (s_attack, s_sustain, s_release);
  signal state : state_type;
	 
  signal result : std_logic_vector(23 downto 0) := (others => '0');
  signal level : std_logic_vector(11 downto 0) := (others => '0');
  signal step_divider : std_logic_vector(5 downto 0) := (others => '0');
  signal step_pulse : std_logic := '0';
  signal phase_counter : std_logic_vector(7 downto 0) := (others => '0');

 begin
 
  output <= result(23 downto 12);

  -- Generate the output by multiplying the input with the current level
  -- generated by the ADSR envelope generate.
  my_process_input : process(clk)
  begin
    if rising_edge(clk) then
      result <= input * level;
    end if;
  end process;

  -- Generate the time constant pulse for the adsr, step_pulse. The ADSR
  -- parameter values are based on this pulse.
  my_step_counter : process(clk, reset)
  begin
    if reset = '1' then
      step_divider <= (others => '0');
    elsif rising_edge(clk) then
      step_divider <= step_divider + 1;
      step_pulse <= '0';
      if step_divider = 0 then
        step_pulse <= '1';
      end if;
    end if;
  end process;

  -- Generate the ADSR envelope.
  my_adsr : process(clk, reset)
  begin
    if reset = '1' then
      state <= s_release;
      level <= (others => '0');
    
	 elsif rising_edge(clk) then
      if step_pulse = '1' then
        case state is

          --Atack stage, will go until it reaches a value of velocity
			 when s_attack =>
            if velocity = 0 then
              state <= s_release;
            else
              phase_counter <= phase_counter + 1;
              if phase_counter = attackTime then
                level <= level + 1;
                phase_counter <= (others => '0');
                if level = velocity then
                  state <= s_sustain;
                end if;
              end if;
            end if;

			--Sustain the volume until velocity is zero	
			when s_sustain =>
            if velocity = 0 then
              state <= s_release;
            end if;

			--Release until level = 0, or until velocity > 0 (new note) 
			when s_release =>
            if velocity /= 0 then
              state <= s_attack;
              phase_counter <= (others => '0');
            elsif level /= 0 then
              phase_counter <= phase_counter + 1;
              if phase_counter = releaseTime then
                level <= level - 1;
                phase_counter <= (others => '0');
              end if;
            end if;

        end case;
      end if;
    end if;
  end process;
end;
