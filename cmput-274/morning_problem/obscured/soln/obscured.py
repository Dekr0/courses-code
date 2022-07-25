# Chengxuan Li

hs = [int(h) for h in input().split()]

m = [hs[0], 0]
dp = None

print("X", end=" ")

for i in range(1, len(hs)):
    h = hs[i]
    if h > m[0]:
        print("X", end=" ")
        m = [h, i]
    elif h == m[0]:
        dp = [ [h, m[1]] ]
        print(m[1], end=" ")
        m = [h, i]
    else:
        j = i
        while True:
            if h <= hs[j-1]:
                dp = [hs[j-1], j-1]
                print(j-1, end=" ")
                break
            elif dp and h <= dp[0]:
                print(dp[1], end=" ")
                break
            elif dp and h > dp[0]:
                j = dp[1]
                dp = None
            else:
                j -= 1