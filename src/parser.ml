
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | XORASSIGN
    | XOR
    | VAR
    | UNDERSCORE
    | UMINUS
    | TYPE
    | TRUE
    | TRIPDOT
    | TIMES
    | TASSIGN
    | SWITCH
    | STRUCT
    | STRINGLIT of (
# 21 "parser.mly"
       (string)
# 23 "parser.ml"
  )
    | STRING
    | SEMI
    | SELECT
    | RUNE
    | RSQUARE
    | RSHIFT
    | RSHASSIGN
    | RPAREN
    | RETURN
    | RBLOCK
    | RANGE
    | PRINTLN
    | PRINT
    | PLUSPLUS
    | PLUS
    | PASSIGN
    | PACKAGE
    | ORASSIGN
    | OR
    | NOT
    | NOP
    | NEQUAL
    | MODASSIGN
    | MOD
    | MINUSMINUS
    | MINUS
    | MASSIGN
    | MAP
    | LSQUARE
    | LSHIFT
    | LSHASSIGN
    | LPAREN
    | LESSER
    | LEQ
    | LEN
    | LEFTARROW
    | LBLOCK
    | INTLIT of (
# 22 "parser.mly"
       (int)
# 65 "parser.ml"
  )
    | INTERFACE
    | INT
    | IMPORT
    | IF
    | IDENT of (
# 20 "parser.mly"
       (string)
# 74 "parser.ml"
  )
    | GREATER
    | GOTO
    | GO
    | GEQ
    | FUNC
    | FOR
    | FLOATLIT of (
# 23 "parser.mly"
       (float)
# 85 "parser.ml"
  )
    | FLOAT
    | FALSE
    | FALLTHROUGH
    | EQUAL
    | EOF
    | ELSE
    | DOT
    | DIV
    | DEFER
    | DEFAULT
    | DASSIGN
    | CONTINUE
    | CONST
    | COMMA
    | COLON
    | COLASSIGN
    | CHAN
    | CASE
    | CAP
    | BREAK
    | BOR
    | BOOLLIT of (
# 24 "parser.mly"
       (bool)
# 111 "parser.ml"
  )
    | BOOL
    | BAND
    | ASSIGN
    | APPEND
    | ANDXORASSIGN
    | ANDXOR
    | ANDASSIGN
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

and _menhir_state = 
  | MenhirState210
  | MenhirState203
  | MenhirState198
  | MenhirState193
  | MenhirState190
  | MenhirState189
  | MenhirState186
  | MenhirState184
  | MenhirState179
  | MenhirState170
  | MenhirState162
  | MenhirState159
  | MenhirState157
  | MenhirState155
  | MenhirState151
  | MenhirState146
  | MenhirState144
  | MenhirState138
  | MenhirState136
  | MenhirState134
  | MenhirState133
  | MenhirState132
  | MenhirState130
  | MenhirState127
  | MenhirState122
  | MenhirState120
  | MenhirState118
  | MenhirState117
  | MenhirState116
  | MenhirState115
  | MenhirState114
  | MenhirState111
  | MenhirState107
  | MenhirState106
  | MenhirState101
  | MenhirState99
  | MenhirState96
  | MenhirState85
  | MenhirState81
  | MenhirState76
  | MenhirState75
  | MenhirState74
  | MenhirState72
  | MenhirState71
  | MenhirState70
  | MenhirState63
  | MenhirState60
  | MenhirState57
  | MenhirState54
  | MenhirState45
  | MenhirState38
  | MenhirState21
  | MenhirState16
  | MenhirState15
  | MenhirState13
  | MenhirState7
  | MenhirState4

# 1 "parser.mly"
  
open Golite
open Lexing

let annot node startpos endpos =
	let pos_tuple pos = 
		(pos.pos_lnum, pos.pos_cnum - pos.pos_bol)
	in
	{ v = node; _start = pos_tuple startpos; _end = pos_tuple endpos; _debug = "Hi!"; _derived = None}  

# 206 "parser.ml"

let rec _menhir_goto_print_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_print_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv817) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_print_stmt) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv815) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_print_stmt) : 'tv_print_stmt) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_simple_stmt = 
# 173 "parser.mly"
               (_1)
# 227 "parser.ml"
     in
    _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv816)) : 'freshtv818)

and _menhir_reduce98 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_simple_stmt = 
# 174 "parser.mly"
              (Expr _1)
# 239 "parser.ml"
     in
    _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_if_cond : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_if_cond -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv813 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBLOCK ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv814)

and _menhir_goto_var_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_var_decl -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv811) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_var_decl) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv809) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_var_decl) : 'tv_var_decl) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_toplevel_decl = 
# 78 "parser.mly"
               (List.map (fun dcl -> Global dcl) _1)
# 277 "parser.ml"
     in
    _menhir_goto_toplevel_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv810)) : 'freshtv812)

and _menhir_goto_separated_nonempty_list_COMMA_expr_ : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    match _menhir_s with
    | MenhirState184 | MenhirState151 | MenhirState118 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv803) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv801) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_separated_nonempty_list_COMMA_expr_) : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let _endpos = _endpos__1_ in
        let _v : 'tv_expr_list = 
# 255 "parser.mly"
                                               (_1)
# 299 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv799) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_list) = _v in
        ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState118 | MenhirState16 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv781 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | RPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv777 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv775 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                let (_endpos__3_ : Lexing.position) = _endpos in
                ((let ((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos_x_, _, (x : 'tv_expr_list)) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _endpos = _endpos__3_ in
                let _v : 'tv_mandatory_arguments = let _1 = 
# 200 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x )
# 329 "parser.ml"
                 in
                
# 251 "parser.mly"
                                                        (_1)
# 334 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv773) = _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_mandatory_arguments) = _v in
                ((match _menhir_s with
                | MenhirState122 | MenhirState15 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv763) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _endpos in
                    let (_menhir_s : _menhir_state) = _menhir_s in
                    let (_v : 'tv_mandatory_arguments) = _v in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv761) = Obj.magic _menhir_stack in
                    let (_endpos__1_ : Lexing.position) = _endpos in
                    let (_menhir_s : _menhir_state) = _menhir_s in
                    let ((_1 : 'tv_mandatory_arguments) : 'tv_mandatory_arguments) = _v in
                    ((let _endpos = _endpos__1_ in
                    let _v : 'tv_arguments = 
# 253 "parser.mly"
                       (_1)
# 357 "parser.ml"
                     in
                    _menhir_goto_arguments _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv762)) : 'freshtv764)
                | MenhirState117 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv767 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _endpos in
                    let (_menhir_s : _menhir_state) = _menhir_s in
                    let (_v : 'tv_mandatory_arguments) = _v in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv765 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos__2_ : Lexing.position) = _endpos in
                    let (_ : _menhir_state) = _menhir_s in
                    let ((_2 : 'tv_mandatory_arguments) : 'tv_mandatory_arguments) = _v in
                    ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                    let _1 = () in
                    let _startpos = _startpos__1_ in
                    let _endpos = _endpos__2_ in
                    let _v : 'tv_print_stmt = 
# 198 "parser.mly"
                              (Print(true, _2))
# 378 "parser.ml"
                     in
                    _menhir_goto_print_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv766)) : 'freshtv768)
                | MenhirState120 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv771 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _endpos in
                    let (_menhir_s : _menhir_state) = _menhir_s in
                    let (_v : 'tv_mandatory_arguments) = _v in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv769 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos__2_ : Lexing.position) = _endpos in
                    let (_ : _menhir_state) = _menhir_s in
                    let ((_2 : 'tv_mandatory_arguments) : 'tv_mandatory_arguments) = _v in
                    ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                    let _1 = () in
                    let _startpos = _startpos__1_ in
                    let _endpos = _endpos__2_ in
                    let _v : 'tv_print_stmt = 
# 197 "parser.mly"
                            (Print(false, _2))
# 399 "parser.ml"
                     in
                    _menhir_goto_print_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv770)) : 'freshtv772)
                | _ ->
                    _menhir_fail ()) : 'freshtv774)) : 'freshtv776)) : 'freshtv778)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv779 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv780)) : 'freshtv782)
        | MenhirState151 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv791 * _menhir_state * 'tv_identifier_list * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv789 * _menhir_state * 'tv_identifier_list * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_identifier_list), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr_list)) = _menhir_stack in
            let _2 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_assign_stmt = 
# 178 "parser.mly"
                                   (Assign(_1,_3))
# 423 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv787) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_assign_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv785) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_assign_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv783) = Obj.magic _menhir_stack in
            let (_endpos__1_ : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_assign_stmt) : 'tv_assign_stmt) = _v in
            let (_startpos__1_ : Lexing.position) = _startpos in
            ((let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_simple_stmt = 
# 170 "parser.mly"
                (_1)
# 448 "parser.ml"
             in
            _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv784)) : 'freshtv786)) : 'freshtv788)) : 'freshtv790)) : 'freshtv792)
        | MenhirState184 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv797 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv793 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOLLIT _v ->
                    _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | BREAK ->
                    _menhir_run166 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | CONTINUE ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | DEFER ->
                    _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState186
                | FLOATLIT _v ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | FOR ->
                    _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IDENT _v ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IF ->
                    _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | INTLIT _v ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | LBLOCK ->
                    _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | LPAREN ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | MINUS ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | NOT ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PLUS ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PRINT ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PRINTLN ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | RETURN ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | SEMI ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState186
                | STRINGLIT _v ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | SWITCH ->
                    _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | VAR ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | XOR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | CASE | DEFAULT | FALLTHROUGH | RBLOCK ->
                    _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState186
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186) : 'freshtv794)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv795 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv796)) : 'freshtv798)
        | _ ->
            _menhir_fail ()) : 'freshtv800)) : 'freshtv802)) : 'freshtv804)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv807 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv805 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos_xs_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_COMMA_expr_) : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
        let _2 = () in
        let _endpos = _endpos_xs_ in
        let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 243 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 539 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv806)) : 'freshtv808)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr1 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr1 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv759 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | OR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv671 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOLLIT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FLOATLIT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INTLIT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | MINUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRINGLIT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv672)
    | COLON | COMMA | LBLOCK | RPAREN | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv755 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr1), _startpos__1_) = _menhir_stack in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_expr = 
