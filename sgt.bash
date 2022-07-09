#! /bin/bash
./seq-gen -mGTR  -r"$1",1 -l40 -n1 < smaller_tree.tree > srop_phys/$2/$3.dat 2> temp.txt
cat temp.txt | grep Time | awk '{print $3}'
