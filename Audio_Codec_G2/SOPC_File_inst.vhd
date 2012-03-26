  --Example instantiation for system 'SOPC_File'
  SOPC_File_inst : SOPC_File
    port map(
      LCD_E_from_the_char_lcd => LCD_E_from_the_char_lcd,
      LCD_RS_from_the_char_lcd => LCD_RS_from_the_char_lcd,
      LCD_RW_from_the_char_lcd => LCD_RW_from_the_char_lcd,
      LCD_data_to_and_from_the_char_lcd => LCD_data_to_and_from_the_char_lcd,
      altpll_0_c0_out => altpll_0_c0_out,
      altpll_0_c1_out => altpll_0_c1_out,
      locked_from_the_altpll_0 => locked_from_the_altpll_0,
      out_port_from_the_LEDG => out_port_from_the_LEDG,
      out_port_from_the_LEDR => out_port_from_the_LEDR,
      out_port_from_the_note_0 => out_port_from_the_note_0,
      out_port_from_the_note_1 => out_port_from_the_note_1,
      out_port_from_the_note_2 => out_port_from_the_note_2,
      out_port_from_the_note_3 => out_port_from_the_note_3,
      out_port_from_the_note_4 => out_port_from_the_note_4,
      out_port_from_the_note_5 => out_port_from_the_note_5,
      phasedone_from_the_altpll_0 => phasedone_from_the_altpll_0,
      txd_from_the_uart_0 => txd_from_the_uart_0,
      zs_addr_from_the_sdram_0 => zs_addr_from_the_sdram_0,
      zs_ba_from_the_sdram_0 => zs_ba_from_the_sdram_0,
      zs_cas_n_from_the_sdram_0 => zs_cas_n_from_the_sdram_0,
      zs_cke_from_the_sdram_0 => zs_cke_from_the_sdram_0,
      zs_cs_n_from_the_sdram_0 => zs_cs_n_from_the_sdram_0,
      zs_dq_to_and_from_the_sdram_0 => zs_dq_to_and_from_the_sdram_0,
      zs_dqm_from_the_sdram_0 => zs_dqm_from_the_sdram_0,
      zs_ras_n_from_the_sdram_0 => zs_ras_n_from_the_sdram_0,
      zs_we_n_from_the_sdram_0 => zs_we_n_from_the_sdram_0,
      clk_0 => clk_0,
      reset_n => reset_n,
      rxd_to_the_uart_0 => rxd_to_the_uart_0
    );