# 258 "parser.mly"
            (_1)
# 592 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv753) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
        match _menhir_s with
        | MenhirState184 | MenhirState151 | MenhirState118 | MenhirState63 | MenhirState16 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv679 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COMMA ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv673 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOLLIT _v ->
                    _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | FLOATLIT _v ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IDENT _v ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | INTLIT _v ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | LPAREN ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | MINUS ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | NOT ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PLUS ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | STRINGLIT _v ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | XOR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv674)
            | COLON | LBLOCK | RPAREN | SEMI ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv675 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
                let _endpos = _endpos_x_ in
                let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 241 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 646 "parser.ml"
                 in
                _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv676)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv677 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv678)) : 'freshtv680)
        | MenhirState13 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv687 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | RPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv683 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv681 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos__3_ : Lexing.position) = _endpos in
                ((let ((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : 'tv_expr), _startpos__2_) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__3_ in
                let _v : 'tv_expr_sub = 
# 317 "parser.mly"
                      (_2)
# 678 "parser.ml"
                 in
                _menhir_goto_expr_sub _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv682)) : 'freshtv684)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv685 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv686)) : 'freshtv688)
        | MenhirState7 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv701 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 693 "parser.ml"
            ) * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv699 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 699 "parser.ml"
            ) * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, (_2 : (
# 20 "parser.mly"
       (string)
# 704 "parser.ml"
            )), _startpos__2_), _endpos__4_, _, (_4 : 'tv_expr), _startpos__4_) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__4_ in
            let _v : 'tv_typed_var_decl = 
# 131 "parser.mly"
                         (Var("milton",`AUTO,None))
# 713 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv697) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_typed_var_decl) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((match _menhir_s with
            | MenhirState115 | MenhirState186 | MenhirState132 | MenhirState179 | MenhirState170 | MenhirState133 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv691) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_typed_var_decl) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv689) = Obj.magic _menhir_stack in
                let (_endpos__1_ : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_typed_var_decl) : 'tv_typed_var_decl) = _v in
                let (_startpos__1_ : Lexing.position) = _startpos in
                ((let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_stmt = 
# 159 "parser.mly"
                  (Decl _1)
# 740 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv690)) : 'freshtv692)
            | MenhirState210 | MenhirState4 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv695) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_typed_var_decl) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv693) = Obj.magic _menhir_stack in
                let (_endpos__1_ : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_typed_var_decl) : 'tv_typed_var_decl) = _v in
                let (_startpos__1_ : Lexing.position) = _startpos in
                ((let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_var_decl = 
# 122 "parser.mly"
                     ([_1])
# 761 "parser.ml"
                 in
                _menhir_goto_var_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv694)) : 'freshtv696)
            | _ ->
                _menhir_fail ()) : 'freshtv698)) : 'freshtv700)) : 'freshtv702)
        | MenhirState107 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv715 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 771 "parser.ml"
            ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv713 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 777 "parser.ml"
            ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 782 "parser.ml"
            )), _startpos__1_), _), _endpos__3_, _, (_3 : 'tv_expr), _startpos__3_) = _menhir_stack in
            let _2 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_short_var_decl = 
# 127 "parser.mly"
                        (Var("donkey",`AUTO,None))
# 790 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv711) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_short_var_decl) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((match _menhir_s with
            | MenhirState115 | MenhirState116 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 | MenhirState136 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv705) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_short_var_decl) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv703) = Obj.magic _menhir_stack in
                let (_endpos__1_ : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_short_var_decl) : 'tv_short_var_decl) = _v in
                let (_startpos__1_ : Lexing.position) = _startpos in
                ((let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_simple_stmt = 
# 169 "parser.mly"
                  (Decl _1)
# 817 "parser.ml"
                 in
                _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv704)) : 'freshtv706)
            | MenhirState4 | MenhirState210 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv709) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_short_var_decl) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv707) = Obj.magic _menhir_stack in
                let (_endpos__1_ : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_short_var_decl) : 'tv_short_var_decl) = _v in
                let (_startpos__1_ : Lexing.position) = _startpos in
                ((let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_var_decl = 
# 123 "parser.mly"
                     ([_1])
# 838 "parser.ml"
                 in
                _menhir_goto_var_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv708)) : 'freshtv710)
            | _ ->
                _menhir_fail ()) : 'freshtv712)) : 'freshtv714)) : 'freshtv716)
        | MenhirState127 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv725 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 848 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_assign_op) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv723 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 854 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_assign_op) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 859 "parser.ml"
            )), _startpos__1_), _, (_2 : 'tv_assign_op)), _endpos__3_, _, (_3 : 'tv_expr), _startpos__3_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_op_assign_stmt = 
# 184 "parser.mly"
                       (OpAssign(_1,_2,_3))
# 866 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv721) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_op_assign_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv719) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_op_assign_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv717) = Obj.magic _menhir_stack in
            let (_endpos__1_ : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_op_assign_stmt) : 'tv_op_assign_stmt) = _v in
            let (_startpos__1_ : Lexing.position) = _startpos in
            ((let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_simple_stmt = 
# 171 "parser.mly"
                  (_1)
# 891 "parser.ml"
             in
            _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv718)) : 'freshtv720)) : 'freshtv722)) : 'freshtv724)) : 'freshtv726)
        | MenhirState134 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv729 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv727 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : 'tv_expr), _startpos__2_) = _menhir_stack in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__2_ in
            let _v : 'tv_return_stmt = 
# 203 "parser.mly"
              (Return (Some _2))
# 906 "parser.ml"
             in
            _menhir_goto_return_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv728)) : 'freshtv730)
        | MenhirState138 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv733 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv731 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_simple_stmt), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr), _startpos__3_) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_if_cond = 
# 213 "parser.mly"
                         ((_1, [_3]))
# 919 "parser.ml"
             in
            _menhir_goto_if_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)) : 'freshtv734)
        | MenhirState136 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv739 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMI ->
                _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack)
            | LBLOCK ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv735 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr), _startpos__1_) = _menhir_stack in
                let _v : 'tv_if_cond = 
# 214 "parser.mly"
          ((Empty, [_1]))
# 937 "parser.ml"
                 in
                _menhir_goto_if_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv737 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv738)) : 'freshtv740)
        | MenhirState155 | MenhirState157 | MenhirState159 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv743 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv741 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
            let _v : 'tv_option_expr_ = 
