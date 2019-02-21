#!/bin/bash

# Build the compiler
#
# You MUST replace the following commands with the commands for building your compiler
cd src/

menhir parser.mly
ocamllex lexer.mll

ocamlbuild 'goc.native' -use-ocamlfind -use-menhir -no-hygiene
