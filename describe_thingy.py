from fileinput import filename
import pandas as pd

ctd = pd.read_csv("close_to_double_limit.csv")
ctz = pd.read_csv("close_to_zero.csv")
cg = pd.read_csv("control_group.csv")

ctd_avg = float(ctd.describe()["time"]["mean"])
ctz_avg = float(ctz.describe()["time"]["mean"])
cg_avg = float(cg.describe()["time"]["mean"])

print(f"Close to double compared to control: {(ctd_avg/cg_avg)*100}%")
print(f"Close to zero compared to control: {(ctz_avg/cg_avg)*100}%")
print(f"Close to double compared to close to zero: {(ctd_avg/ctz_avg)*100}%")

print(f"Close to Double Limit Stats:\n{ctd.describe()}\n")
print(f"Close to Zero Stats:\n{ctz.describe()}\n")
print(f"Control Group Stats:\n{cg.describe()}\n")