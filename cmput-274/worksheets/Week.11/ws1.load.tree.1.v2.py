import pickle
from huffman import *

with open("tree.test.1.pickle", "rb") as fin:
    d = pickle.load(fin)

print("Load: ", d)
