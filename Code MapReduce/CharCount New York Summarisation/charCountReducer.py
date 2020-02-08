#!/usr/bin/python

# reducer.py

# reduce function implementation for counting occurences of characters in text

import sys

def main(argv):
    lastChar = None
    currentChar = None
    charCount = 0

    for line in sys.stdin:
        # Remove all whitespace at the start and end
        line = line.strip()

        # process the name value pairs produced by the mapper
        currentChar, count = line.split("\t")

        # convert count from string to int
        count = int(count)

        # if fist time through loop
        if not lastChar:
            lastChar = currentChar

        # if currentChar and lastChar are the some increase the count
        if currentChar == lastChar:
            charCount += count
        else:
            # we've encountered a new character key
            print("%s\t%s" % (lastChar, charCount))
            lastChar = currentChar
            charCount = 1

    # need to output the very last count that was accumulated
    print("%s\t%s" % (currentChar, charCount))

if __name__ == "__main__":
    main(sys.argv)