# 116 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 956 "parser.ml"
             in
            _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv742)) : 'freshtv744)
        | MenhirState115 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv745 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            (_menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) : 'freshtv746)
        | MenhirState198 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv749 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv747 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_simple_stmt), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr), _startpos__3_) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_switch_cond = 
# 229 "parser.mly"
                        ((_1,Some _3))
# 973 "parser.ml"
             in
            _menhir_goto_switch_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv748)) : 'freshtv750)
        | MenhirState116 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv751 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            (_menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) : 'freshtv752)
        | _ ->
            _menhir_fail ()) : 'freshtv754)) : 'freshtv756)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv757 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv758)) : 'freshtv760)

and _menhir_run57 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState57 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState57 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState57 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState57 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState57 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_goto_op_rel : _menhir_env -> 'ttv_tail -> 'tv_op_rel -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv669 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54) : 'freshtv670)

and _menhir_goto_expr2 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr2 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState198 | MenhirState184 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 | MenhirState155 | MenhirState157 | MenhirState159 | MenhirState136 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState107 | MenhirState7 | MenhirState13 | MenhirState63 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv661 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | LBLOCK | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv657 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr2), _startpos__1_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_expr1 = 
# 262 "parser.mly"
          (_1)
# 1074 "parser.ml"
             in
            _menhir_goto_expr1 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv658)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv659 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv660)) : 'freshtv662)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv667 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | LBLOCK | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv663 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr1), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr2), _startpos__3_) = _menhir_stack in
            let _2 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr1 = 
# 261 "parser.mly"
                 (annot (Op2(`OR, _1, _3)) _startpos__1_ _endpos__3_)
# 1102 "parser.ml"
             in
            _menhir_goto_expr1 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv664)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv665 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv666)) : 'freshtv668)
    | _ ->
        _menhir_fail ()

and _menhir_run48 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv655) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 274 "parser.mly"
          (`NEQ)
# 1124 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv656)

and _menhir_run49 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv653) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 275 "parser.mly"
          (`LT)
# 1137 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv654)

and _menhir_run50 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv651) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 277 "parser.mly"
        (`LEQ)
# 1150 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv652)

and _menhir_run51 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv649) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 276 "parser.mly"
           (`GT)
# 1163 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv650)

and _menhir_run52 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv647) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 278 "parser.mly"
        (`GEQ)
# 1176 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv648)

and _menhir_run53 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv645) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 273 "parser.mly"
          (`EQ)
# 1189 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv646)

and _menhir_goto_op_add : _menhir_env -> 'ttv_tail -> 'tv_op_add -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv643 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState45 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState45 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState45 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState45 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState45 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv644)

and _menhir_goto_expr3 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr3 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState198 | MenhirState184 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 | MenhirState155 | MenhirState157 | MenhirState159 | MenhirState136 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState107 | MenhirState7 | MenhirState13 | MenhirState63 | MenhirState60 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv635 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack)
        | GREATER ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack)
        | LESSER ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | NEQUAL ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | AND | COLON | COMMA | LBLOCK | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv631 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr3), _startpos__1_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_expr2 = 
# 266 "parser.mly"
          (_1)
# 1257 "parser.ml"
             in
            _menhir_goto_expr2 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv632)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv633 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv634)) : 'freshtv636)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv641 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack)
        | GREATER ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack)
        | LESSER ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | NEQUAL ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | AND | COLON | COMMA | LBLOCK | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv637 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr2), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr3), _startpos__3_) = _menhir_stack in
            let _2 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr2 = 
# 265 "parser.mly"
                   (annot (Op2(`AND,_1,_3)) _startpos__1_ _endpos__3_)
# 1295 "parser.ml"
             in
            _menhir_goto_expr2 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv638)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv639 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv640)) : 'freshtv642)
    | _ ->
        _menhir_fail ()

and _menhir_run41 : _menhir_env -> 'ttv_tail -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv629) = Obj.magic _menhir_stack in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _v : 'tv_op_add = 
# 289 "parser.mly"
        (`BXOR)
# 1318 "parser.ml"
     in
    _menhir_goto_op_add _menhir_env _menhir_stack _v) : 'freshtv630)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv627) = Obj.magic _menhir_stack in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _v : 'tv_op_add = 
# 286 "parser.mly"
         (`ADD)
# 1332 "parser.ml"
     in
    _menhir_goto_op_add _menhir_env _menhir_stack _v) : 'freshtv628)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv625) = Obj.magic _menhir_stack in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _v : 'tv_op_add = 
# 287 "parser.mly"
          (`SUB)
# 1346 "parser.ml"
     in
    _menhir_goto_op_add _menhir_env _menhir_stack _v) : 'freshtv626)

and _menhir_run44 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv623) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_add = 
# 288 "parser.mly"
        (`BOR)
# 1359 "parser.ml"
     in
    _menhir_goto_op_add _menhir_env _menhir_stack _v) : 'freshtv624)

and _menhir_goto_op_mul : _menhir_env -> 'ttv_tail -> 'tv_op_mul -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv621 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) * 'tv_op_mul) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState38 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState38 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState38 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState38 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState38 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState38 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv622)

and _menhir_goto_expr4 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr4 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState198 | MenhirState184 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 | MenhirState155 | MenhirState157 | MenhirState159 | MenhirState136 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState107 | MenhirState7 | MenhirState13 | MenhirState63 | MenhirState60 | MenhirState57 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv613 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOR ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COLON | COMMA | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | NEQUAL | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv609 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr4), _startpos__1_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_expr3 = 
# 270 "parser.mly"
          (_1)
# 1423 "parser.ml"
             in
            _menhir_goto_expr3 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv610)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv611 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv612)) : 'freshtv614)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv619 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOR ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COLON | COMMA | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | NEQUAL | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv615 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr3), _startpos__1_), (_2 : 'tv_op_rel)), _endpos__3_, _, (_3 : 'tv_expr4), _startpos__3_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr3 = 
# 269 "parser.mly"
                     (annot (Op2(_2,_1,_3)) _startpos__1_ _endpos__3_)
# 1456 "parser.ml"
             in
            _menhir_goto_expr3 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv616)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv617 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv618)) : 'freshtv620)
    | _ ->
        _menhir_fail ()

and _menhir_run31 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv607) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 297 "parser.mly"
          (`MUL)
# 1478 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv608)

and _menhir_run32 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv605) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 301 "parser.mly"
          (`SR)
# 1491 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv606)

and _menhir_run33 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv603) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 299 "parser.mly"
        (`MOD)
# 1504 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv604)

and _menhir_run34 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv601) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 300 "parser.mly"
          (`SL)
# 1517 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv602)

and _menhir_run35 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv599) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 298 "parser.mly"
        (`DIV)
# 1530 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv600)

and _menhir_run36 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv597) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 302 "parser.mly"
         (`BAND)
