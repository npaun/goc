all:
	ocamlbuild -use-menhir -menhir 'menhir --explain --infer' -cflags '-g' -lflags '-g' -pkg dum goc.native
clean:
	-rm -r _build goc.native
setup:
	opam install menhir dum
