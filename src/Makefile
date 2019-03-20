MENHIR_OPTS = --explain --stdlib '$(CURDIR)/menhir/share/menhir' -b parser common.mly
COMMON_OPTS = -I weed -use-ocamlfind -use-menhir -cflags '-g' -lflags -'g' -menhir '$(CURDIR)/menhir/bin/menhir $(MENHIR_OPTS)' goc.native
default: prod

debug: prep
	ocamlbuild  -I debug -pkg ppx_sexp_conv -pkg sexplib $(COMMON_OPTS) 
prod: prep
	ocamlbuild -I prod $(COMMON_OPTS) 
clean:
	-rm -r _build goc.native
distclean: clean
	-rm -r menhir menhir*.tar*

prep: menhir/bin/menhir
	-mkdir -p _build
	cp common.mly _build/
menhir/bin/menhir:
	./fix-menhir.sh
setup:
	opam install menhir sexplib ppx_sexp_conv ppx_deriving
