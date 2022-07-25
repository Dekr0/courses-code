from bitio import *

def main():
    with open("out.txt", "wb") as f:
        writer = BitWriter(f)
        bit_seq = "01101000 01100101 01101100 01101100 01101111"

        for i, bit in enumerate(bit_seq):
            if bit == "1":
                writer.writebit(True)
            elif bit == "0":
                writer.writebit(False)
            else:
                continue
            # Don't call flush() inside the loop. Flush will force to write out
            # any partials bytes to file. Detail, see source code

        writer.flush()


if __name__ == "__main__":
    main()