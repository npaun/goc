
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | XOR
    | VAR
    | TYPE
    | TIMES
    | SWITCH
    | STRUCT
    | STRINGLIT of (
# 7 "parser.mly"
       (string)
# 17 "parser.ml"
  )
    | SELECT
    | RSQUARE
    | RPAREN
    | RETURN
    | RBLOCK
    | RANGE
    | PRINTLN
    | PRINT
    | PLUS
    | PACKAGE
    | OR
    | NEQUAL
    | MINUS
    | MAP
    | LSQUARE
    | LPAREN
    | LESSER
    | LEQ
    | LEN
    | LBLOCK
    | INTLIT of (
# 8 "parser.mly"
       (int)
# 42 "parser.ml"
  )
    | INTERFACE
    | IMPORT
    | IF
    | IDENT of (
# 6 "parser.mly"
       (string)
# 50 "parser.ml"
  )
    | GREATER
    | GOTO
    | GO
    | GEQ
    | FUNC
    | FOR
    | FLOATLIT of (
# 9 "parser.mly"
       (float)
# 61 "parser.ml"
  )
    | FALLTHROUGH
    | EQUAL
    | ELSE
    | DIV
    | DEFER
    | DEFAULT
    | CONTINUE
    | CONST
    | CHAN
    | CASE
    | CAP
    | BREAK
    | BOR
    | BOOLLIT of (
# 10 "parser.mly"
       (bool)
# 79 "parser.ml"
  )
    | BASSIGN
    | BAND
    | ASSIGN
    | APPEND
    | AND
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state

# 1 "parser.mly"
  
open Parsing
open Lexing

# 108 "parser.ml"

let rec _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 39 "parser.mly"
      (int list)
# 125 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | RBLOCK ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv15)) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv13)) = Obj.magic _menhir_stack in
                ((let _3 = () in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_stmt = 
# 47 "parser.mly"
                     ( 1 )
# 167 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv11) = _menhir_stack in
                let (_v : 'tv_stmt) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
                let (_v : 'tv_stmt) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
                let ((_1 : 'tv_stmt) : 'tv_stmt) = _v in
                ((let _v : (
# 39 "parser.mly"
      (int list)
# 181 "parser.ml"
                ) = 
# 44 "parser.mly"
         ( _1 )
# 185 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv5) = _menhir_stack in
                let (_v : (
# 39 "parser.mly"
      (int list)
# 192 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
                let (_v : (
# 39 "parser.mly"
      (int list)
# 199 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
                let ((_1 : (
# 39 "parser.mly"
      (int list)
# 206 "parser.ml"
                )) : (
# 39 "parser.mly"
      (int list)
# 210 "parser.ml"
                )) = _v in
                (Obj.magic _1 : 'freshtv2)) : 'freshtv4)) : 'freshtv6)) : 'freshtv8)) : 'freshtv10)) : 'freshtv12)) : 'freshtv14)) : 'freshtv16)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv17)) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv18)) : 'freshtv20)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv22)) : 'freshtv24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv26)) : 'freshtv28))

# 233 "/home/michael/.opam/4.06.0/lib/menhir/standard.mly"
  

# 235 "parser.ml"
