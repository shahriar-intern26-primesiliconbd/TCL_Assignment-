set input_file  "tcl_day3_report_timing_practice.log"
set output_file "violated_paths.csv"

set inFile [open $input_file r]
set outFile [open $output_file w]

puts $outFile "Startpoint,Endpoint,Path Group,Slack"

set startpoint ""
set endpoint ""
set pathgroup ""
while {[gets $inFile line] >= 0} {
        if {[regexp {^Startpoint: +(.+)$} $line match value]} {
                set startpoint $value
        }

        if {[regexp {^Endpoint: +(.+)$} $line match value]} {
                set endpoint $value
        }

        if {[regexp {^Path Group: +(.+)$} $line match value]} {
                set pathgroup $value
        }

        if {[regexp {^slack \((.+)\) +(.+)$} $line match status slack]} {
                if {$status == "VIOLATED"} {
                        puts $outFile "$startpoint,$endpoint,$pathgroup,$slack"
                }
        }
}
close $inFile
close $outFile
