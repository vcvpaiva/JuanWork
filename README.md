# JuanWork

Revisiting GKR (https://github.com/kkalouli/GKR_semantic_parser) but for mathematical texts, not using Java to make it more accessible.

First, we want to create representations,  in CNLL-U format (https://universaldependencies.org/format.html)
for the sentences/pairs in  https://github.com/vcvpaiva/MathNLI2024-/blob/main/gold-final-0116.txt.

## Bootstrapping

You should have Python with version at least 3.3.

1. For the Python packages, we use Python's (>v3.3) standard library (`venv`)

```
python -m venv .pyenv
```

2. Then, activate that environment however you please. For example, if you use a POSIX compliant shell, run

```
.pyenv/bin/activate
```

Or, if you use Fish, run

```
.pyenv/bin/activate.fish
```

Otherwise, just use the environment's `pip` directly:

```
.pyenv/bin/pip
```

In this last case, you should adapt how you run python scripts to use the environment.

3. Install the following packages:

- `spacy`
- `spacy_conll`

4. Run the converter

```
./parse.py MathNLIseed.tsv
```

This should generate an output with a sequence of CoNLL representations of the sentences in the source, like this:

```
# newdoc id = 1
# label = E
# sent_id = premise
# text = We use a number of interesting categories related to probability theory.
1	We	we	PRON	PRP	Case=Nom|Number=Plur|Person=1|PronType=Prs	2	nsubj	_	_
2	use	use	VERB	VBP	Tense=Pres|VerbForm=Fin	0	ROOT	_	_
3	a	a	DET	DT	Definite=Ind|PronType=Art	4	det	_	_
4	number	number	NOUN	NN	Number=Sing	2	dobj	_	_
5	of	of	ADP	IN	_	4	prep	_	_
6	interesting	interesting	ADJ	JJ	Degree=Pos	7	amod	_	_
7	categories	category	NOUN	NNS	Number=Plur	5	pobj	_	_
8	related	relate	VERB	VBN	Aspect=Perf|Tense=Past|VerbForm=Part	7	acl	_	_
9	to	to	ADP	IN	_	8	prep	_	_
10	probability	probability	NOUN	NN	Number=Sing	11	compound	_	_
11	theory	theory	NOUN	NN	Number=Sing	9	pobj	_	SpaceAfter=No
12	.	.	PUNCT	.	PunctType=Peri	2	punct	_	SpaceAfter=No
```

## Analysis

To run the script `conllu-stats.pl` provided by the Universal Dependencies folk, do the following:

Download the script and dependencies from their Github repository:

```
$ curl -LO https://github.com/UniversalDependencies/tools/raw/master/conllu-status.pl
$ curl -LO https://github.com/UniversalDependencies/tools/raw/master/udlib.pm
```

Make sure you have the appropriate Perl libraries installed. Maybe this can help:

```
# cpan install JSON::Parse
# cpan install YAML
```

Finally, run the script:

```
$ perl conllu-stats.pl treebank.conll > stats.xml
```
