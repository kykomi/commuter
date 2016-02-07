#!/bin/sh
cat ./lint_result.txt | cut -f 2 -d" " | sort | uniq -c | grep -E "\d+\s(error:|warning:)" | xargs | sed -e "s/error: /,/g" | sed -e "s/ warning://" >> count.csv
