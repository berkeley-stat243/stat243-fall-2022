#!/bin/bash

## exercise 1

mypython=$(which python3)
echo $mypython

## exercise 2

myvar=$USER@$(hostname)
echo myvar

## exercise 3

mkdir -p temp/proj{1..3}/{code,data}
tree temp

## exercise 4

wc -l ~/.bashrc

## exercise 5

head -n3 ~/.bashrc
head -n3 ~/.bashrc | tail -n1

# Another way, using `sed`:

sed -n -e 1,3p .bashrc
sed -n -e 3p .bashrc

## exercise 6

sed -n -e 3p ~/.bashrc > tmp.txt
cat tmp.txt

## exercise 7

sed -n -e 5p .bashrc >> tmp.txt
cat tmp.txt

## exercise 8

wget https://raw.githubusercontent.com/berkeley-scf/tutorial-using-bash/gh-pages/cpds.csv
head -n2 cpds.csv
wc -l cpds.csv
grep Australia cpds.csv | wc -l
sed -n -e 1p cpds.csv > cpds_australia.csv
grep Australia cpds.csv >> cpds_australia.csv
head -n2 cpds_australia.csv
wc -l cpds_australia.csv

## exercise 9

echo "a bad line" >> cpds_australia.csv
grep -nv ',' cpds_australia.csv
sed -e 53d cpds_australia.csv > cpds_australia.csv
grep -nv ',' cpds_australia.csv

## exercise 10

for i in {1..4}; do echo "blah" > file${i}.txt; done
ls file*.txt
cat file1.txt
