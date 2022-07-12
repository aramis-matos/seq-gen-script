#! /bin/bash
./seq-gen -mGTR -f0.3,0.2,0.2,0.3 -r"$1",1 -l40 -n1 < smaller_tree.tree > srop_phys/$2/$3.dat 2> temp.txt
cat temp.txt | grep Time | awk '{print $3}'
