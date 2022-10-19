set_property SRC_FILE_INFO {cfile:/home/dekr0/Code/XilinxProject/lab_2_sequence_detector/Lab_2_seq_detecor.srcs/constrs_1/new/Zybo-Z7-Master.xdc rfile:../../../Lab_2_seq_detecor.srcs/constrs_1/new/Zybo-Z7-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports clk]; #IO_L12P_T1_MRCC_35 Sch=sysclk
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports seq_in]; #IO_L19N_T3_VREF_35 Sch=sw[0]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports reset]; #IO_L7P_T1_34 Sch=btn[3]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports output_detect]; #IO_L23P_T3_35 Sch=led[0]
