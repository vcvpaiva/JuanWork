#!/bin/sh

grep -v '^#' |
grep -v '^[:space:]*$' |
while read ID FORM LEMMA UPOS XPOS FEATS HEAD DEPREL DEPS MISC; do
	[ "$UPOS" = "VERB" ] && echo "$FORM"
done |
sort |
uniq -c |
sed 's/ *\([0-9]\+\) \+\(.*\)/\1\t\2/' |
sort -rn