# 1543 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv598)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv595) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 303 "parser.mly"
          (`BANDNOT)
# 1556 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv596)

and _menhir_goto_list_SEMI_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_SEMI_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv589 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_list_SEMI_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv587 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_list_SEMI_) : 'tv_list_SEMI_) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let x = () in
        let _v : 'tv_list_SEMI_ = 
# 213 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1577 "parser.ml"
         in
        _menhir_goto_list_SEMI_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv588)) : 'freshtv590)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv593 * _menhir_state * 'tv_statements)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_list_SEMI_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv591 * _menhir_state * 'tv_statements)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_list_SEMI_) : 'tv_list_SEMI_) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_statements)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_switch_body = 
# 238 "parser.mly"
                               ((_1,FALLTHROUGH))
# 1594 "parser.ml"
         in
        _menhir_goto_switch_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv592)) : 'freshtv594)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_switch_case_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_switch_case_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv571 * _menhir_state * 'tv_switch_case) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv569 * _menhir_state * 'tv_switch_case) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_switch_case)), _, (xs : 'tv_list_switch_case_)) = _menhir_stack in
        let _v : 'tv_list_switch_case_ = 
# 213 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1613 "parser.ml"
         in
        _menhir_goto_list_switch_case_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv585 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv581 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv579 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_switch_cond)), _startpos__1_inlined1_), _, (x : 'tv_list_switch_case_)) = _menhir_stack in
            let _3 = () in
            let _1_inlined1 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_switch_stmt = let _3 =
              let _1 = _1_inlined1 in
              
# 200 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x )
# 1641 "parser.ml"
              
            in
            
# 223 "parser.mly"
                                                           (let (c1,c2) = _2 in Switch(c1,c2,_3))
# 1647 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv577) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_switch_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv575) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_switch_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv573) = Obj.magic _menhir_stack in
            let (_endpos__1_ : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_switch_stmt) : 'tv_switch_stmt) = _v in
            let (_startpos__1_ : Lexing.position) = _startpos in
            ((let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_stmt = 
# 164 "parser.mly"
                (_1)
# 1672 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv574)) : 'freshtv576)) : 'freshtv578)) : 'freshtv580)) : 'freshtv582)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv583 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv584)) : 'freshtv586)
    | _ ->
        _menhir_fail ()

and _menhir_goto_for_conds : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_for_conds -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv567 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_conds) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBLOCK ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv568)

and _menhir_goto_expr5 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr5 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState198 | MenhirState184 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 | MenhirState155 | MenhirState157 | MenhirState159 | MenhirState136 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState107 | MenhirState7 | MenhirState13 | MenhirState63 | MenhirState60 | MenhirState57 | MenhirState54 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv559 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ANDXOR ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | BAND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | LSHIFT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | RSHIFT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | AND | BOR | COLON | COMMA | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | MINUS | NEQUAL | OR | PLUS | RPAREN | SEMI | XOR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv555 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr5), _startpos__1_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_expr4 = 
# 283 "parser.mly"
          (_1)
# 1733 "parser.ml"
             in
            _menhir_goto_expr4 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv556)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv557 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv558)) : 'freshtv560)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv565 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ANDXOR ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | BAND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | LSHIFT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | RSHIFT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | AND | BOR | COLON | COMMA | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | MINUS | NEQUAL | OR | PLUS | RPAREN | SEMI | XOR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv561 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr4), _startpos__1_), (_2 : 'tv_op_add)), _endpos__3_, _, (_3 : 'tv_expr5), _startpos__3_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr4 = 
# 282 "parser.mly"
                     (annot (Op2(_2,_1,_3)) _startpos__1_ _endpos__3_)
# 1772 "parser.ml"
             in
            _menhir_goto_expr4 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv562)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv563 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv564)) : 'freshtv566)
    | _ ->
        _menhir_fail ()

and _menhir_goto_function_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_function_decl -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv553) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_function_decl) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv551) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_function_decl) : 'tv_function_decl) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_toplevel_decl = 
# 77 "parser.mly"
                    (_1)
# 1804 "parser.ml"
     in
    _menhir_goto_toplevel_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv552)) : 'freshtv554)

and _menhir_goto_if_tail : _menhir_env -> 'ttv_tail -> Lexing.position -> 'tv_if_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv549 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_v : 'tv_if_tail) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv547 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos__4_ : Lexing.position) = _endpos in
    let ((_4 : 'tv_if_tail) : 'tv_if_tail) = _v in
    ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_if_cond)), _endpos__3_, _, (_3 : 'tv_block), _startpos__3_) = _menhir_stack in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__4_ in
    let _v : 'tv_if_head = 
# 210 "parser.mly"
                           (let (c1,c2) = _2 in (Case (c1,c2,_3))::_4)
# 1825 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv545) = _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_if_head) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((match _menhir_s with
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv533) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_if_head) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_if_head) : 'tv_if_head) = _v in
        let (_startpos__2_ : Lexing.position) = _startpos in
        ((let _1 = () in
        let _endpos = _endpos__2_ in
        let _v : 'tv_if_tail = 
# 217 "parser.mly"
                 (_2)
# 1852 "parser.ml"
         in
        _menhir_goto_if_tail _menhir_env _menhir_stack _endpos _v) : 'freshtv532)) : 'freshtv534)
    | MenhirState115 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv543) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_if_head) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv541) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_if_head) : 'tv_if_head) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_if_stmt = 
# 207 "parser.mly"
            (If _1)
# 1873 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv539) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_if_stmt) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv537) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_if_stmt) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv535) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_if_stmt) : 'tv_if_stmt) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_stmt = 
# 163 "parser.mly"
                (_1)
# 1898 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv536)) : 'freshtv538)) : 'freshtv540)) : 'freshtv542)) : 'freshtv544)
    | _ ->
        _menhir_fail ()) : 'freshtv546)) : 'freshtv548)) : 'freshtv550)

and _menhir_goto_switch_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_switch_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv529 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list)) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_switch_body) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv527 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list)) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_4 : 'tv_switch_body) : 'tv_switch_body) = _v in
    ((let ((_menhir_stack, _menhir_s), _endpos__2_, _, (_2 : 'tv_expr_list)) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_switch_case = 
# 234 "parser.mly"
                                   (let (b,ftm) = _4 in ((Case(Empty, _2, b)), ftm))
# 1920 "parser.ml"
     in
    _menhir_goto_switch_case _menhir_env _menhir_stack _menhir_s _v) : 'freshtv528)) : 'freshtv530)

and _menhir_reduce46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_SEMI_ = 
# 211 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( [] )
# 1929 "parser.ml"
     in
    _menhir_goto_list_SEMI_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run190 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | CASE | DEFAULT | RBLOCK ->
        _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190

and _menhir_goto_switch_case : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_switch_case -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv525 * _menhir_state * 'tv_switch_case) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CASE ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState193
    | DEFAULT ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState193
    | RBLOCK ->
        _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) MenhirState193
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState193) : 'freshtv526)

and _menhir_reduce48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_switch_case_ = 
# 211 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( [] )
# 1972 "parser.ml"
     in
    _menhir_goto_list_switch_case_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv521 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOLLIT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | BREAK ->
            _menhir_run166 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CONTINUE ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DEFER ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | FLOATLIT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FOR ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IF ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INTLIT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LBLOCK ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | MINUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINT ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINTLN ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMI ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | STRINGLIT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SWITCH ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CASE | DEFAULT | RBLOCK ->
            _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132) : 'freshtv522)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv523 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv524)

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState184 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState184 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState184 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState184 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState184 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState184 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184

and _menhir_goto_simple_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_simple_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv507 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv503 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138) : 'freshtv504)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv505 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv506)) : 'freshtv508)
    | MenhirState115 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv511 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv509 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_simple_stmt), _startpos__1_) = _menhir_stack in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_stmt = 
# 161 "parser.mly"
                (_1)
# 2135 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv510)) : 'freshtv512)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv519 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv513 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState198 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState198) : 'freshtv514)
        | LBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv515 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_simple_stmt), _startpos__1_) = _menhir_stack in
            let _v : 'tv_switch_cond = 
# 230 "parser.mly"
               ((_1,None))
# 2181 "parser.ml"
             in
            _menhir_goto_switch_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv516)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv517 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv518)) : 'freshtv520)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv491 * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv485 * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SEMI ->
                _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState157
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState157) : 'freshtv486)
        | LBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv487 * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_option_expr_)) = _menhir_stack in
            let _v : 'tv_for_conds = 
# 246 "parser.mly"
          ((None,_1,None))
# 2243 "parser.ml"
             in
            _menhir_goto_for_conds _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv489 * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv490)) : 'freshtv492)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv497 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv493 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LBLOCK ->
                _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState159
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv494)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv495 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv496)) : 'freshtv498)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv501 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv499 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_option_expr_)), _, (_3 : 'tv_option_expr_)), _, (_5 : 'tv_option_expr_)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_for_conds = 
# 247 "parser.mly"
                              ((_1,_3,_5))
# 2309 "parser.ml"
         in
        _menhir_goto_for_conds _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)) : 'freshtv502)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr_unary : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr_unary -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState198 | MenhirState186 | MenhirState184 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 | MenhirState155 | MenhirState157 | MenhirState159 | MenhirState136 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState107 | MenhirState7 | MenhirState13 | MenhirState63 | MenhirState60 | MenhirState57 | MenhirState54 | MenhirState45 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv479) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_unary) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_expr_unary) : 'tv_expr_unary) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_expr5 = 
# 294 "parser.mly"
               (_1)
# 2336 "parser.ml"
         in
        _menhir_goto_expr5 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv478)) : 'freshtv480)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv483 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) * 'tv_op_mul) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_unary) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv481 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) * 'tv_op_mul) = Obj.magic _menhir_stack in
        let (_endpos__3_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_expr_unary) : 'tv_expr_unary) = _v in
        let (_startpos__3_ : Lexing.position) = _startpos in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr5), _startpos__1_), (_2 : 'tv_op_mul)) = _menhir_stack in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : 'tv_expr5 = 
# 293 "parser.mly"
                          (annot (Op2(_2,_1,_3)) _startpos__1_ _endpos__3_)
# 2358 "parser.ml"
         in
        _menhir_goto_expr5 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv482)) : 'freshtv484)
    | _ ->
        _menhir_fail ()

and _menhir_goto_statements : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_statements -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv411 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv409 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_stmt), _startpos__1_), _, (_3 : 'tv_statements)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_statements = 
# 149 "parser.mly"
                         ((annot _1 _startpos__1_ _endpos__1_)::_3)
# 2378 "parser.ml"
         in
        _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv410)) : 'freshtv412)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv415 * _menhir_state * 'tv_eat_unimplemented)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv413 * _menhir_state * 'tv_eat_unimplemented)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_eat_unimplemented)), _, (_3 : 'tv_statements)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_statements = 
# 150 "parser.mly"
                                     (_3)
# 2391 "parser.ml"
         in
        _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv419 * _menhir_state) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv417 * _menhir_state) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_statements)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_statements = 
# 151 "parser.mly"
                   (_2)
# 2404 "parser.ml"
         in
        _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv418)) : 'freshtv420)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv423 * _menhir_state)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv421 * _menhir_state)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_statements)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_switch_case = 
# 235 "parser.mly"
                           (((Default(_3)), ENDBREAK))
# 2418 "parser.ml"
         in
        _menhir_goto_switch_case _menhir_env _menhir_stack _menhir_s _v) : 'freshtv422)) : 'freshtv424)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv431 * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FALLTHROUGH ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv425 * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMI ->
                _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState189
            | CASE | DEFAULT | RBLOCK ->
                _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState189
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState189) : 'freshtv426)
        | CASE | DEFAULT | RBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv427 * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_statements)) = _menhir_stack in
            let _v : 'tv_switch_body = 
# 239 "parser.mly"
                ((_1,ENDBREAK))
# 2448 "parser.ml"
             in
            _menhir_goto_switch_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv428)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv429 * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv430)) : 'freshtv432)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv475 * _menhir_state * Lexing.position) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv471 * _menhir_state * Lexing.position) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state * Lexing.position) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_statements)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_block = 
# 146 "parser.mly"
                                (_2)
# 2480 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv467) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_block) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
            match _menhir_s with
            | MenhirState144 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv439 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ELSE ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv433) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | IF ->
                        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | LBLOCK ->
                        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv434)
                | SEMI ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv435) = Obj.magic _menhir_stack in
                    ((let (_, _endpos) = Obj.magic _menhir_stack in
                    let _v : 'tv_if_tail = 
# 219 "parser.mly"
      ([])
# 2517 "parser.ml"
                     in
                    _menhir_goto_if_tail _menhir_env _menhir_stack _endpos _v) : 'freshtv436)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv437 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv438)) : 'freshtv440)
            | MenhirState146 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv443) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv441) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos__2_, _, (_2 : 'tv_block), _startpos__2_) = _menhir_stack in
                let _1 = () in
                let _endpos = _endpos__2_ in
                let _v : 'tv_if_tail = 
# 218 "parser.mly"
               ([Default _2])
# 2538 "parser.ml"
                 in
                _menhir_goto_if_tail _menhir_env _menhir_stack _endpos _v) : 'freshtv442)) : 'freshtv444)
            | MenhirState162 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv453 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_conds) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv451 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_conds) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_for_conds)), _endpos__3_, _, (_3 : 'tv_block), _startpos__3_) = _menhir_stack in
                let _1 = () in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__3_ in
                let _v : 'tv_for_stmt = 
# 243 "parser.mly"
                      (let (c1,c2,c3) = _2 in For(c1,c2,c3,_3))
# 2553 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv449) = _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_for_stmt) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv447) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_for_stmt) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv445) = Obj.magic _menhir_stack in
                let (_endpos__1_ : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_for_stmt) : 'tv_for_stmt) = _v in
                let (_startpos__1_ : Lexing.position) = _startpos in
                ((let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_stmt = 
# 165 "parser.mly"
                 (_1)
# 2578 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv446)) : 'freshtv448)) : 'freshtv450)) : 'freshtv452)) : 'freshtv454)
            | MenhirState115 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState170 | MenhirState179 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv457 * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv455 * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_block), _startpos__1_) = _menhir_stack in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_stmt = 
# 160 "parser.mly"
               (Block _1)
# 2592 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv456)) : 'freshtv458)
            | MenhirState203 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv461 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 2600 "parser.ml"
                ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_typ) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv459 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 2606 "parser.ml"
                ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_typ) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (((((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, (_2 : (
# 20 "parser.mly"
       (string)
# 2611 "parser.ml"
                )), _startpos__2_), (_3 : 'tv_signature)), _endpos__4_, _, (_4 : 'tv_typ)), _endpos__5_, _, (_5 : 'tv_block), _startpos__5_) = _menhir_stack in
                let _1 = () in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__5_ in
                let _v : 'tv_function_decl = 
# 110 "parser.mly"
                                     ([Func(_2, _3, _4, _5)])
# 2619 "parser.ml"
                 in
                _menhir_goto_function_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv460)) : 'freshtv462)
            | MenhirState114 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv465 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 2627 "parser.ml"
                ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv463 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 2633 "parser.ml"
                ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, (_2 : (
# 20 "parser.mly"
       (string)
# 2638 "parser.ml"
                )), _startpos__2_), (_3 : 'tv_signature)), _endpos__4_, _, (_4 : 'tv_block), _startpos__4_) = _menhir_stack in
                let _1 = () in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__4_ in
                let _v : 'tv_function_decl = 
# 109 "parser.mly"
                                 ([Func(_2, _3, `VOID, _4)])
