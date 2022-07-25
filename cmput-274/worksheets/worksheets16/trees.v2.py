# Based on code from previous C274/275 instructors
# Modified by Paul Lu, October 2020


class TreeLeaf:
    def __init__(self, uncompressed_byte):
        self.__value = uncompressed_byte
        return

    def get_value(self):
        return self.__value

    def __str__(self):
        return "Leaf storing " + self.__value


class TreeBranch:
    def __init__(self, lchild, rchild):
        self.__left = lchild
        self.__right = rchild
        return

    def get_left(self):
        return self.__left

    def get_right(self):
        return self.__right

    def __str__(self):
        s = "(" + str(self.__left) + " <- branch root -> "
        s += str(self.__right) + ")"
        return s


def make_encoding_table(huffman_tree):
    encoding_table = {}
    preorder(huffman_tree, encoding_table, ())
    return encoding_table


# preorder tree traversal
def preorder(tree, table, path):
    if isinstance(tree, TreeLeaf):  # base case
        table[tree.get_value()] = path
    elif isinstance(tree, TreeBranch):
        preorder(tree.get_left(), table, path + (False, ))

        preorder(tree.get_right(), table, path + (True, ))


def main():
    root = TreeBranch(
        TreeLeaf('A'), TreeBranch(
            TreeBranch(TreeLeaf('B'), TreeLeaf('C')), TreeLeaf('D')
        )
    )

    print(make_encoding_table(root))
    return


if __name__ == "__main__":
    main()
