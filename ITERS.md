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

- [2024-04-23] Reading the following document: [The Packed Rewriting System](https://ling.sprachwiss.uni-konstanz.de/pages/xle/doc/transfer-manual.html).
  As I understand it, (this part of) XLE took one Prolog representation
  of F-structures, which are DAGs that represent gramatical content of
  sentences, and rewrote them into another representation more suitable
  for rewritings. *More suitable* because in the latter, all the bits of
  information of the F-structure are exploded into different prolog facts,
  so they can be attacked individually without resorting to tree traversal.

  The rewrites, written in a DSL, are then able to modify individual
  aspects of the original sentence (including presentation; i.e., not
  only semantic content). The resulting facts can then be re-encoded into
  the prior F-structure representation, which can then be reconstructed
  as a sentence.

- I think Natural Semantic Metalanguage has something to offer regarding
  the roles in TIL. This addresses a specific concern in DePaivaLogic2017;
  explicitly:

  > We have discussed ways of augmenting the number of roles of VerbNet
  > (from less than twenty) to a reasonable number, presumably much less
  > than the 400 that cyc has, but have found that a daunting task,
  > so we are still exploring possibilities. Roles in our system are
  > supposed to support inference and at the same time are supposed
  > to make the mapping from language feasible. For the latter purpose
  > (mapping from language feasibly) VerbNet roles are well-suited, but
  > they are too underspecified to help with inference. The quest is on
  > to find a collection of roles that keeps feasibility of the mapping,
  > but improves the inferential capabilities.

Tasks:

- Lookup Neo-Davidsonian Existence
- Lookup a more complete description of the TIL logic.
- Lookup the paper on Preventing Existence
- Lookup the researcher Aarne Ranta

Goals:

- [ ] Write down the concept generation as a series of graph rewritings.
