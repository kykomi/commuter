#!/bin/sh
if which swiftlint >/dev/null; then
  swiftlint > ./lint_result.txt 
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
