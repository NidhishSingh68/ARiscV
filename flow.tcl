set script_dir [file dirname [file normalize [info script]]]
cd $script_dir

open_project [file join $script_dir "riscV.gprj"]
set_option -use_done_as_gpio 1
set_option -use_cpu_as_gpio 1

array set imem {
    module      Gowin_SP_Imem
    file        gowin_sp
    depth       16384
    width       8
    read_mode   bypass
    write_mode  normal
    reset_mode  sync
}

set imem(init_file) [file normalize [file join $script_dir "memory" "memory.mi"]]
set imem(dir)       [file join $script_dir "src" "gowin_sp"]

if {![file isfile $imem(init_file)]} {
    error "Memory init file not found: $imem(init_file)"
}
file mkdir $imem(dir)

set mod_file [file join $imem(dir) "$imem(file).mod"]
set fp [open $mod_file w]
puts $fp "-series GW5A
-device GW5A-25
-device_version A
-package MBGA121N
-part_number GW5A-LV25MG121NC1/I0


-mod_name $imem(module)
-file_name $imem(file)
-path $imem(dir)/
-type RAM_SP
-file_type vlg
-depth $imem(depth)
-width $imem(width)
-read_mode $imem(read_mode)
-write_mode $imem(write_mode)
-reset_mode $imem(reset_mode)
-init_file $imem(init_file)"
close $fp

set modgen [file join [file dirname [info nameofexecutable]] "GowinModGen"]
puts [exec $modgen -do $mod_file 2>@1]

run all
