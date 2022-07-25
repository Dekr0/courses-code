n = 100000
with open("extreme.txt", "w") as file:
     file.write(f"{n}\n")
     for i in range(n):
         if i == n-1:
             file.write(f"{i}")
         else:
             file.write(f"{i}\n")