# 2646 "parser.ml"
                 in
                _menhir_goto_function_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv464)) : 'freshtv466)
            | _ ->
                _menhir_fail ()) : 'freshtv468)) : 'freshtv470)) : 'freshtv472)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv473 * _menhir_state * Lexing.position) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv474)) : 'freshtv476)
    | _ ->
        _menhir_fail ()

and _menhir_goto_switch_cond : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_switch_cond -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv407 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBLOCK ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv403 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CASE ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | DEFAULT ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | RBLOCK ->
            _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130) : 'freshtv404)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv405 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)) : 'freshtv408)

and _menhir_goto_return_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_return_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv401) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_return_stmt) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_return_stmt) : 'tv_return_stmt) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_stmt = 
# 162 "parser.mly"
                (_1)
# 2714 "parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv400)) : 'freshtv402)

and _menhir_run118 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118

and _menhir_goto_incdec_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_incdec_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv397) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_incdec_stmt) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_incdec_stmt) : 'tv_incdec_stmt) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_simple_stmt = 
# 172 "parser.mly"
                (_1)
# 2768 "parser.ml"
     in
    _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv396)) : 'freshtv398)

and _menhir_goto_assign_op : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_assign_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv393 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 2779 "parser.ml"
    ) * Lexing.position) * _menhir_state * 'tv_assign_op) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127) : 'freshtv394)

and _menhir_reduce78 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_expr_ = 
# 114 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( None )
# 2814 "parser.ml"
     in
    _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv391 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOLLIT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | BREAK ->
            _menhir_run166 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CONTINUE ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DEFER ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | FLOATLIT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FOR ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IF ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INTLIT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LBLOCK ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | MINUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINT ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINTLN ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMI ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | STRINGLIT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState170 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SWITCH ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CASE | DEFAULT | FALLTHROUGH | RBLOCK ->
            _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv388)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv390)) : 'freshtv392)

and _menhir_goto_expr_sub : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr_sub -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    match _menhir_s with
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv381 * _menhir_state * 'tv_op_unary * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_sub) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv379 * _menhir_state * 'tv_op_unary * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_expr_sub) : 'tv_expr_sub) = _v in
        let (_startpos__2_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_op_unary), _startpos__1_) = _menhir_stack in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__2_ in
        let _v : 'tv_expr_unary = 
