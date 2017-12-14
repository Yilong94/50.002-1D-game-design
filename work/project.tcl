set projDir "/home/yi/Desktop/Comstruct_11Dec_0116/work/planAhead"
set projName "Comstruct"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/mojo_top_0.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/reset_conditioner_1.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/edge_detector_2.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/ledmatrix_3.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/alu_4.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/buttons_5.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/start_6.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/select_7.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/movefinal_8.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/checkfinal2_9.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/counter_10.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/blinker_11.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/ledmatrixdecoder_12.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/myDigitsDecoder_13.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/blinkingdecoder_14.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/adder8_15.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/shifter8_16.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/boolean8_17.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/compare8_18.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/button_conditioner_19.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/adjacencymat_30.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/adjacencymat_30.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/lightupbeforemove_32.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/adjacencymat_30.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v" "/home/yi/Desktop/Comstruct_11Dec_0116/work/verilog/pipeline_34.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/yi/Desktop/Comstruct_11Dec_0116/constraint/led.ucf" "/home/yi/mojo-ide-B1.3.6/library/components/io_shield.ucf" "/home/yi/mojo-ide-B1.3.6/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
