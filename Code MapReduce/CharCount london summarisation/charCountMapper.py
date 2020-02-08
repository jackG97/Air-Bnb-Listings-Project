#!/usr/bin/python
import sys 
import re 

def main(argv): 
    pattern = re.compile("[a-zA-Z]")
    for line in sys.stdin: 
        for charact in pattern.findall(line): 
            print(charact.lower() + "\t" + "1")


if __name__ == "__main__": 
    main(sys.argv) 
