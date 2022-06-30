#! /bin/bash
./seq-gen -mGTR -f0.3,0.2,0.2,0.3 -r"$1",1 -l40 -n3 < example.tree > example.dat 2> temp.txt
cat temp.txt | grep Time | awk '{print $3}'
