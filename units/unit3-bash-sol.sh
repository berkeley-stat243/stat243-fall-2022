# challenge 1

echo "There are $(grep -o "Belgium" cpds.csv | wc -l) uses of 'Belgium' in cpds.csv."

# Note that "grep -c" counts the number of lines so if 'bash' occurs multiple times in a line, you'd get the wrong answer

# you can also create a variable and then use that in 'echo'

num=$(grep -o "Belgium" cpds.csv | wc -l)
echo "There are ${num} uses of 'Belgium' in cpds.csv."

function count() {
    num=$(grep -o "$1" $2 | wc -l)
    echo "There are ${num} uses of '$1' in $2."
}

# challenge 2, parts 1-2
cut -d"," -f4 RTADataSub.csv | sort | uniq | grep "[^0-9,\.]"

# challenge 2, part 3
nfields=$(tail -n 1 RTADataSub.csv | grep -o "," | wc -l)
nfields=$((${nfields}+1))

for(( i=2; i<=${nfields}; i++ )); do
    echo "non-numeric values found in field number $i:"
    cut -d"," -f${i} RTADataSub.csv | sort | uniq | grep "[^0-9,\.]"
done

# challenge 3, parts 1-2
grep Belgium cpds.csv  | cut -d',' -f 6 | sort -n | head -n 1
echo "Belgium $(grep Belgium cpds.csv  | cut -d',' -f 6 | sort -n | head -n 1)"

# challenge 3, part 3
countries=$(tail -n +2 cpds.csv | cut -d"," -f2 | sort | uniq | sed 's/\"//g' 
# use of tail gets rid of 'country'

# challenge 3, part 4
for c in $countries; do
   echo "$c $(grep $c cpds.csv  | cut -d',' -f 6 | sort -n | head -n 1)"
done

# challenge 3, part 5
for c in $countries; do
   echo "$c $(grep $c cpds.csv  | cut -d',' -f 6 | sort -n | head -n 1)" >> mingdp.txt
done

# challenge 4, part 1

grep -v x RTADataSub.csv

# challenge 4, parts 2-3

function strip_missing() {
    grep -v ${1} ${2}
}
