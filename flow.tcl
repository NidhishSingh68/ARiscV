set script_dir [file dirname [file normalize [info script]]]
cd $script_dir

open_project [file join $script_dir "riscV.gprj"]
set_option -use_done_as_gpio 1
set_option -use_cpu_as_gpio 1

run all