# 307 "parser.mly"
                     (annot (Op1(_1,_2)) _startpos__1_ _endpos__2_)
# 2912 "parser.ml"
         in
        _menhir_goto_expr_unary _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv380)) : 'freshtv382)
    | MenhirState115 | MenhirState116 | MenhirState198 | MenhirState186 | MenhirState184 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 | MenhirState155 | MenhirState157 | MenhirState159 | MenhirState136 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState107 | MenhirState7 | MenhirState13 | MenhirState63 | MenhirState60 | MenhirState57 | MenhirState54 | MenhirState45 | MenhirState38 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_sub) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_expr_sub) : 'tv_expr_sub) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_expr_unary = 
# 308 "parser.mly"
             (_1)
# 2933 "parser.ml"
         in
        _menhir_goto_expr_unary _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv384)) : 'freshtv386)
    | _ ->
        _menhir_fail ()

and _menhir_goto_toplevel_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_toplevel_decl -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv377 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FUNC ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState210 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TYPE ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState210 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | EOF ->
            _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState210) : 'freshtv374)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv375 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv376)) : 'freshtv378)

and _menhir_reduce103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_statements = 
# 152 "parser.mly"
      ([])
# 2980 "parser.ml"
     in
    _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v

and _menhir_run116 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINT ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINTLN ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LBLOCK ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState116 in
        ((let _v : 'tv_switch_cond = 
# 231 "parser.mly"
     ((Empty,None))
# 3021 "parser.ml"
         in
        _menhir_goto_switch_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116

and _menhir_run133 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | BREAK ->
        _menhir_run166 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CONTINUE ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DEFER ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LBLOCK ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINT ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINTLN ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SEMI ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SWITCH ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | VAR ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CASE | DEFAULT | FALLTHROUGH | RBLOCK ->
        _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133

and _menhir_run134 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv369 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_) = _menhir_stack in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_return_stmt = 
# 202 "parser.mly"
         (Return None)
# 3122 "parser.ml"
         in
        _menhir_goto_return_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv370)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134

and _menhir_run117 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState117 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117

and _menhir_run120 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState120 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120

and _menhir_run136 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINT ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINTLN ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136

and _menhir_run122 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 3194 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLASSIGN ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | COMMA ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | LPAREN ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState122 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MASSIGN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv355) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv353) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : 'tv_assign_op = 
# 189 "parser.mly"
          (`SUB)
# 3219 "parser.ml"
         in
        _menhir_goto_assign_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)) : 'freshtv356)
    | MINUSMINUS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv359 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3227 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv357 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3236 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 3243 "parser.ml"
        )), _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__2_ in
        let _v : 'tv_incdec_stmt = 
# 193 "parser.mly"
                   (IncDec(_1,`DEC))
# 3251 "parser.ml"
         in
        _menhir_goto_incdec_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv358)) : 'freshtv360)
    | PASSIGN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv363) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv361) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : 'tv_assign_op = 
# 188 "parser.mly"
          (`ADD)
# 3266 "parser.ml"
         in
        _menhir_goto_assign_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)) : 'freshtv364)
    | PLUSPLUS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3274 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3283 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 3290 "parser.ml"
        )), _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__2_ in
        let _v : 'tv_incdec_stmt = 
# 192 "parser.mly"
                 (IncDec(_1,`INC))
# 3298 "parser.ml"
         in
        _menhir_goto_incdec_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv366)) : 'freshtv368)
    | ASSIGN ->
        _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack)
    | AND | ANDXOR | BAND | BOR | DIV | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | LSHIFT | MINUS | MOD | NEQUAL | OR | PLUS | RSHIFT | SEMI | TIMES | XOR ->
        _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122

and _menhir_run155 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState155 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LBLOCK | SEMI ->
        _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState155
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155

and _menhir_run164 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv351) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_eat_unimplemented = 
# 156 "parser.mly"
         ()
# 3353 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv349) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_eat_unimplemented) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv347 * _menhir_state * 'tv_eat_unimplemented) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv343 * _menhir_state * 'tv_eat_unimplemented) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOLLIT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | BREAK ->
            _menhir_run166 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CONTINUE ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DEFER ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | FLOATLIT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FOR ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IF ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INTLIT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LBLOCK ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | MINUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINT ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINTLN ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMI ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | STRINGLIT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SWITCH ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CASE | DEFAULT | FALLTHROUGH | RBLOCK ->
            _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState179) : 'freshtv344)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv345 * _menhir_state * 'tv_eat_unimplemented) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv346)) : 'freshtv348)) : 'freshtv350)) : 'freshtv352)

and _menhir_run165 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv341) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_stmt = 
# 167 "parser.mly"
                 (Continue)
# 3443 "parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv342)

and _menhir_run166 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv339) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_stmt = 
# 166 "parser.mly"
               (Break)
# 3461 "parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv340)

and _menhir_goto_arguments : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_arguments -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv337 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3471 "parser.ml"
    ) * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_arguments) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv335 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3480 "parser.ml"
    ) * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos__2_ : Lexing.position) = _endpos in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_arguments) : 'tv_arguments) = _v in
    ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 3488 "parser.ml"
    )), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__2_ in
    let _v : 'tv_fun_call = 
# 326 "parser.mly"
                   (Call(_1,_2))
# 3495 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv333) = _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_fun_call) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv331) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_fun_call) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_fun_call) : 'tv_fun_call) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr_operand = 
# 323 "parser.mly"
             (_1)
# 3520 "parser.ml"
     in
    _menhir_goto_expr_operand _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv330)) : 'freshtv332)) : 'freshtv334)) : 'freshtv336)) : 'freshtv338)

and _menhir_goto_expr_operand : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr_operand -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_expr_operand) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_expr_operand) : 'tv_expr_operand) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr_sub = 
# 318 "parser.mly"
                 (annot _1 _startpos__1_ _endpos__1_)
# 3543 "parser.ml"
     in
    _menhir_goto_expr_sub _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv326)) : 'freshtv328)

and _menhir_goto_type_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_type_decl -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_decl) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_type_decl) : 'tv_type_decl) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_toplevel_decl = 
# 79 "parser.mly"
             (List.map (fun dcl -> Global dcl) _1)
# 3566 "parser.ml"
     in
    _menhir_goto_toplevel_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv322)) : 'freshtv324)

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv299 * _menhir_state)) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv297 * _menhir_state)) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _endpos__3_, _, (_3 : 'tv_typ)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _endpos = _endpos__3_ in
        let _v : 'tv_slice_literal = 
# 101 "parser.mly"
                          (Slice(_3))
# 3586 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_slice_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_slice_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_slice_literal) : 'tv_slice_literal) = _v in
        ((let _endpos = _endpos__1_ in
        let _v : 'tv_type_literal = 
# 94 "parser.mly"
                    (`TypeLit(_1))
# 3607 "parser.ml"
         in
        _menhir_goto_type_literal _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv292)) : 'freshtv294)) : 'freshtv296)) : 'freshtv298)) : 'freshtv300)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv309 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 3615 "parser.ml"
        ) * Lexing.position)) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv307 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 3621 "parser.ml"
        ) * Lexing.position)) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _endpos__2_, (_2 : (
# 22 "parser.mly"
       (int)
# 3626 "parser.ml"
        )), _startpos__2_), _endpos__4_, _, (_4 : 'tv_typ)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _endpos = _endpos__4_ in
        let _v : 'tv_array_literal = 
# 98 "parser.mly"
                                 (Array(_2, _4))
# 3634 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_array_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_array_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_array_literal) : 'tv_array_literal) = _v in
        ((let _endpos = _endpos__1_ in
        let _v : 'tv_type_literal = 
# 93 "parser.mly"
                    (`TypeLit(_1))
# 3655 "parser.ml"
         in
        _menhir_goto_type_literal _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv302)) : 'freshtv304)) : 'freshtv306)) : 'freshtv308)) : 'freshtv310)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv315 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv311 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RBLOCK | RPAREN ->
                _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99) : 'freshtv312)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv313 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)) : 'freshtv316)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv317 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3690 "parser.ml"
        ) * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RPAREN | SEMI ->
            _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101) : 'freshtv318)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv319 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 3708 "parser.ml"
        ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LBLOCK ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState203 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState203) : 'freshtv320)
    | _ ->
        _menhir_fail ()

