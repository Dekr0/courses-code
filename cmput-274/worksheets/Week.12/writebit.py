from bitio import *


def main():
    with open("message.txt", "wb") as f_out:
        writer = BitWriter(f_out)
        bits = "01110011011101000111010101100100011110010010000001101000011000010111001001100100"

        for bit in bits:
            if bit == "0":
                writer.writebit(False)
            elif bit == "1":
                writer.writebit(True)
            else:
                pass

        writer.flush()


if __name__ == "__main__":
    main()