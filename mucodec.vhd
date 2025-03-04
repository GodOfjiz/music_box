LIBRARY ieee;

USE ieee.std_logic_1164.ALL;



entity mucodec is

    port (

        din     : IN std_logic_vector(2 downto 0);

        valid   : IN std_logic;

        clr     : IN std_logic;

        clk     : IN std_logic;

        dout    : OUT std_logic_vector(7 downto 0);

        dvalid  : OUT std_logic;

        error   : OUT std_logic);

end mucodec;



architecture Behavioral of mucodec is

    type state_type is (St_RESET, St_ERROR,

                        St_0, St_07, St_070, St_0707, St_7, St_70, St_707, St_7070,

                        St_1, St_2, St_3, St_4, St_5, St_6,

                        St_A, St_B, St_C, St_D, St_E, St_F, St_G, St_H, St_I, St_J, St_K, St_L, St_M, 

                        St_N, St_O, St_P, St_Q, St_R, St_S, St_T, St_U, St_V, St_W, St_X, St_Y, St_Z,

                        St_SPACE, St_EXCLAMATION, St_PERIOD, St_QUESTION);

    

    signal state, next_state : state_type := St_RESET;

    signal tmp_error, tmp_dvalid : std_logic := '0';

    

BEGIN

    -- Synchronous state transition process

    sync_process : PROCESS (clk, clr)

    BEGIN

        IF clr = '1' THEN

            state <= St_RESET;



        ELSIF rising_edge(clk) THEN

            state <= next_state;

        END IF;

    END PROCESS;



    state_logic: process (state, din, valid) --add valid here with if statement surrounding entire state logic to allow din to be ignore when valid = '0'

    begin



        next_state <= state;

        

        if valid = '1' then

            case(state) is

                when St_RESET => 

                    if (din="000") then

                        next_state <= St_0;

                    else

                        next_state <= St_ERROR; -- Avoid redundant state repetition

                    end if;

    

                when St_ERROR =>

                    next_state <= St_RESET;

    

                when St_0 =>

                    if (din="111") then

                        next_state <= St_07;

                    else

                        next_state <= St_RESET;

                    end if;

    

                when St_07 =>

                    if (din="000") then

                        next_state <= St_070;

                    else

                        next_state <= St_RESET;

                    end if;

                    

                when St_070 =>

                    if (din="111") then

                        next_state <= St_0707;

                    else

                        next_state <= St_RESET;

                    end if;



                when St_0707 =>

                    case din is

                        when "001" => next_state <= St_1;

                        when "010" => next_state <= St_2;

                        when "011" => next_state <= St_3;

                        when "100" => next_state <= St_4;

                        when "101" => next_state <= St_5;

                        when "110" => next_state <= St_6;

                        when others => next_state <= St_ERROR;

                    end case; 





                    

                when St_1 =>

                    if (din="010") then

                        next_state <= St_A;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="011") then

                        next_state <= St_B;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="100") then

                        next_state <= St_C;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="101") then

                        next_state <= St_D;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="110") then

                        next_state <= St_E;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    else

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if;           

                

                when St_2 =>

                    if (din="001") then

                        next_state <= St_F;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="011") then

                        next_state <= St_G;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="100") then

                        next_state <= St_H;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="101") then

                        next_state <= St_I;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="110") then

                        next_state <= St_J;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    else

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if; 

    

                when St_3 =>

                    if (din="001") then

                        next_state <= St_K;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="010") then

                        next_state <= St_L;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="100") then

                        next_state <= St_M;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="101") then

                        next_state <= St_N;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="110") then

                        next_state <= St_O;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    else

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if; 

    

                when St_4 =>

                    if (din="001") then

                        next_state <= St_P;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="010") then

                        next_state <= St_Q;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="011") then

                        next_state <= St_R;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="101") then

                        next_state <= St_S;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="110") then

                        next_state <= St_T;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    else

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if; 

    

                when St_5 =>

                    if (din="001") then

                        next_state <= St_U;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="010") then

                        next_state <= St_V;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="011") then

                        next_state <= St_W;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="100") then

                        next_state <= St_X;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="110") then

                        next_state <= St_Y;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    else

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if; 

                    

                when St_6 =>

                    if (din="001") then

                        next_state <= St_Z;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="010") then

                        next_state <= St_EXCLAMATION;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="011") then

                        next_state <= St_PERIOD;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="100") then

                        next_state <= St_QUESTION;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    elsif (din="101") then

                        next_state <= St_SPACE;

                        tmp_dvalid <= '1';

                        tmp_error <= '0';

                    else

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if; 

    

                when St_7 =>

                    if (din="000") then

                        next_state <= St_70;

                        tmp_dvalid <= '0';

                        tmp_error <= '0'; 

                    else

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if;

                    

                when St_70 =>

                    if (din="111") then

                        next_state <= St_707;

                        tmp_dvalid <= '0';

                        tmp_error <= '0'; 

                    else

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if;

                    

                when St_707 =>

                    if (din="000") then

                        next_state <= St_7070;

                        tmp_dvalid <= '0';

                        tmp_error <= '0'; 

                    else

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if;

                    

                when St_7070 =>

                    if (din="000") then

                        next_state <= St_0;

                        tmp_dvalid <= '0';

                        tmp_error <= '0'; 

                    else

                        next_state <= St_RESET;

                        tmp_dvalid <= '0';

                        tmp_error <= '0';

                    end if;

                    

                -- when in any letter output state (ie A,B,C,...) --> goes back to checking the first index of decoding table from din

                when others =>

                    if (din="001") then

                        next_state <= St_1;

                        tmp_dvalid <= '0';

                        tmp_error <= '0'; 

                    elsif (din="010") then

                        next_state <= St_2;

                        tmp_dvalid <= '0';

                        tmp_error <= '0';

                    elsif (din="011") then

                        next_state <= St_3;

                        tmp_dvalid <= '0';

                        tmp_error <= '0';

                    elsif (din="100") then

                        next_state <= St_4;

                        tmp_dvalid <= '0';

                        tmp_error <= '0';

                    elsif (din="101") then

                        next_state <= St_5;

                        tmp_dvalid <= '0';

                        tmp_error <= '0';

                    elsif (din="110") then

                        next_state <= St_6;

                        tmp_dvalid <= '0';

                        tmp_error <= '0';

                    elsif (din="111") then

                        next_state <= St_7;

                        tmp_dvalid <= '0';

                        tmp_error <= '0';

                    else --does this else statement need to be included? All cases have been considered (0 through 7), so it seems redundant

                        next_state <= St_ERROR;

                        tmp_dvalid <= '0';

                        tmp_error <= '1';

                    end if;

                end case;

        end if;

            dvalid <= tmp_dvalid;

    error <= tmp_error;



    end process;



    output_logic : PROCESS (state)

    BEGIN

        CASE state IS

            WHEN St_A   => dout <= "01000001"; -- ASCII for 'A'

            WHEN St_B   => dout <= "01000010"; -- ASCII for 'B'

            WHEN St_C   => dout <= "01000011"; -- ASCII for 'C'

            WHEN St_D   => dout <= "01000100"; -- ASCII for 'D'

            WHEN St_E   => dout <= "01000101"; -- ASCII for 'E'

            WHEN St_F   => dout <= "01000110"; -- ASCII for 'F'

            WHEN St_G   => dout <= "01000111"; -- ASCII for 'G'

            WHEN St_H   => dout <= "01001000"; -- ASCII for 'H'

            WHEN St_I   => dout <= "01001001"; -- ASCII for 'I'

            WHEN St_J   => dout <= "01001010"; -- ASCII for 'J'

            WHEN St_K   => dout <= "01001011"; -- ASCII for 'K'

            WHEN St_L   => dout <= "01001100"; -- ASCII for 'L'

            WHEN St_M   => dout <= "01001101"; -- ASCII for 'M'

            WHEN St_N   => dout <= "01001110"; -- ASCII for 'N'

            WHEN St_O   => dout <= "01001111"; -- ASCII for 'O'

            WHEN St_P   => dout <= "01010000"; -- ASCII for 'P'

            WHEN St_Q   => dout <= "01010001"; -- ASCII for 'Q'

            WHEN St_R   => dout <= "01010010"; -- ASCII for 'R'

            WHEN St_S   => dout <= "01010011"; -- ASCII for 'S'

            WHEN St_T   => dout <= "01010100"; -- ASCII for 'T'

            WHEN St_U   => dout <= "01010101"; -- ASCII for 'U'

            WHEN St_V   => dout <= "01010110"; -- ASCII for 'V'

            WHEN St_W   => dout <= "01010111"; -- ASCII for 'W'

            WHEN St_X   => dout <= "01011000"; -- ASCII for 'X'

            WHEN St_Y   => dout <= "01011001"; -- ASCII for 'Y'

            WHEN St_Z   => dout <= "01011010"; -- ASCII for 'Z'

            WHEN St_SPACE => dout <= "00100000"; -- ASCII for 'Space'

            WHEN St_EXCLAMATION => dout <= "00100001"; -- ASCII for '!'

            WHEN St_PERIOD => dout <= "00101110"; -- ASCII for '.'

            WHEN St_QUESTION => dout <= "00111111"; -- ASCII for '?'

            

            WHEN OTHERS => dout <= "00000000"; -- Default to zero



        END CASE;

    END PROCESS;

    

    

end Behavioral;

