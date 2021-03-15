import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import sys

#fh = open("Data/AMIA/4MHA-4CNN.table_recall_bucket.txt")
fh = open(sys.argv[1])

type = sys.argv[3]

labels = []
system_a = []
TEES = []
for line in fh:
    if line.startswith( 'Distance' ):
        continue
    A = line.split("\t")
    labels.append(A[0])
    system_a.append(float(A[1]))
    TEES.append(float(A[4]))

#print(labels)
#print(system_a)
#print(TEES)
#labels = ['G1', 'G2', 'G3', 'G4', 'G5']
#men_means = [20, 34, 30, 35, 27]
#women_means = [25, 32, 34, 20, 25]

x = np.arange(len(labels))  # the label locations
width = 0.35  # the width of the bars

fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, system_a, width, label=type)
rects2 = ax.bar(x + width/2, TEES, width, label='TEES')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Precision')
ax.set_title('Precision by distance')
ax.set_xticks(x)
ax.set_xticklabels(labels)
ax.legend()


def autolabel(rects):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
#        str(height)+"\n(tp=)",
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')


autolabel(rects1)
autolabel(rects2)

fig.tight_layout()

#plt.show()
#plt.savefig("Data/AMIA/4MHA-4CNN.png")
plt.savefig(sys.argv[2])
