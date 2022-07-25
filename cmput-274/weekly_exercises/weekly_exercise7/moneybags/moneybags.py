# ---------------------------------------------------
#   Name : Chengxuan Li
#   ID: 1631060
#   CMPUT 274, Fall 2020
#
#   Weekly Exercise 7 : Dr. Moneybags
# ---------------------------------------------------


def main():
    n = int(input())  # number of applicants
    # list of applicants' net worth
    apps = sorted([int(input()) for i in range(n)])
    std = 0  # Minimum wealth threshold
    i = 0  # Keep track of the list index

    while std <= n and i < n:
        if apps[i] >= std:
            std = apps[i]
        # short circuit condition: once the current threshold larger or equal
        # to the number of remaining applicants
        if std >= n - i:
            std = n - i
            break
        i += 1
    print(std)


if __name__ == "__main__":
    main()