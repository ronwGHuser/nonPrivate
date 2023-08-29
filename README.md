# Three Word Counter

Three Word Counter is a simple GoLang module that takes input file(s) via piped standard in or a input arguments.  The module removes all 0-9 values, and non alpha words then list the top 100 number of occurrences three word phrases occur among all of the input. 

500 - of the same\
125 - the same species\
125 - conditions of life\
116 - in the same\
110 - of natural selection\
103 - from each other

## Prerequisite
GoLang must be installed

## Installation

Refer to 

```bash
https://go.dev/doc/install
```

## Usage
Copy the topHundredThreeWordSets.go module to 

```bash
mkdir ~/go
cd /go

# Copy topHundredThreeWordSets.go to here
# Copy your test files here or to any directory of your choosing

# Run the module inputing a list of file(s) separated by a space
go run topHundredThreeWordSets.go ../inputFiles/file_1.txt ../inputFiles/file_2.txt

# or pipe in the text
cat ../inputFiles/file_1.txt | go run topHundredThreeWordSets.go

# or go crazy and pipe in text and read in files
cat ../inputFiles/file_1.txt | go run topHundredThreeWordSets.go file_2.txt

```
## Future Iterations
- Add more error handling such as warn when no data is passed in

## Test
```bash
# Small test
go run topHundredThreeWordSets.go test1.txt

# 2 files in
go run topHundredThreeWordSets.go test1.txt test2.txt

# Large file
go run topHundredThreeWordSets.go largeFileTest.txt

#standard in pipe test
cat test1.txt | go run topHundredThreeWordSets.go

#standard in pipe test and file arg
cat test1.txt | go run topHundredThreeWordSets.go test2.txt
```
## Known Bugs
