#encoding: utf-8
import sys

# give swiftlint result file name into command line first parameter  
# count number of error and warning.
# append these counts to csv file.   
def execute():
    file_name = sys.argv[1]
    in_file = open(file_name, "r")
    out_file = open("count.csv", "a")
    warning_count = 0
    errors_count = 0 
    for l in in_file:
        items = l.split(" ")
        if len(items) >= 2:
            if items[1] == "warning:":
                warning_count += 1
            elif items[1] == "error:":
                errors_count += 1
            else:
                pass
    out_file.write(str(errors_count) + "," + str(warning_count) + "\n")
    in_file.close()
    out_file.close()
       

if __name__ == "__main__":
    execute()