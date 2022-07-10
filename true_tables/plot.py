import matplotlib.pyplot as plt
import pandas as pd

ctd = pd.read_csv("close_to_double_limit.csv")
ctz = pd.read_csv("close_to_zero.csv")
cg = pd.read_csv("control_group.csv")

# ctd_x = list(ctd['val'])
x = [x for x in range(1,101)]
ctd_y = list(ctd['time'])

# print(ctd_x[:10])

ctz_x = list(ctz['val'])
ctz_y = list(ctz['time'])

cg_x = list(cg['val'])
cg_y = list(cg['time'])*100

plt.plot(x,ctz_y)
plt.plot(x,ctd_y)
plt.plot(x,cg_y)
plt.xlabel("Value")
plt.ylabel("Time")
plt.title("Time Taken")
plt.legend(["Close to Zero", "Very Large Values", "Control Group"])


plt.show()


