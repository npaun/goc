all:
	ocamlbuild -use-ocamlfind -pkg ppx_sexp_conv -pkg sexplib -use-menhir -menhir 'menhir --explain ' -cflags '-g' -lflags '-g' -pkg dum  goc.native
clean:
	-rm -r _build goc.native
setup:
	opam install menhir dum sexplib ppx_sexp_conv ppx_deriving
