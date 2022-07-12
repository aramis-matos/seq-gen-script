x = "TGAAGGGATC"
y = "TGCGTAGTTT"

z = zip(x,y)

diffs = 0
for val in z:
    if val[0] != val[1]:
        diffs += 1

diffs /=  min(len(x),len(y))

print(f"Normalized Hamming Distance: {diffs}")