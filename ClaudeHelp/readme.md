Seeing if Claude can do the `translation' of GKR into spacy+python.

the proposed structure:

```
gkr_semantic_parser_py/
├── pyproject.toml
├── README.md
├── src/
│   └── gkr_parser/
│       ├── __init__.py
│       ├── cli.py
│       │
│       ├── nlp/
│       │   ├── __init__.py
│       │   ├── spacy_parser.py
│       │   ├── tokens.py
│       │   └── normalization.py
│       │
│       ├── mapping/
│       │   ├── __init__.py
│       │   ├── dep_graph_to_semantic_graph.py
│       │   ├── roles_mapper.py
│       │   ├── context_mapper.py
│       │   ├── sense_mappings_retriever.py
│       │   └── lexical_features.py
│       │
│       ├── graph/
│       │   ├── __init__.py
│       │   ├── semantic_graph.py
│       │   ├── sem_graph.py
│       │   ├── sem_jgrapht.py
│       │   ├── nodes.py
│       │   ├── edges.py
│       │   └── traversal.py
│       │
│       ├── vetypes/
│       │   ├── __init__.py
│       │   ├── labels.py
│       │   ├── contents.py
│       │   ├── skolem.py
│       │   ├── term.py
│       │   ├── sense.py
│       │   ├── value.py
│       │   ├── context.py
│       │   ├── role.py
│       │   ├── property.py
│       │   └── lex.py
│       │
│       └── resources/
│           ├── gkr.properties
│           └── mappings/
│               └── sense_mappings.json
└── tests/
    ├── test_spacy_parser.py
    ├── test_dep_graph_mapping.py
    └── fixtures/
        └── sample_sentences.txt
'''
