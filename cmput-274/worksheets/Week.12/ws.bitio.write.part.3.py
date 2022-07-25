import bitio
import sys

def main():
    num = [ 87, 101, 32, 97, 114, 101, 32, 116, 104, 101, 32, 66, 111, 114, 103, 46, 10, 82, 101, 115, 105, 115, 116, 97, 110, 99, 101, 32, 105, 115, 32, 102, 117, 116, 105, 108, 101, 33, 10 ]

    try:
        f = open("message2.txt", "wb")
    except:
        print("File error")
        sys.exit(-1)
    write_byte = bitio.BitWriter(f)

    try:
        for i in num:
            write_byte.writebits(i,8)
    except:
        write_byte.flush()
        f.flush()
        f.close()
        pass
        # sys.exit(-1)

    write_byte.flush()
    f.flush()
    f.close()

if __name__ == "__main__":
    main()
