import random

n = 100000
j = 1
f = open("test.txt", "w")
f.write("{}\n".format(n))
for i in range(n):
    if i == n-1:
        f.write("{}".format(j))
    else:
        f.write("{} ".format(j))
    j += 1
f.close()

