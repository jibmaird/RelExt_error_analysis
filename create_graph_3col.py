import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import sys

#fh = open("Data/CP17/4MHA-4CNN.table_f1_bucket_group.txt")
#fh2 = open("Data/CP17/4MHA.table_f1_bucket_group.txt")
fh = open(sys.argv[1])
fh2 = open(sys.argv[2])
s1 = sys.argv[3]
s2 = sys.argv[4]
metric = sys.argv[5]
outf = sys.argv[6]
tees_col = int(sys.argv[7])

labels = []
system_a = []
system_b = []
TEES = []
for line in fh:
    if line.startswith( 'Distance' ):
        continue
    A = line.split("\t")
    labels.append(A[0])
    system_a.append(float(A[1]))
    TEES.append(float(A[tees_col]))

for line in fh2:
    if line.startswith( 'Distance' ):
        continue
    A = line.split("\t")
    system_b.append(float(A[1]))

barWidth = 0.25

r1 = np.arange(len(system_a))  # the label locations
r2 = [x + barWidth for x in r1]
r3 = [x + barWidth for x in r2]

# Make the plot
plt.bar(r1, system_a, width=barWidth, label=s1)
plt.bar(r2, system_b, width=barWidth, label=s2)
plt.bar(r3, TEES, width=barWidth, label='TEES')

# Add xticks on the middle of the group bars
plt.xlabel('Distance', fontweight='bold')
plt.xticks([r + barWidth for r in range(len(system_a))], labels)

plt.ylabel(metric)
plt.title(metric+' by distance')

# Create legend & Show graphic
plt.legend()
#plt.show()

#plt.savefig("Data/CP17/4MHA\_4CNN.f1_3col.png")
plt.savefig(outf)
