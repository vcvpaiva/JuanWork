src=$2.tex
redo-ifchange $src
mkdir -p .tmp
echo Compiling $src... >&2
xelatex -interaction=nonstopmode -halt-on-error -output-directory .tmp $src >&2
cp .tmp/$(basename $2).pdf $3
