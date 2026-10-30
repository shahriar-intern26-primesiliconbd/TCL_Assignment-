set input_file "02_innovus_prects.log"
set output_file "severity_messages.txt"

set inFile [open $input_file r]
set outFile [open $output_file w]

set lineNumber 0

while {[gets $inFile line] >= 0} {

    incr lineNumber

    if {[regexp {^\s*\*{0,2}\s*(ERROR|WARN|WARNING)\s*:\s*(.*)} $line match severity message]} {

        puts $outFile "$lineNumber | $severity | $message"
    }
}

close $inFile
close $outFile