and _menhir_run115 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | BREAK ->
        _menhir_run166 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CONTINUE ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DEFER ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LBLOCK ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINT ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINTLN ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SEMI ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SWITCH ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | VAR ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RBLOCK ->
        _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115

and _menhir_goto_type_literal : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_type_literal -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv289) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_literal) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv287) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_type_literal) : 'tv_type_literal) = _v in
    ((let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 90 "parser.mly"
                   (_1)
# 3795 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv288)) : 'freshtv290)

and _menhir_goto_separated_nonempty_list_COMMA_IDENT_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_IDENT_ -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    match _menhir_s with
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3807 "parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_IDENT_) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv269 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3816 "parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_COMMA_IDENT_) : 'tv_separated_nonempty_list_COMMA_IDENT_) = _v in
        let (_startpos_xs_ : Lexing.position) = _startpos in
        ((let ((_menhir_stack, _endpos_x_, _menhir_s, (x : (
# 20 "parser.mly"
       (string)
# 3824 "parser.ml"
        )), _startpos_x_), _) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos_x_ in
        let _v : 'tv_separated_nonempty_list_COMMA_IDENT_ = 
# 243 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 3831 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv270)) : 'freshtv272)
    | MenhirState115 | MenhirState116 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 | MenhirState136 | MenhirState111 | MenhirState99 | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_IDENT_) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_separated_nonempty_list_COMMA_IDENT_) : 'tv_separated_nonempty_list_COMMA_IDENT_) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _v : 'tv_identifier_list = 
# 181 "parser.mly"
                                       (_1)
# 3849 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_identifier_list) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
        match _menhir_s with
        | MenhirState111 | MenhirState99 | MenhirState74 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv273 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81
            | FLOAT ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81
            | IDENT _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81
            | LSQUARE ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | RUNE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81
            | STRING ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState81
            | STRUCT ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv274)
        | MenhirState115 | MenhirState116 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState179 | MenhirState170 | MenhirState136 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv279 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ASSIGN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv275 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOLLIT _v ->
                    _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | FLOATLIT _v ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IDENT _v ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | INTLIT _v ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | LPAREN ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | MINUS ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | NOT ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PLUS ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | STRINGLIT _v ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | XOR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv276)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv277 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)) : 'freshtv280)
        | _ ->
            _menhir_fail ()) : 'freshtv282)) : 'freshtv284)) : 'freshtv286)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_op_unary : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_op_unary -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv267 * _menhir_state * 'tv_op_unary * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState21 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState21 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState21 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState21 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState21 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState21 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv268)

and _menhir_reduce23 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3965 "parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 3971 "parser.ml"
    )), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr_operand = 
# 321 "parser.mly"
           (V _1)
# 3978 "parser.ml"
     in
    _menhir_goto_expr_operand _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run16 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState16 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState16 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState16 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState16 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState16 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState16 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv263 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _endpos = _endpos__2_ in
        let _v : 'tv_arguments = 
# 254 "parser.mly"
                  ([])
# 4021 "parser.ml"
         in
        _menhir_goto_arguments _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv264)) : 'freshtv266)
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState16 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_goto_literal : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_literal -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv261) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_literal) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv259) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_literal) : 'tv_literal) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr_operand = 
# 322 "parser.mly"
            (L _1)
# 4052 "parser.ml"
     in
    _menhir_goto_expr_operand _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv260)) : 'freshtv262)

and _menhir_goto_dist_type_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_dist_type_decl -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv245 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4065 "parser.ml"
        ) * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv243 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4071 "parser.ml"
        ) * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 4076 "parser.ml"
        )), _startpos__1_), _endpos__2_, _, (_2 : 'tv_typ)), _endpos__3_, _, (_3 : 'tv_dist_type_decl)) = _menhir_stack in
        let _endpos = _endpos__3_ in
        let _v : 'tv_dist_type_decl = 
# 140 "parser.mly"
                               ((Type(_1, _2))::_3)
# 4082 "parser.ml"
         in
        _menhir_goto_dist_type_decl _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv244)) : 'freshtv246)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv253 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv249 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv247 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let (((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos__2_, _, _startpos__2_), _endpos__3_, _, (_3 : 'tv_dist_type_decl)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__4_ in
            let _v : 'tv_type_decl = 
# 137 "parser.mly"
                                        (_3)
# 4108 "parser.ml"
             in
            _menhir_goto_type_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv248)) : 'freshtv250)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv251 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)) : 'freshtv254)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv257 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : 'tv_dist_type_decl)) = _menhir_stack in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__2_ in
        let _v : 'tv_type_decl = 
# 136 "parser.mly"
                          (_2)
# 4130 "parser.ml"
         in
        _menhir_goto_type_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv256)) : 'freshtv258)
    | _ ->
        _menhir_fail ()

and _menhir_run73 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBLOCK ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239 * _menhir_state) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENT _v ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RBLOCK ->
            _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74) : 'freshtv240)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)

and _menhir_run82 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv237) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 88 "parser.mly"
                (`STRING)
# 4178 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv238)

and _menhir_run83 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv235) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 87 "parser.mly"
                (`RUNE)
# 4194 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv236)

and _menhir_run84 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INTLIT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 22 "parser.mly"
       (int)
# 4211 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RSQUARE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv225 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 4223 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState96
            | FLOAT ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState96
            | IDENT _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState96 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState96
            | LSQUARE ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | RUNE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState96
            | STRING ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState96
            | STRUCT ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv226)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv227 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 4255 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)) : 'freshtv230)
    | RSQUARE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85
        | FLOAT ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85
        | IDENT _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85
        | LSQUARE ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | RUNE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85
        | STRING ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85
        | STRUCT ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv232)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)

and _menhir_run86 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 84 "parser.mly"
                (`INT)
# 4305 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv224)

and _menhir_run87 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 4312 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "parser.mly"
       (string)
# 4323 "parser.ml"
    )) : (
# 20 "parser.mly"
       (string)
# 4327 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 89 "parser.mly"
                (`Type(_1))
# 4334 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv222)

and _menhir_run88 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 85 "parser.mly"
                (`FLOAT64)
# 4350 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv220)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv217) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 86 "parser.mly"
                (`BOOL)
# 4366 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv218)

