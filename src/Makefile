all:
	mkdir -p _build
	cp common.mly _build/
	ocamlbuild  -use-ocamlfind -pkg ppx_sexp_conv -pkg sexplib -use-menhir -menhir 'menhir --explain -b parser common.mly' -cflags '-g' -lflags '-g' goc.native
clean:
	-rm -r _build goc.native
setup:
	opam install menhir sexplib ppx_sexp_conv ppx_deriving
