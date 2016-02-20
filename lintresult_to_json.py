#encoding: utf-8
import sys

# give swiftlint result file name into command line first parameter  
# format lint result into json

# Lint Result Example
#
#/Users/hoge/Desktop/commuter/TimeTable.swift:31: warning: Trailing Whitespace Violation (Medium Severity): Line #31 should have no trailing whitespace: current has 8 trailing whitespace characters
#

def execute():
    file_name = sys.argv[1]
    in_file = open(file_name, "r")
    out_file = open("lintsummary.json", "w")
    dit = {}
    for l in in_file:
        items = l.split(":")
    in_file.close()
    out_file.close()

if __name__ == "__main__":
    execute()