and _menhir_goto_signature_ids : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_signature_ids -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv199 * _menhir_state) * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv195 * _menhir_state) * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv193 * _menhir_state) * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let (((_menhir_stack, _menhir_s), _startpos__2_), _, (_3 : 'tv_signature_ids)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _endpos = _endpos__4_ in
            let _v : 'tv_struct_literal = 
# 104 "parser.mly"
                                         (Struct(_3))
# 4396 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv191) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_struct_literal) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv189) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_struct_literal) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv187) = Obj.magic _menhir_stack in
            let (_endpos__1_ : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_struct_literal) : 'tv_struct_literal) = _v in
            ((let _endpos = _endpos__1_ in
            let _v : 'tv_type_literal = 
# 95 "parser.mly"
                     (`TypeLit(_1))
# 4417 "parser.ml"
             in
            _menhir_goto_type_literal _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv188)) : 'freshtv190)) : 'freshtv192)) : 'freshtv194)) : 'freshtv196)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv197 * _menhir_state) * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)) : 'freshtv200)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv203 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv201 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_identifier_list), _startpos__1_), _endpos__2_, _, (_2 : 'tv_typ)), _, (_4 : 'tv_signature_ids)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_signature_ids = 
# 116 "parser.mly"
                                              ((List.map (fun id -> (id, _2)) _1) @ _4)
# 4437 "parser.ml"
         in
        _menhir_goto_signature_ids _menhir_env _menhir_stack _menhir_s _v) : 'freshtv202)) : 'freshtv204)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv215 * Lexing.position * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv211 * Lexing.position * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv209 * Lexing.position * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _endpos__1_, _startpos__1_), _, (_2 : 'tv_signature_ids)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_signature = 
# 113 "parser.mly"
                               (_2)
# 4460 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv207) = _menhir_stack in
            let (_v : 'tv_signature) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv205 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 4470 "parser.ml"
            ) * Lexing.position) * 'tv_signature) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | FLOAT ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | IDENT _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | LBLOCK ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LSQUARE ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | RUNE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | STRING ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | STRUCT ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv206)) : 'freshtv208)) : 'freshtv210)) : 'freshtv212)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv213 * Lexing.position * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)) : 'freshtv216)
    | _ ->
        _menhir_fail ()

and _menhir_reduce85 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4510 "parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos_x_, _menhir_s, (x : (
# 20 "parser.mly"
       (string)
# 4516 "parser.ml"
    )), _startpos_x_) = _menhir_stack in
    let _startpos = _startpos_x_ in
    let _v : 'tv_separated_nonempty_list_COMMA_IDENT_ = 
# 241 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 4522 "parser.ml"
     in
    _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_run76 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4529 "parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76

and _menhir_goto_toplevel : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_toplevel -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv171 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position)) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position)) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_toplevel_decl), _startpos__1_), _, (_3 : 'tv_toplevel)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_toplevel = 
# 73 "parser.mly"
                                  ( (List.map (fun dcl -> annot dcl _startpos__1_ _endpos__1_) _1) @ _3 )
# 4557 "parser.ml"
         in
        _menhir_goto_toplevel _menhir_env _menhir_stack _menhir_s _v) : 'freshtv170)) : 'freshtv172)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * 'tv_package) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv181 * 'tv_package) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv179 * 'tv_package) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : 'tv_package)), _, (_2 : 'tv_toplevel)) = _menhir_stack in
            let _3 = () in
            let _v : (
# 64 "parser.mly"
      (Golite.ast)
# 4576 "parser.ml"
            ) = 
# 67 "parser.mly"
                           (Program(_1,_2))
# 4580 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv177) = _menhir_stack in
            let (_v : (
# 64 "parser.mly"
      (Golite.ast)
# 4587 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv175) = Obj.magic _menhir_stack in
            let (_v : (
# 64 "parser.mly"
      (Golite.ast)
# 4594 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv173) = Obj.magic _menhir_stack in
            let ((_1 : (
# 64 "parser.mly"
      (Golite.ast)
# 4601 "parser.ml"
            )) : (
# 64 "parser.mly"
      (Golite.ast)
# 4605 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv174)) : 'freshtv176)) : 'freshtv178)) : 'freshtv180)) : 'freshtv182)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv183 * 'tv_package) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)) : 'freshtv186)
    | _ ->
        _menhir_fail ()

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_op_unary = 
# 313 "parser.mly"
        (`BNOT)
# 4630 "parser.ml"
     in
    _menhir_goto_op_unary _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv168)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 21 "parser.mly"
       (string)
# 4637 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv165) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 21 "parser.mly"
       (string)
# 4648 "parser.ml"
    )) : (
# 21 "parser.mly"
       (string)
# 4652 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_literal = 
# 330 "parser.mly"
              (String _1)
# 4660 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv166)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv163) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_op_unary = 
# 311 "parser.mly"
         (`POS)
# 4676 "parser.ml"
     in
    _menhir_goto_op_unary _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv164)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_op_unary = 
# 314 "parser.mly"
        (`NOT)
# 4692 "parser.ml"
     in
    _menhir_goto_op_unary _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv162)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv159) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_op_unary = 
# 312 "parser.mly"
          (`NEG)
# 4708 "parser.ml"
     in
    _menhir_goto_op_unary _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv160)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run14 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 4746 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv157) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 22 "parser.mly"
       (int)
# 4757 "parser.ml"
    )) : (
# 22 "parser.mly"
       (int)
# 4761 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_literal = 
# 332 "parser.mly"
           (Int _1)
# 4769 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv158)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 4776 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState15 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | AND | ANDXOR | BAND | BOR | COLON | COMMA | DIV | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | LSHIFT | MINUS | MOD | NEQUAL | OR | PLUS | RPAREN | RSHIFT | SEMI | TIMES | XOR ->
        _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run18 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 23 "parser.mly"
       (float)
# 4795 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv155) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 23 "parser.mly"
       (float)
# 4806 "parser.ml"
    )) : (
# 23 "parser.mly"
       (float)
# 4810 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_literal = 
# 333 "parser.mly"
             (Float64 _1)
# 4818 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv156)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 24 "parser.mly"
       (bool)
# 4825 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv153) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 24 "parser.mly"
       (bool)
# 4836 "parser.ml"
    )) : (
# 24 "parser.mly"
       (bool)
# 4840 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_literal = 
# 331 "parser.mly"
            (Bool _1)
# 4848 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv154)

and _menhir_reduce9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_, _endpos) = Obj.magic _menhir_stack in
    let _v : 'tv_dist_type_decl = 
# 141 "parser.mly"
      ( [] )
# 4858 "parser.ml"
     in
    _menhir_goto_dist_type_decl _menhir_env _menhir_stack _endpos _menhir_s _v

and _menhir_run72 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 4865 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72
    | FLOAT ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72
    | IDENT _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72
    | LSQUARE ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | RUNE ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72
    | STRING ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72
    | STRUCT ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72

and _menhir_run107 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4896 "parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107

and _menhir_reduce92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_signature_ids = 
# 117 "parser.mly"
      ( [] )
# 4933 "parser.ml"
     in
    _menhir_goto_signature_ids _menhir_env _menhir_stack _menhir_s _v

and _menhir_run75 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 4940 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | ASSIGN | BOOL | FLOAT | IDENT _ | INT | LSQUARE | RUNE | STRING | STRUCT ->
        _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 4969 "parser.ml"
        ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv43 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state * 'tv_switch_case) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state * 'tv_statements)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * 'tv_eat_unimplemented)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_conds) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv61 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * 'tv_option_expr_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * 'tv_identifier_list * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv70)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv73 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv81 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5082 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_assign_op) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5091 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv99 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5125 "parser.ml"
        ) * Lexing.position) * 'tv_signature) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * Lexing.position * Lexing.position) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv102)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5138 "parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5147 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5156 "parser.ml"
        ) * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv109 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv111 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 5170 "parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv113 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5189 "parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5198 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv121 * _menhir_state) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5212 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv131 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv139 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) * 'tv_op_mul) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * 'tv_op_unary * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5271 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv149 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5285 "parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * 'tv_package) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv152)

and _menhir_reduce124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_toplevel = 
# 74 "parser.mly"
      ( [] )
# 5299 "parser.ml"
     in
    _menhir_goto_toplevel _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 20 "parser.mly"
       (string)
# 5316 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ASSIGN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv31 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5328 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState7 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState7 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState7 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState7 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState7 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState7 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7) : 'freshtv32)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv33 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5364 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)) : 'freshtv36)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)

and _menhir_run70 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState70 in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState71 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RPAREN ->
            _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv30)
    | SEMI ->
        _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_run106 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 5412 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLASSIGN ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106

and _menhir_run109 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 20 "parser.mly"
       (string)
# 5439 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _endpos, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState111 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RPAREN ->
                _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv22)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv23 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5470 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)) : 'freshtv26)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)

and _menhir_discard : _menhir_env -> _menhir_env =
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

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 64 "parser.mly"
      (Golite.ast)
# 5497 "parser.ml"
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
    let (_menhir_stack : 'freshtv19) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PACKAGE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENT _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let (_v : (
# 20 "parser.mly"
       (string)
# 5529 "parser.ml"
            )) = _v in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMI ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv7) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5541 "parser.ml"
                ) * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv5) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5548 "parser.ml"
                ) * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos__2_, (_2 : (
# 20 "parser.mly"
       (string)
# 5553 "parser.ml"
                )), _startpos__2_) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_package = 
# 70 "parser.mly"
                            (Package _2)
# 5560 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv3) = _menhir_stack in
                let (_v : 'tv_package) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1 * 'tv_package) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | FUNC ->
                    _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IDENT _v ->
                    _menhir_run106 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState4 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TYPE ->
                    _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState4 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | VAR ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | EOF ->
                    _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState4
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4) : 'freshtv2)) : 'freshtv4)) : 'freshtv6)) : 'freshtv8)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv9) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5592 "parser.ml"
                ) * Lexing.position) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv10)) : 'freshtv12)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv14)) : 'freshtv16)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv18)) : 'freshtv20))

# 269 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
  

# 5611 "parser.ml"
