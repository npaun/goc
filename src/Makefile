default: debug

debug: prep
	ocamlbuild  -I weed -I debug  -use-ocamlfind -pkg ppx_sexp_conv -pkg sexplib -use-menhir -menhir 'menhir --explain -b parser common.mly' -cflags '-g' -lflags '-g' goc.native
prod: prep
	ocamlbuild -I prod -use-ocamlfind -use-menhir -menhir 'menhir --explain -b parser common.mly' -cflags '-g' -lflags '-g' goc.native
clean:
	-rm -r _build goc.native
prep:
	-mkdir -p _build
	cp common.mly _build/
setup:
	opam install menhir sexplib ppx_sexp_conv ppx_deriving
