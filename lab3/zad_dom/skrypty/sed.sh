#!/bin/bash
FILE="../groovies/two.groovy"

# podmiana $HEADER$ na /temat/
echo "podmiana \$HEADER\$ na /temat/:"
sed 's/\$HEADER\$/\/temat\//g' ${FILE}

# usuwanie linijek z Help docs
echo "usuwanie linijek z Help docs:"
sed '/Help docs/d' ${FILE}