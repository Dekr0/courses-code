import bitio
import sys

def main():
    try:
        f = open("simple.txt", "rb")
    except:
        print("File error")
        sys.exit(-1)
    read_bits = bitio.BitReader(f)

    # print("x \n",read_bits)
    try:
        while True:
            byte = read_bits.readbits(8)
            # print("x \n",byte)
            print(byte)
            print(chr(byte))
    except:
        f.close()

    f.close()

if __name__ == "__main__":
    main()
