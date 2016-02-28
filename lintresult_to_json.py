#encoding: utf-8
import sys
import json

# give swiftlint result file name into command line first parameter  
# format lint result into json

# Lint Result Example
#
#/Users/hoge/Desktop/commuter/TimeTable.swift:31: warning: Trailing Whitespace Violation (Medium Severity): Line #31 should have no trailing whitespace: current has 8 trailing whitespace characters
#

def execute():
    file_name = sys.argv[1]
    in_file = open(file_name, "r")
    dict = {}
    for l in in_file:
        items = l.split(":")
        if len(items) < 4:
        	continue
        file_path = items[0]
        line_number = items[1]
        error_type = items[2]
        error_content = items[3]
        
        tmp = {}
        tmp['line_number'] = line_number
        tmp['error_type'] = error_type
        tmp['error_content'] = error_content
        if file_path in dict:
            existing = dict[file_path]
            existing.append(tmp)
            dict[file_path] = existing
        else:
            dict[file_path] = [tmp]
    in_file.close()
    out_file = open("lintsummary.json", "w")
    json.dump(dict, out_file, sort_keys=True, indent = 2)
    out_file.close()

if __name__ == "__main__":
    execute()