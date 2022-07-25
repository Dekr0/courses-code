# Name: Chengxuan Li

n = int(input())
bus = sorted([int(i) for i in input().split()])

i = 0

while i < n:
    if i == n-1 or bus[i] + 1 != bus[i+1]:
        print(bus[i], end=" ")
        i += 1
    else:
        j = 1
        while True:
            if i + j < n and bus[i] + j == bus[i+j]:
                j += 1
            else:
                if j == 2:
                    print(bus[i], bus[i+1], end=" ")
                else:
                    print(f"{bus[i]}-{bus[i]+j-1}", end=" ")
                i += j
                break