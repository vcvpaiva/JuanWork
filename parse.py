#!/usr/bin/env python
from spacy_conll import init_parser
import sys
import csv

if len(sys.argv) < 2:
	print("usage: ./parse.py DATAFILE")
	sys.exit(1)

# Read data
with open(sys.argv[1], "r") as f:
	reader = csv.DictReader(f, delimiter="	", fieldnames=["id", "premise", "hypothesis", "label"])
	data = list(reader)

nlp = init_parser("en_core_web_sm", "spacy")

for case in data:
	prem = nlp(case['premise'])
	hypo = nlp(case['hypothesis'])
	print(f'# newdoc id = {case["id"]}')
	print(f'# label = {case["label"]}')
	print('# sent_id = premise')
	print(f'# text = {case["premise"]}')
	print(prem._.conll_str)
	print('# sent_id = hypothesis')
	print(f'# text = {case["hypothesis"]}')
	print(hypo._.conll_str)
