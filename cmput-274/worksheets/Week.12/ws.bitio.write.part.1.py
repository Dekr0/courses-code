import bitio
import sys

def main():
    string = "01110011011101000111010101100100011110010010000001101000011000010111001001100100"

    try:
        f = open("message.txt", "wb")
    except:
        print("File error")
        sys.exit(-1)
    write_bits = bitio.BitWriter(f)

    try:
        for i in string:
            if( i == '0' ):
                byte = write_bits.writebit(False)
            else:
                byte = write_bits.writebit(True)
    except:
        write_bits.flush()
        f.flush()
        f.close()
        pass
        # sys.exit(-1)

    write_bits.flush()
    f.flush()
    f.close()

if __name__ == "__main__":
    main()
