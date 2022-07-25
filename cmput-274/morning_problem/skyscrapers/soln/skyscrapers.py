# Name: Chengxuan Li

n = int(input())
b = []

for i in range(n):
    b.append(int(input()))

print(n)
b = sorted(b, reverse=True)
f = 2

while f <= b[0]:
    if b[-1] < f:
        b.pop()
    else:
        print(len(b))
        f += 1