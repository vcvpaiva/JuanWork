# Iterations of research

Current state of affairs: we have a database `data/MathNLIseed.tsv`
of pairs of hypothesis-assumption sentences. We have made them into a
treebank in the CoNLL-U format (code not included, as we take a treebank
as a starting point). We've extracted compound terms, with some issues
(`data/compounds.txt`), plus some other data.

My understanding now is that the path from CoNLL-U to a GKR structure
passes through some processes. First, there's the inference of the
“enhanced dependencies” representation of the sentence. Then, there
are a bunch of transformations designed to generate the different parts of
the GKR graph. My working hypothesis is that all of these transformations
can be expressed naturally as some kind of graph rewriting.

The first process, after the enhanced dependencies, is that of generating
the graph of contexts found in the sentence.

## Iter 0

- [2024-04-09] The concept graph is a formal object derived from a
  parsing of a sentece, and it is based on the so-called Neo-Davidsonian
  Semantics. Somehow, this is related to some discussions by Montague (and
  higher-order logic), which, when diluted so as to be computationally
  tractable, lands us somewhere near Description Logic. This is
  Valéria's TIL.

Tasks:

- Lookup Neo-Davidsonian Existence
- Lookup a more complete description of the TIL logic.
- Lookup the paper on Preventing Existence
- Lookup the researcher Aarne Ranta

Goals:

- [ ] Write down the concept generation as a series of graph rewritings.
