import bitio
import sys

def main():
    string = "01101000 01100101 01101100 01101100 01101111"
    # string = "01101000 01100101 01101100 01101100 0110111"

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
            elif( i == '1' ):
                byte = write_bits.writebit(True)
            else:
                pass
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
