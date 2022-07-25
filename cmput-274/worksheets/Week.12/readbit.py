from bitio import *


def main():
    with open("out.txt", "rb") as f:
        reader = BitReader(f)
        EOF = False
        counter = 1

        while not EOF:
            try:
                bit = reader.readbit()
                print(bit, end="")
                counter += 1
                if counter == 8:
                    print(end=" ")
                    counter = 1

            except EOFError:
                EOF = True

        print()
        f.seek(0)

        EOF = False
        bsize = 8
        while not EOF:
            try:
                byte = reader.readbits(bsize)
                print(chr(byte), end="")
            except EOFError:
                EOF = True


if __name__ == "__main__":
    main()
