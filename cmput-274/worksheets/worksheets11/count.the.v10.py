import sys

Debug = False   # Sometimes, print for debugging
InputFilename = "file.input.txt"
InputObjectsList = []
InputObjectsHash = []
allWords = 0
theCount = 0
nonTarget = [] 
TargetWords = ['outside', 'today', 'weather', 'raining', 'nice', 'rain', 'snow', 'day', 'winter', 'cold', 'warm', 'snowing', 'out', 'hope', 'boots', 'sunny', 'windy', 'coming', 'perfect', 'need', 'sun', 'on', 'was', '-40', 'jackets', 'wish', 'fog', 'pretty', 'summer']

def arg_parse():

    filename = sys.argv[1:]

    return filename

def open_file(InputFilenames=None):
    fs = []
    try:
        if not InputFilenames:
            fs.append(open("file.input.txt", "r"))
            return fs

        for filename in InputFilenames:
            fs.append(open(filename, "r"))

        return fs

    except FileNotFoundError:
        # FileNotFoundError is subclass of OSError
        if True or Debug:   # Always on
            print("File Not Found")
        fs.append(sys.stdin)
    except OSError:
        if Debug:
            print("Other OS Error")
        fs.append(sys.stdin)


def safe_input(f=None, prompt=""):
    try:
        # Case:  Stdin
        if f is sys.stdin or f is None:
            line = input(prompt)
        # Case:  From file
        else:
            assert not (f is None)
            assert (f is not None)
            line = f.readline()
            if Debug:
                print("readline: ", line, end='')
            if line == "":  # Check EOF before strip()
                if Debug:
                    print("EOF")
                return("", False)
        return(line.strip(), True)
    except EOFError:
        return("", False)


def print_training_data_obj(inObjList, inObjHash):
    i = 0
    while i < len(inObjList):
        print("( %s) %s" % (inObjHash[i]["label"], inObjList[i]))
        if Debug:
            print("-->", inObjHash[i]["words"])
        i += 1


def process_input_line(line):
    # We will want to get rid of global variables, as much as possible
    global allWords, theCount, nonTarget

    trainInstance = {}
    trainInstance["label"] = "None"
    trainInstance["words"] = []
    for w in line.split():
        allWords = allWords + 1
        if w[0] == "#":
            trainInstance["label"] = w
        else:
            trainInstance["words"].append(w)

        if w in TargetWords:
            theCount = theCount + 1
        elif w != '':
            if w not in nonTarget:
                nonTarget.append(w)
    return(trainInstance)


def process_input_stream(inFiles, inObjList, inObjHash):
    assert not (inFiles is None), "Assume valid file object"

    for file in inFiles:
        cFlag = True
        while cFlag:
            line, cFlag = safe_input(file)
            if line.startswith("%"):
                continue
            if not cFlag:
                break
            assert cFlag, "Assume valid input hereafter"
            # Save the training data input
            inObjList.append(line)
            inObjHash.append(process_input_line(line))


def main():
    # TODO:  Get input filename from command line.  Possibly multiple inputs.
    input_filenames = arg_parse()
    inFiles = open_file(InputFilenames=input_filenames)
    assert not (inFiles is None), "Assume valid file object"

    # TODO:  Work towards weather related target words
    # TODO:  Want to save the input, to do post processing

    process_input_stream(inFiles, InputObjectsList, InputObjectsHash)

    print("TargetWords Hardcoded (%d): " % len(TargetWords), TargetWords)
    print_training_data_obj(InputObjectsList, InputObjectsHash)

    print("All words:%3s. Target words:%3s" % (allWords, theCount))
    print("Non-Target words: ", nonTarget)


if __name__ == "__main__":
    main()
