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
    n = 0
    try:
        while True:
            bit = read_bits.readbit()
            # print("x \n",bit)
            print(bit, end="")
            n += 1
            if( n == 8 ):
                print()
                n = 0
    except:
        f.close()

    f.close()

if __name__ == "__main__":
    main()
