#!/bin/bash
FILE="../yolo.csv"

# nieparzyste id
echo "nieparzyste id:"
cut ${FILE} -d',' -f1,2,3,4,5,6,7 | grep -E '^[0-9]{0,}[13579],' 1>&2

# wartosc 2.99, 5.99, 9.99 
echo "wartosc 2.99, 5.99, 9.99:"
cut ${FILE} -d',' -f1,2,3,4,5,6,7 | grep -E '\$[259]\.[9]{2}[BM]' 1>&2