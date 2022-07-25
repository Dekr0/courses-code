# Name: Chengxuan Li

n, m = [int(i) for i in input().split()]
seq = []
for b in input():
    seq.append(int(b))

for i in range(m):
    s, e = [int(j) for j in input().split()]
    if all(seq[s-1:e]) == 1:
        print("one")
    elif any(seq[s-1:e]) == 0:
        print("zero")
    else:
        print("both")