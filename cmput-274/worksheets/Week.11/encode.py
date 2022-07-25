from huffman import *


def encode_seq(string, table):
    seq = ""
    for char in string:
        path = [str(int(i)) for i in table[ord(char)]]
        seq += "".join(path)

    return seq


def main():
   data = input()
   f_stream = FakeStream(data)
   freq_table = make_freq_table(f_stream)
   tree = make_tree(freq_table)
   encode_table = make_encoding_table(tree)
   encoded = encode_seq(data, encode_table)
   print(encoded)


if __name__ == "__main__":
    main()