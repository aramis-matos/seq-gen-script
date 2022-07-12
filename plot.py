import matplotlib.pyplot as plt
import pandas as pd

ctd = pd.read_csv("close_to_double_limit.csv")
ctz = pd.read_csv("close_to_zero.csv")
cg = pd.read_csv("control_group.csv")

x = [x for x in range (100)]

ctd_y = list(ctd['time'])
ctz_y = list(ctz['time'])
cg_y = list(cg['time'])

plt.plot(x,ctd_y)
plt.plot(x,ctz_y)
plt.plot(x,cg_y)

plt.xlabel("Extremeness")
plt.ylabel("Time (s)")
plt.title("Extremeness of Values and Runtime")
plt.legend(['Very Large Values (VLV)', "Close to Zero Values (CTZ)", "Control"])

plt.show()
