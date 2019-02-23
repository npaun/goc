
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
  | MenhirState212
  | MenhirState205
  | MenhirState200
  | MenhirState195
  | MenhirState192
  | MenhirState191
  | MenhirState188
  | MenhirState186
  | MenhirState181
  | MenhirState172
  | MenhirState164
  | MenhirState161
  | MenhirState159
  | MenhirState157
  | MenhirState153
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
  | MenhirState104
  | MenhirState103
  | MenhirState102
  | MenhirState101
  | MenhirState99
  | MenhirState91
  | MenhirState88
  | MenhirState85
  | MenhirState82
  | MenhirState73
  | MenhirState66
  | MenhirState49
  | MenhirState44
  | MenhirState43
  | MenhirState41
  | MenhirState35
  | MenhirState33
  | MenhirState30
  | MenhirState19
  | MenhirState15
  | MenhirState12
  | MenhirState10
  | MenhirState7
  | MenhirState6
  | MenhirState5
  | MenhirState4

# 1 "parser.mly"
  
open Golite
open Lexing

let annot node startpos endpos =
	let pos_tuple pos = 
		(pos.pos_lnum, pos.pos_cnum - pos.pos_bol)
	in
	{ v = node; _start = pos_tuple startpos; _end = pos_tuple endpos; _debug = "Hi!"; _derived = None}  

# 208 "parser.ml"

let rec _menhir_goto_print_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_print_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv831) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_print_stmt) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv829) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_print_stmt) : 'tv_print_stmt) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_simple_stmt = 
# 176 "parser.mly"
               (_1)
# 229 "parser.ml"
     in
    _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv830)) : 'freshtv832)

and _menhir_reduce98 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_simple_stmt = 
# 177 "parser.mly"
              (Expr _1)
# 241 "parser.ml"
     in
    _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_if_cond : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_if_cond -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv827 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBLOCK ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv828)

and _menhir_goto_separated_nonempty_list_COMMA_expr_ : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    match _menhir_s with
    | MenhirState186 | MenhirState153 | MenhirState151 | MenhirState118 | MenhirState99 | MenhirState35 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv821) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv819) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_separated_nonempty_list_COMMA_expr_) : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let _endpos = _endpos__1_ in
        let _v : 'tv_expr_list = 
# 258 "parser.mly"
                                               (_1)
# 278 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv817) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_list) = _v in
        ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState118 | MenhirState44 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv777 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | RPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv773 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv771 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                let (_endpos__3_ : Lexing.position) = _endpos in
                ((let ((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos_x_, _, (x : 'tv_expr_list)) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _endpos = _endpos__3_ in
                let _v : 'tv_mandatory_arguments = let _1 = 
# 200 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x )
# 308 "parser.ml"
                 in
                
# 254 "parser.mly"
                                                        (_1)
# 313 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv769) = _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_mandatory_arguments) = _v in
                ((match _menhir_s with
                | MenhirState122 | MenhirState43 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv759) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _endpos in
                    let (_menhir_s : _menhir_state) = _menhir_s in
                    let (_v : 'tv_mandatory_arguments) = _v in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv757) = Obj.magic _menhir_stack in
                    let (_endpos__1_ : Lexing.position) = _endpos in
                    let (_menhir_s : _menhir_state) = _menhir_s in
                    let ((_1 : 'tv_mandatory_arguments) : 'tv_mandatory_arguments) = _v in
                    ((let _endpos = _endpos__1_ in
                    let _v : 'tv_arguments = 
# 256 "parser.mly"
                       (_1)
# 336 "parser.ml"
                     in
                    _menhir_goto_arguments _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv758)) : 'freshtv760)
                | MenhirState117 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv763 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos : Lexing.position) = _endpos in
                    let (_menhir_s : _menhir_state) = _menhir_s in
                    let (_v : 'tv_mandatory_arguments) = _v in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv761 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
                    let (_endpos__2_ : Lexing.position) = _endpos in
                    let (_ : _menhir_state) = _menhir_s in
                    let ((_2 : 'tv_mandatory_arguments) : 'tv_mandatory_arguments) = _v in
                    ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                    let _1 = () in
                    let _startpos = _startpos__1_ in
                    let _endpos = _endpos__2_ in
                    let _v : 'tv_print_stmt = 
# 201 "parser.mly"
                              (Print(true, _2))
# 357 "parser.ml"
                     in
                    _menhir_goto_print_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv762)) : 'freshtv764)
                | MenhirState120 ->
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
# 200 "parser.mly"
                            (Print(false, _2))
# 378 "parser.ml"
                     in
                    _menhir_goto_print_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv766)) : 'freshtv768)
                | _ ->
                    _menhir_fail ()) : 'freshtv770)) : 'freshtv772)) : 'freshtv774)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv775 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv776)) : 'freshtv778)
        | MenhirState35 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv781 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv779 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_identifier_list), _startpos__2_), _), _endpos__4_, _, (_4 : 'tv_expr_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__4_ in
            let _v : 'tv_typed_var_decl = 
# 134 "parser.mly"
                                            (List.map2 (fun id expr -> Var(id, `AUTO, Some expr)) _2 _4)
# 403 "parser.ml"
             in
            _menhir_goto_typed_var_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv780)) : 'freshtv782)
        | MenhirState99 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv785 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ)) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv783 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ)) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_identifier_list), _startpos__2_), _endpos__3_, _, (_3 : 'tv_typ)), _endpos__5_, _, (_5 : 'tv_expr_list)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__5_ in
            let _v : 'tv_typed_var_decl = 
# 133 "parser.mly"
                                            (List.map2 (fun id expr -> Var(id, _3, Some expr)) _2 _5)
# 419 "parser.ml"
             in
            _menhir_goto_typed_var_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv784)) : 'freshtv786)
        | MenhirState151 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv799 * _menhir_state * 'tv_identifier_list * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv797 * _menhir_state * 'tv_identifier_list * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_identifier_list), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr_list)) = _menhir_stack in
            let _2 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_short_var_decl = 
# 128 "parser.mly"
                                       (List.map2 (fun id expr -> Var(id, `AUTO, Some expr)) _1 _3)
# 434 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv795) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_short_var_decl) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((match _menhir_s with
            | MenhirState115 | MenhirState116 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 | MenhirState136 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv789) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_short_var_decl) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv787) = Obj.magic _menhir_stack in
                let (_endpos__1_ : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_short_var_decl) : 'tv_short_var_decl) = _v in
                let (_startpos__1_ : Lexing.position) = _startpos in
                ((let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_simple_stmt = 
# 172 "parser.mly"
                  (List.map (fun decl -> Decl decl) _1)
# 461 "parser.ml"
                 in
                _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv788)) : 'freshtv790)
            | MenhirState4 | MenhirState212 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv793) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_short_var_decl) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv791) = Obj.magic _menhir_stack in
                let (_endpos__1_ : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_short_var_decl) : 'tv_short_var_decl) = _v in
                let (_startpos__1_ : Lexing.position) = _startpos in
                ((let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_var_decl = 
# 123 "parser.mly"
                     (_1)
# 482 "parser.ml"
                 in
                _menhir_goto_var_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv792)) : 'freshtv794)
            | _ ->
                _menhir_fail ()) : 'freshtv796)) : 'freshtv798)) : 'freshtv800)
        | MenhirState153 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv809 * _menhir_state * 'tv_identifier_list * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv807 * _menhir_state * 'tv_identifier_list * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_identifier_list), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr_list)) = _menhir_stack in
            let _2 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_assign_stmt = 
# 181 "parser.mly"
                                   (Assign(_1,_3))
# 499 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv805) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_assign_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv803) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_assign_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv801) = Obj.magic _menhir_stack in
            let (_endpos__1_ : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_assign_stmt) : 'tv_assign_stmt) = _v in
            let (_startpos__1_ : Lexing.position) = _startpos in
            ((let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_simple_stmt = 
# 173 "parser.mly"
                (_1)
# 524 "parser.ml"
             in
            _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv802)) : 'freshtv804)) : 'freshtv806)) : 'freshtv808)) : 'freshtv810)
        | MenhirState186 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv815 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv811 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOLLIT _v ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | BREAK ->
                    _menhir_run168 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | CONTINUE ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | DEFER ->
                    _menhir_run166 _menhir_env (Obj.magic _menhir_stack) MenhirState188
                | FLOATLIT _v ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | FOR ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IDENT _v ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IF ->
                    _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | INTLIT _v ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | LBLOCK ->
                    _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | LPAREN ->
                    _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | MINUS ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | NOT ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PLUS ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PRINT ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PRINTLN ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | RETURN ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | SEMI ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState188
                | STRINGLIT _v ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | SWITCH ->
                    _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | VAR ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | XOR ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | CASE | DEFAULT | FALLTHROUGH | RBLOCK ->
                    _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState188
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188) : 'freshtv812)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv813 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv814)) : 'freshtv816)
        | _ ->
            _menhir_fail ()) : 'freshtv818)) : 'freshtv820)) : 'freshtv822)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv825 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv823 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos_xs_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_COMMA_expr_) : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
        let _2 = () in
        let _endpos = _endpos_xs_ in
        let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 243 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 615 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv824)) : 'freshtv826)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr1 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr1 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv755 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | OR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv695 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOLLIT _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FLOATLIT _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INTLIT _v ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | MINUS ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRINGLIT _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv696)
    | COLON | COMMA | LBLOCK | RPAREN | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv751 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr1), _startpos__1_) = _menhir_stack in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_expr = 
# 261 "parser.mly"
            (_1)
# 668 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv749) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
        match _menhir_s with
        | MenhirState186 | MenhirState153 | MenhirState151 | MenhirState118 | MenhirState99 | MenhirState35 | MenhirState91 | MenhirState44 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv703 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COMMA ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv697 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOLLIT _v ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | FLOATLIT _v ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IDENT _v ->
                    _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | INTLIT _v ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | LPAREN ->
                    _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | MINUS ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | NOT ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PLUS ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | STRINGLIT _v ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | XOR ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv698)
            | COLON | LBLOCK | RPAREN | SEMI ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv699 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
                let _endpos = _endpos_x_ in
                let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 241 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 722 "parser.ml"
                 in
                _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv700)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv701 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv702)) : 'freshtv704)
        | MenhirState41 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv711 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | RPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv707 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv705 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                let (_endpos__3_ : Lexing.position) = _endpos in
                ((let ((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : 'tv_expr), _startpos__2_) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__3_ in
                let _v : 'tv_expr_sub = 
# 320 "parser.mly"
                      (_2)
# 754 "parser.ml"
                 in
                _menhir_goto_expr_sub _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv706)) : 'freshtv708)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv709 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv710)) : 'freshtv712)
        | MenhirState127 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv721 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 769 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_assign_op) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv719 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 775 "parser.ml"
            ) * Lexing.position) * _menhir_state * 'tv_assign_op) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 780 "parser.ml"
            )), _startpos__1_), _, (_2 : 'tv_assign_op)), _endpos__3_, _, (_3 : 'tv_expr), _startpos__3_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_op_assign_stmt = 
# 187 "parser.mly"
                       (OpAssign(_1,_2,_3))
# 787 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv717) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_op_assign_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv715) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_op_assign_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv713) = Obj.magic _menhir_stack in
            let (_endpos__1_ : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_op_assign_stmt) : 'tv_op_assign_stmt) = _v in
            let (_startpos__1_ : Lexing.position) = _startpos in
            ((let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_simple_stmt = 
# 174 "parser.mly"
                  (_1)
# 812 "parser.ml"
             in
            _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv714)) : 'freshtv716)) : 'freshtv718)) : 'freshtv720)) : 'freshtv722)
        | MenhirState134 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv725 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv723 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : 'tv_expr), _startpos__2_) = _menhir_stack in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__2_ in
            let _v : 'tv_return_stmt = 
# 206 "parser.mly"
              (Return (Some _2))
# 827 "parser.ml"
             in
            _menhir_goto_return_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv724)) : 'freshtv726)
        | MenhirState138 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv729 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv727 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_simple_stmt), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr), _startpos__3_) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_if_cond = 
# 216 "parser.mly"
                         ((_1, [_3]))
# 840 "parser.ml"
             in
            _menhir_goto_if_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv728)) : 'freshtv730)
        | MenhirState136 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv735 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMI ->
                _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack)
            | LBLOCK ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv731 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr), _startpos__1_) = _menhir_stack in
                let _v : 'tv_if_cond = 
# 217 "parser.mly"
          ((Empty, [_1]))
# 858 "parser.ml"
                 in
                _menhir_goto_if_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv733 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv734)) : 'freshtv736)
        | MenhirState157 | MenhirState159 | MenhirState161 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv739 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv737 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos_x_, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
            let _v : 'tv_option_expr_ = 
# 116 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( Some x )
# 877 "parser.ml"
             in
            _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv738)) : 'freshtv740)
        | MenhirState115 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv741 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            (_menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) : 'freshtv742)
        | MenhirState200 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv745 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv743 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_simple_stmt), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr), _startpos__3_) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_switch_cond = 
# 232 "parser.mly"
                        ((_1,Some _3))
# 894 "parser.ml"
             in
            _menhir_goto_switch_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv744)) : 'freshtv746)
        | MenhirState116 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv747 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            (_menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) : 'freshtv748)
        | _ ->
            _menhir_fail ()) : 'freshtv750)) : 'freshtv752)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv753 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv754)) : 'freshtv756)

and _menhir_run85 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_goto_op_rel : _menhir_env -> 'ttv_tail -> 'tv_op_rel -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv693 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv694)

and _menhir_goto_expr2 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr2 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState200 | MenhirState186 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 | MenhirState157 | MenhirState159 | MenhirState161 | MenhirState136 | MenhirState153 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState99 | MenhirState35 | MenhirState41 | MenhirState91 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv685 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | LBLOCK | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv681 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr2), _startpos__1_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_expr1 = 
# 265 "parser.mly"
          (_1)
# 995 "parser.ml"
             in
            _menhir_goto_expr1 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv682)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv683 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv684)) : 'freshtv686)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv691 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | LBLOCK | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv687 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr1), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr2), _startpos__3_) = _menhir_stack in
            let _2 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr1 = 
# 264 "parser.mly"
                 (annot (Op2(`OR, _1, _3)) _startpos__1_ _endpos__3_)
# 1023 "parser.ml"
             in
            _menhir_goto_expr1 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv688)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv689 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv690)) : 'freshtv692)
    | _ ->
        _menhir_fail ()

and _menhir_run76 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv679) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 277 "parser.mly"
          (`NEQ)
# 1045 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv680)

and _menhir_run77 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv677) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 278 "parser.mly"
          (`LT)
# 1058 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv678)

and _menhir_run78 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv675) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 280 "parser.mly"
        (`LEQ)
# 1071 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv676)

and _menhir_run79 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv673) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 279 "parser.mly"
           (`GT)
# 1084 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv674)

and _menhir_run80 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv671) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 281 "parser.mly"
        (`GEQ)
# 1097 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv672)

and _menhir_run81 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv669) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_rel = 
# 276 "parser.mly"
          (`EQ)
# 1110 "parser.ml"
     in
    _menhir_goto_op_rel _menhir_env _menhir_stack _v) : 'freshtv670)

and _menhir_goto_op_add : _menhir_env -> 'ttv_tail -> 'tv_op_add -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv667 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState73 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState73 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState73 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState73 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState73 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState73 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv668)

and _menhir_goto_expr3 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr3 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState200 | MenhirState186 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 | MenhirState157 | MenhirState159 | MenhirState161 | MenhirState136 | MenhirState153 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState99 | MenhirState35 | MenhirState41 | MenhirState91 | MenhirState88 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv659 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | GREATER ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | LESSER ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | NEQUAL ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | AND | COLON | COMMA | LBLOCK | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv655 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr3), _startpos__1_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_expr2 = 
# 269 "parser.mly"
          (_1)
# 1178 "parser.ml"
             in
            _menhir_goto_expr2 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv656)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv657 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv658)) : 'freshtv660)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv665 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | GREATER ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | LESSER ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | NEQUAL ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | AND | COLON | COMMA | LBLOCK | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv661 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr2), _startpos__1_), _endpos__3_, _, (_3 : 'tv_expr3), _startpos__3_) = _menhir_stack in
            let _2 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr2 = 
# 268 "parser.mly"
                   (annot (Op2(`AND,_1,_3)) _startpos__1_ _endpos__3_)
# 1216 "parser.ml"
             in
            _menhir_goto_expr2 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv662)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv663 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position)) * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv664)) : 'freshtv666)
    | _ ->
        _menhir_fail ()

and _menhir_run69 : _menhir_env -> 'ttv_tail -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv653) = Obj.magic _menhir_stack in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _v : 'tv_op_add = 
# 292 "parser.mly"
        (`BXOR)
# 1239 "parser.ml"
     in
    _menhir_goto_op_add _menhir_env _menhir_stack _v) : 'freshtv654)

and _menhir_run70 : _menhir_env -> 'ttv_tail -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv651) = Obj.magic _menhir_stack in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _v : 'tv_op_add = 
# 289 "parser.mly"
         (`ADD)
# 1253 "parser.ml"
     in
    _menhir_goto_op_add _menhir_env _menhir_stack _v) : 'freshtv652)

and _menhir_run71 : _menhir_env -> 'ttv_tail -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv649) = Obj.magic _menhir_stack in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _v : 'tv_op_add = 
# 290 "parser.mly"
          (`SUB)
# 1267 "parser.ml"
     in
    _menhir_goto_op_add _menhir_env _menhir_stack _v) : 'freshtv650)

and _menhir_run72 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv647) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_add = 
# 291 "parser.mly"
        (`BOR)
# 1280 "parser.ml"
     in
    _menhir_goto_op_add _menhir_env _menhir_stack _v) : 'freshtv648)

and _menhir_goto_op_mul : _menhir_env -> 'ttv_tail -> 'tv_op_mul -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv645 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) * 'tv_op_mul) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv646)

and _menhir_goto_expr4 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr4 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState200 | MenhirState186 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 | MenhirState157 | MenhirState159 | MenhirState161 | MenhirState136 | MenhirState153 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState99 | MenhirState35 | MenhirState41 | MenhirState91 | MenhirState88 | MenhirState85 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv637 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOR ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COLON | COMMA | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | NEQUAL | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv633 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr4), _startpos__1_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_expr3 = 
# 273 "parser.mly"
          (_1)
# 1344 "parser.ml"
             in
            _menhir_goto_expr3 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv634)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv635 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv636)) : 'freshtv638)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv643 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOR ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AND | COLON | COMMA | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | NEQUAL | OR | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv639 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr3), _startpos__1_), (_2 : 'tv_op_rel)), _endpos__3_, _, (_3 : 'tv_expr4), _startpos__3_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr3 = 
# 272 "parser.mly"
                     (annot (Op2(_2,_1,_3)) _startpos__1_ _endpos__3_)
# 1377 "parser.ml"
             in
            _menhir_goto_expr3 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv640)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv641 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv642)) : 'freshtv644)
    | _ ->
        _menhir_fail ()

and _menhir_run59 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv631) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 300 "parser.mly"
          (`MUL)
# 1399 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv632)

and _menhir_run60 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv629) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 304 "parser.mly"
          (`SR)
# 1412 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv630)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv627) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 302 "parser.mly"
        (`MOD)
# 1425 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv628)

and _menhir_run62 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv625) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 303 "parser.mly"
          (`SL)
# 1438 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv626)

and _menhir_run63 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv623) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 301 "parser.mly"
        (`DIV)
# 1451 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv624)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv621) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 305 "parser.mly"
         (`BAND)
# 1464 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv622)

and _menhir_run65 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv619) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_op_mul = 
# 306 "parser.mly"
          (`BANDNOT)
# 1477 "parser.ml"
     in
    _menhir_goto_op_mul _menhir_env _menhir_stack _v) : 'freshtv620)

and _menhir_goto_expr5 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr5 -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState200 | MenhirState186 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 | MenhirState157 | MenhirState159 | MenhirState161 | MenhirState136 | MenhirState153 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState99 | MenhirState35 | MenhirState41 | MenhirState91 | MenhirState88 | MenhirState85 | MenhirState82 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv611 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ANDXOR ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | BAND ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LSHIFT ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | RSHIFT ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | AND | BOR | COLON | COMMA | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | MINUS | NEQUAL | OR | PLUS | RPAREN | SEMI | XOR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv607 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr5), _startpos__1_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_expr4 = 
# 286 "parser.mly"
          (_1)
# 1514 "parser.ml"
             in
            _menhir_goto_expr4 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv608)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv609 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv610)) : 'freshtv612)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv617 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ANDXOR ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | BAND ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LSHIFT ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | RSHIFT ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | AND | BOR | COLON | COMMA | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | MINUS | NEQUAL | OR | PLUS | RPAREN | SEMI | XOR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv613 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr4), _startpos__1_), (_2 : 'tv_op_add)), _endpos__3_, _, (_3 : 'tv_expr5), _startpos__3_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_expr4 = 
# 285 "parser.mly"
                     (annot (Op2(_2,_1,_3)) _startpos__1_ _endpos__3_)
# 1553 "parser.ml"
             in
            _menhir_goto_expr4 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv614)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv615 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv616)) : 'freshtv618)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr_unary : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr_unary -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    match _menhir_s with
    | MenhirState115 | MenhirState116 | MenhirState200 | MenhirState188 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 | MenhirState157 | MenhirState159 | MenhirState161 | MenhirState136 | MenhirState153 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState99 | MenhirState35 | MenhirState41 | MenhirState91 | MenhirState88 | MenhirState85 | MenhirState82 | MenhirState73 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv601) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_unary) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv599) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_expr_unary) : 'tv_expr_unary) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_expr5 = 
# 297 "parser.mly"
               (_1)
# 1587 "parser.ml"
         in
        _menhir_goto_expr5 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv600)) : 'freshtv602)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv605 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) * 'tv_op_mul) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_unary) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv603 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) * 'tv_op_mul) = Obj.magic _menhir_stack in
        let (_endpos__3_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_expr_unary) : 'tv_expr_unary) = _v in
        let (_startpos__3_ : Lexing.position) = _startpos in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_expr5), _startpos__1_), (_2 : 'tv_op_mul)) = _menhir_stack in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : 'tv_expr5 = 
# 296 "parser.mly"
                          (annot (Op2(_2,_1,_3)) _startpos__1_ _endpos__3_)
# 1609 "parser.ml"
         in
        _menhir_goto_expr5 _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv604)) : 'freshtv606)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_SEMI_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_SEMI_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv593 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_list_SEMI_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv591 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_list_SEMI_) : 'tv_list_SEMI_) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let x = () in
        let _v : 'tv_list_SEMI_ = 
# 213 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1632 "parser.ml"
         in
        _menhir_goto_list_SEMI_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv592)) : 'freshtv594)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv597 * _menhir_state * 'tv_statements)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_list_SEMI_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv595 * _menhir_state * 'tv_statements)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_list_SEMI_) : 'tv_list_SEMI_) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_statements)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_switch_body = 
# 241 "parser.mly"
                               ((_1,FALLTHROUGH))
# 1649 "parser.ml"
         in
        _menhir_goto_switch_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv596)) : 'freshtv598)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_switch_case_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_switch_case_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv575 * _menhir_state * 'tv_switch_case) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv573 * _menhir_state * 'tv_switch_case) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_switch_case)), _, (xs : 'tv_list_switch_case_)) = _menhir_stack in
        let _v : 'tv_list_switch_case_ = 
# 213 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1668 "parser.ml"
         in
        _menhir_goto_list_switch_case_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv574)) : 'freshtv576)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv589 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv585 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv583 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
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
# 1696 "parser.ml"
              
            in
            
# 226 "parser.mly"
                                                           (let (c1,c2) = _2 in Switch(c1,c2,_3))
# 1702 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv581) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_switch_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv579) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_switch_stmt) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv577) = Obj.magic _menhir_stack in
            let (_endpos__1_ : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_switch_stmt) : 'tv_switch_stmt) = _v in
            let (_startpos__1_ : Lexing.position) = _startpos in
            ((let _startpos = _startpos__1_ in
            let _endpos = _endpos__1_ in
            let _v : 'tv_stmt = 
# 167 "parser.mly"
                (_1)
# 1727 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv578)) : 'freshtv580)) : 'freshtv582)) : 'freshtv584)) : 'freshtv586)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv587 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) * _menhir_state * 'tv_list_switch_case_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv588)) : 'freshtv590)
    | _ ->
        _menhir_fail ()

and _menhir_goto_for_conds : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_for_conds -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv571 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_conds) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBLOCK ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164) : 'freshtv572)

and _menhir_goto_expr_sub : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr_sub -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    match _menhir_s with
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv565 * _menhir_state * 'tv_op_unary * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_sub) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv563 * _menhir_state * 'tv_op_unary * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_expr_sub) : 'tv_expr_sub) = _v in
        let (_startpos__2_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_op_unary), _startpos__1_) = _menhir_stack in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__2_ in
        let _v : 'tv_expr_unary = 
# 310 "parser.mly"
                     (annot (Op1(_1,_2)) _startpos__1_ _endpos__2_)
# 1777 "parser.ml"
         in
        _menhir_goto_expr_unary _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv564)) : 'freshtv566)
    | MenhirState115 | MenhirState116 | MenhirState200 | MenhirState188 | MenhirState186 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 | MenhirState157 | MenhirState159 | MenhirState161 | MenhirState136 | MenhirState153 | MenhirState151 | MenhirState138 | MenhirState134 | MenhirState127 | MenhirState118 | MenhirState99 | MenhirState35 | MenhirState41 | MenhirState91 | MenhirState88 | MenhirState85 | MenhirState82 | MenhirState73 | MenhirState66 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv569) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr_sub) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv567) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_expr_sub) : 'tv_expr_sub) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_expr_unary = 
# 311 "parser.mly"
             (_1)
# 1798 "parser.ml"
         in
        _menhir_goto_expr_unary _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv568)) : 'freshtv570)
    | _ ->
        _menhir_fail ()

and _menhir_goto_function_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_function_decl -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv561) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_function_decl) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv559) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_function_decl) : 'tv_function_decl) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_toplevel_decl = 
# 77 "parser.mly"
                    (_1)
# 1823 "parser.ml"
     in
    _menhir_goto_toplevel_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv560)) : 'freshtv562)

and _menhir_goto_if_tail : _menhir_env -> 'ttv_tail -> Lexing.position -> 'tv_if_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv557 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_v : 'tv_if_tail) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv555 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos__4_ : Lexing.position) = _endpos in
    let ((_4 : 'tv_if_tail) : 'tv_if_tail) = _v in
    ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_if_cond)), _endpos__3_, _, (_3 : 'tv_block), _startpos__3_) = _menhir_stack in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__4_ in
    let _v : 'tv_if_head = 
# 213 "parser.mly"
                           (let (c1,c2) = _2 in (Case (c1,c2,_3))::_4)
# 1844 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv553) = _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_if_head) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((match _menhir_s with
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv541) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_if_head) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv539) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_if_head) : 'tv_if_head) = _v in
        let (_startpos__2_ : Lexing.position) = _startpos in
        ((let _1 = () in
        let _endpos = _endpos__2_ in
        let _v : 'tv_if_tail = 
# 220 "parser.mly"
                 (_2)
# 1871 "parser.ml"
         in
        _menhir_goto_if_tail _menhir_env _menhir_stack _endpos _v) : 'freshtv540)) : 'freshtv542)
    | MenhirState115 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv551) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_if_head) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_if_head) : 'tv_if_head) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_if_stmt = 
# 210 "parser.mly"
            (If _1)
# 1892 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv547) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_if_stmt) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv545) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_if_stmt) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv543) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_if_stmt) : 'tv_if_stmt) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_stmt = 
# 166 "parser.mly"
                (_1)
# 1917 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv544)) : 'freshtv546)) : 'freshtv548)) : 'freshtv550)) : 'freshtv552)
    | _ ->
        _menhir_fail ()) : 'freshtv554)) : 'freshtv556)) : 'freshtv558)

and _menhir_goto_switch_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_switch_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv537 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list)) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_switch_body) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv535 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list)) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_4 : 'tv_switch_body) : 'tv_switch_body) = _v in
    ((let ((_menhir_stack, _menhir_s), _endpos__2_, _, (_2 : 'tv_expr_list)) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_switch_case = 
# 237 "parser.mly"
                                   (let (b,ftm) = _4 in ((Case(Empty, _2, b)), ftm))
# 1939 "parser.ml"
     in
    _menhir_goto_switch_case _menhir_env _menhir_stack _menhir_s _v) : 'freshtv536)) : 'freshtv538)

and _menhir_reduce46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_SEMI_ = 
# 211 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( [] )
# 1948 "parser.ml"
     in
    _menhir_goto_list_SEMI_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run192 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState192
    | CASE | DEFAULT | RBLOCK ->
        _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState192
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState192

and _menhir_goto_switch_case : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_switch_case -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv533 * _menhir_state * 'tv_switch_case) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CASE ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState195
    | DEFAULT ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState195
    | RBLOCK ->
        _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) MenhirState195
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195) : 'freshtv534)

and _menhir_reduce48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_switch_case_ = 
# 211 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( [] )
# 1991 "parser.ml"
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
        let (_menhir_stack : 'freshtv529 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOLLIT _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | BREAK ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CONTINUE ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DEFER ->
            _menhir_run166 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | FLOATLIT _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FOR ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IF ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INTLIT _v ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LBLOCK ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | MINUS ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINT ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINTLN ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMI ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | STRINGLIT _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState132 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SWITCH ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CASE | DEFAULT | RBLOCK ->
            _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132) : 'freshtv530)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv532)

and _menhir_run186 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186

and _menhir_goto_simple_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_simple_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv515 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv511 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138) : 'freshtv512)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv513 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv514)) : 'freshtv516)
    | MenhirState115 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv519 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv517 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_simple_stmt), _startpos__1_) = _menhir_stack in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_stmt = 
# 164 "parser.mly"
                (_1)
# 2154 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv518)) : 'freshtv520)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv527 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv521 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState200 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState200 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState200 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState200 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState200 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState200 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200) : 'freshtv522)
        | LBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv523 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_simple_stmt), _startpos__1_) = _menhir_stack in
            let _v : 'tv_switch_cond = 
# 233 "parser.mly"
               ((_1,None))
# 2200 "parser.ml"
             in
            _menhir_goto_switch_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv524)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv525 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv526)) : 'freshtv528)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv499 * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv493 * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | SEMI ->
                _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState159
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv494)
        | LBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv495 * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_option_expr_)) = _menhir_stack in
            let _v : 'tv_for_conds = 
# 249 "parser.mly"
          ((None,_1,None))
# 2262 "parser.ml"
             in
            _menhir_goto_for_conds _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv497 * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv498)) : 'freshtv500)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv505 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv501 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState161 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState161 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState161 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState161 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState161 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState161 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LBLOCK ->
                _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161) : 'freshtv502)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv503 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv504)) : 'freshtv506)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv509 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv507 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_option_expr_)), _, (_3 : 'tv_option_expr_)), _, (_5 : 'tv_option_expr_)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_for_conds = 
# 250 "parser.mly"
                              ((_1,_3,_5))
# 2328 "parser.ml"
         in
        _menhir_goto_for_conds _menhir_env _menhir_stack _menhir_s _v) : 'freshtv508)) : 'freshtv510)
    | _ ->
        _menhir_fail ()

and _menhir_goto_var_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_var_decl -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv491) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_var_decl) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv489) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_var_decl) : 'tv_var_decl) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_toplevel_decl = 
# 78 "parser.mly"
               (List.map (fun dcl -> Global dcl) _1)
# 2353 "parser.ml"
     in
    _menhir_goto_toplevel_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv490)) : 'freshtv492)

and _menhir_goto_arguments : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_arguments -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv487 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 2363 "parser.ml"
    ) * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_arguments) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv485 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 2372 "parser.ml"
    ) * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos__2_ : Lexing.position) = _endpos in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_arguments) : 'tv_arguments) = _v in
    ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 2380 "parser.ml"
    )), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__2_ in
    let _v : 'tv_fun_call = 
# 329 "parser.mly"
                   (Call(_1,_2))
# 2387 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv483) = _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_fun_call) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv481) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_fun_call) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv479) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_fun_call) : 'tv_fun_call) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr_operand = 
# 326 "parser.mly"
             (_1)
# 2412 "parser.ml"
     in
    _menhir_goto_expr_operand _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv480)) : 'freshtv482)) : 'freshtv484)) : 'freshtv486)) : 'freshtv488)

and _menhir_goto_expr_operand : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_expr_operand -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_expr_operand) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv475) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_expr_operand) : 'tv_expr_operand) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr_sub = 
# 321 "parser.mly"
                 (annot _1 _startpos__1_ _endpos__1_)
# 2435 "parser.ml"
     in
    _menhir_goto_expr_sub _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv476)) : 'freshtv478)

and _menhir_goto_statements : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_statements -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv409 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv407 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_stmt), _startpos__1_), _, (_3 : 'tv_statements)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_statements = 
# 152 "parser.mly"
                         ((annot _1 _startpos__1_ _endpos__1_)::_3)
# 2453 "parser.ml"
         in
        _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv408)) : 'freshtv410)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv413 * _menhir_state * 'tv_eat_unimplemented)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv411 * _menhir_state * 'tv_eat_unimplemented)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_eat_unimplemented)), _, (_3 : 'tv_statements)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_statements = 
# 153 "parser.mly"
                                     (_3)
# 2466 "parser.ml"
         in
        _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv412)) : 'freshtv414)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv417 * _menhir_state) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv415 * _menhir_state) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_statements)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_statements = 
# 154 "parser.mly"
                   (_2)
# 2479 "parser.ml"
         in
        _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv416)) : 'freshtv418)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv421 * _menhir_state)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv419 * _menhir_state)) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_statements)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_switch_case = 
# 238 "parser.mly"
                           (((Default(_3)), ENDBREAK))
# 2493 "parser.ml"
         in
        _menhir_goto_switch_case _menhir_env _menhir_stack _menhir_s _v) : 'freshtv420)) : 'freshtv422)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv429 * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FALLTHROUGH ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv423 * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMI ->
                _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState191
            | CASE | DEFAULT | RBLOCK ->
                _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState191
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191) : 'freshtv424)
        | CASE | DEFAULT | RBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv425 * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_statements)) = _menhir_stack in
            let _v : 'tv_switch_body = 
# 242 "parser.mly"
                ((_1,ENDBREAK))
# 2523 "parser.ml"
             in
            _menhir_goto_switch_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv427 * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv428)) : 'freshtv430)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv473 * _menhir_state * Lexing.position) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state * Lexing.position) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv467 * _menhir_state * Lexing.position) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_statements)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_block = 
# 149 "parser.mly"
                                (_2)
# 2555 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv465) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_block) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
            match _menhir_s with
            | MenhirState144 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv437 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ELSE ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv431) = Obj.magic _menhir_stack in
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
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv432)
                | SEMI ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv433) = Obj.magic _menhir_stack in
                    ((let (_, _endpos) = Obj.magic _menhir_stack in
                    let _v : 'tv_if_tail = 
# 222 "parser.mly"
      ([])
# 2592 "parser.ml"
                     in
                    _menhir_goto_if_tail _menhir_env _menhir_stack _endpos _v) : 'freshtv434)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv435 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv436)) : 'freshtv438)
            | MenhirState146 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv441) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv439) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos__2_, _, (_2 : 'tv_block), _startpos__2_) = _menhir_stack in
                let _1 = () in
                let _endpos = _endpos__2_ in
                let _v : 'tv_if_tail = 
# 221 "parser.mly"
               ([Default _2])
# 2613 "parser.ml"
                 in
                _menhir_goto_if_tail _menhir_env _menhir_stack _endpos _v) : 'freshtv440)) : 'freshtv442)
            | MenhirState164 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv451 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_conds) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv449 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_conds) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_for_conds)), _endpos__3_, _, (_3 : 'tv_block), _startpos__3_) = _menhir_stack in
                let _1 = () in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__3_ in
                let _v : 'tv_for_stmt = 
# 246 "parser.mly"
                      (let (c1,c2,c3) = _2 in For(c1,c2,c3,_3))
# 2628 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv447) = _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_for_stmt) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv445) = Obj.magic _menhir_stack in
                let (_endpos : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_for_stmt) = _v in
                let (_startpos : Lexing.position) = _startpos in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv443) = Obj.magic _menhir_stack in
                let (_endpos__1_ : Lexing.position) = _endpos in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_for_stmt) : 'tv_for_stmt) = _v in
                let (_startpos__1_ : Lexing.position) = _startpos in
                ((let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_stmt = 
# 168 "parser.mly"
                 (_1)
# 2653 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv444)) : 'freshtv446)) : 'freshtv448)) : 'freshtv450)) : 'freshtv452)
            | MenhirState115 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState172 | MenhirState181 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv455 * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv453 * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_block), _startpos__1_) = _menhir_stack in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__1_ in
                let _v : 'tv_stmt = 
# 163 "parser.mly"
               (Block _1)
# 2667 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv454)) : 'freshtv456)
            | MenhirState205 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv459 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 2675 "parser.ml"
                ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_typ) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv457 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 2681 "parser.ml"
                ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_typ) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (((((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, (_2 : (
# 20 "parser.mly"
       (string)
# 2686 "parser.ml"
                )), _startpos__2_), (_3 : 'tv_signature)), _endpos__4_, _, (_4 : 'tv_typ)), _endpos__5_, _, (_5 : 'tv_block), _startpos__5_) = _menhir_stack in
                let _1 = () in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__5_ in
                let _v : 'tv_function_decl = 
# 110 "parser.mly"
                                     ([Func(_2, _3, _4, _5)])
# 2694 "parser.ml"
                 in
                _menhir_goto_function_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv458)) : 'freshtv460)
            | MenhirState114 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv463 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 2702 "parser.ml"
                ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv461 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 2708 "parser.ml"
                ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_block * Lexing.position) = Obj.magic _menhir_stack in
                ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, (_2 : (
# 20 "parser.mly"
       (string)
# 2713 "parser.ml"
                )), _startpos__2_), (_3 : 'tv_signature)), _endpos__4_, _, (_4 : 'tv_block), _startpos__4_) = _menhir_stack in
                let _1 = () in
                let _startpos = _startpos__1_ in
                let _endpos = _endpos__4_ in
                let _v : 'tv_function_decl = 
# 109 "parser.mly"
                                 ([Func(_2, _3, `VOID, _4)])
# 2721 "parser.ml"
                 in
                _menhir_goto_function_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv462)) : 'freshtv464)
            | _ ->
                _menhir_fail ()) : 'freshtv466)) : 'freshtv468)) : 'freshtv470)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv471 * _menhir_state * Lexing.position) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv472)) : 'freshtv474)
    | _ ->
        _menhir_fail ()

and _menhir_goto_switch_cond : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_switch_cond -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv405 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBLOCK ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv401 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CASE ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | DEFAULT ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | RBLOCK ->
            _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130) : 'freshtv402)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv403 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv404)) : 'freshtv406)

and _menhir_goto_return_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_return_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_return_stmt) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv397) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_return_stmt) : 'tv_return_stmt) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_stmt = 
# 165 "parser.mly"
                (_1)
# 2789 "parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv398)) : 'freshtv400)

and _menhir_run118 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState118 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118

and _menhir_goto_incdec_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_incdec_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_incdec_stmt) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv393) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_incdec_stmt) : 'tv_incdec_stmt) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_simple_stmt = 
# 175 "parser.mly"
                (_1)
# 2843 "parser.ml"
     in
    _menhir_goto_simple_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv394)) : 'freshtv396)

and _menhir_goto_assign_op : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_assign_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv391 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 2854 "parser.ml"
    ) * Lexing.position) * _menhir_state * 'tv_assign_op) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState127 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127) : 'freshtv392)

and _menhir_reduce78 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_expr_ = 
# 114 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( None )
# 2889 "parser.ml"
     in
    _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_stmt -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv389 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOLLIT _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | BREAK ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CONTINUE ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DEFER ->
            _menhir_run166 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | FLOATLIT _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FOR ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IF ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INTLIT _v ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LBLOCK ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | MINUS ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINT ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINTLN ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMI ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | STRINGLIT _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState172 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SWITCH ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CASE | DEFAULT | FALLTHROUGH | RBLOCK ->
            _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172) : 'freshtv386)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv388)) : 'freshtv390)

and _menhir_goto_toplevel_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_toplevel_decl -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv383 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv379 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FUNC ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState212 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState212 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TYPE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState212 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState212 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | EOF ->
            _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState212) : 'freshtv380)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv381 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)) : 'freshtv384)

and _menhir_goto_typed_var_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_typed_var_decl -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    match _menhir_s with
    | MenhirState115 | MenhirState188 | MenhirState132 | MenhirState181 | MenhirState172 | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typed_var_decl) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_typed_var_decl) : 'tv_typed_var_decl) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_stmt = 
# 162 "parser.mly"
                  (List.map (fun decl -> Decl decl) _1)
# 3022 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv372)) : 'freshtv374)
    | MenhirState212 | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typed_var_decl) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv375) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_typed_var_decl) : 'tv_typed_var_decl) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_var_decl = 
# 122 "parser.mly"
                     (_1)
# 3043 "parser.ml"
         in
        _menhir_goto_var_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv376)) : 'freshtv378)
    | _ ->
        _menhir_fail ()

and _menhir_goto_op_unary : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_op_unary -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv369 * _menhir_state * 'tv_op_unary * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv370)

and _menhir_reduce23 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3077 "parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 3083 "parser.ml"
    )), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr_operand = 
# 324 "parser.mly"
           (V _1)
# 3090 "parser.ml"
     in
    _menhir_goto_expr_operand _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run44 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState44 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _endpos = _endpos__2_ in
        let _v : 'tv_arguments = 
# 257 "parser.mly"
                  ([])
# 3133 "parser.ml"
         in
        _menhir_goto_arguments _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv366)) : 'freshtv368)
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_goto_literal : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_literal -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv363) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_literal) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv361) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_literal) : 'tv_literal) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_expr_operand = 
# 325 "parser.mly"
            (L _1)
# 3164 "parser.ml"
     in
    _menhir_goto_expr_operand _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv362)) : 'freshtv364)

and _menhir_reduce103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_statements = 
# 155 "parser.mly"
      ([])
# 3173 "parser.ml"
     in
    _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v

and _menhir_run116 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINT ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINTLN ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LBLOCK ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv359) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState116 in
        ((let _v : 'tv_switch_cond = 
# 234 "parser.mly"
     ((Empty,None))
# 3214 "parser.ml"
         in
        _menhir_goto_switch_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv360)
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
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | BREAK ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CONTINUE ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DEFER ->
        _menhir_run166 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LBLOCK ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINT ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINTLN ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SEMI ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SWITCH ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | VAR ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
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
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState134 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv357 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_) = _menhir_stack in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : 'tv_return_stmt = 
# 205 "parser.mly"
         (Return None)
# 3315 "parser.ml"
         in
        _menhir_goto_return_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv358)
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
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINT ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINTLN ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136

and _menhir_run122 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 3387 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | LPAREN ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState122 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MASSIGN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv343) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv341) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : 'tv_assign_op = 
# 192 "parser.mly"
          (`SUB)
# 3410 "parser.ml"
         in
        _menhir_goto_assign_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)) : 'freshtv344)
    | MINUSMINUS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv347 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3418 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv345 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3427 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 3434 "parser.ml"
        )), _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__2_ in
        let _v : 'tv_incdec_stmt = 
# 196 "parser.mly"
                   (IncDec(_1,`DEC))
# 3442 "parser.ml"
         in
        _menhir_goto_incdec_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv346)) : 'freshtv348)
    | PASSIGN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv351) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : 'tv_assign_op = 
# 191 "parser.mly"
          (`ADD)
# 3457 "parser.ml"
         in
        _menhir_goto_assign_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)) : 'freshtv352)
    | PLUSPLUS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv355 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3465 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv353 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3474 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 3481 "parser.ml"
        )), _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__2_ in
        let _v : 'tv_incdec_stmt = 
# 195 "parser.mly"
                 (IncDec(_1,`INC))
# 3489 "parser.ml"
         in
        _menhir_goto_incdec_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv354)) : 'freshtv356)
    | ASSIGN | COLASSIGN ->
        _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack)
    | AND | ANDXOR | BAND | BOR | DIV | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | LSHIFT | MINUS | MOD | NEQUAL | OR | PLUS | RSHIFT | SEMI | TIMES | XOR ->
        _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122

and _menhir_run157 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState157 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LBLOCK | SEMI ->
        _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState157
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState157

and _menhir_run166 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv339) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_eat_unimplemented = 
# 159 "parser.mly"
         ()
# 3544 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv337) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_eat_unimplemented) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv335 * _menhir_state * 'tv_eat_unimplemented) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331 * _menhir_state * 'tv_eat_unimplemented) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOLLIT _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState181 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | BREAK ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CONTINUE ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DEFER ->
            _menhir_run166 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | FLOATLIT _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState181 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FOR ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState181 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IF ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INTLIT _v ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState181 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LBLOCK ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | MINUS ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NOT ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINT ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PRINTLN ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMI ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | STRINGLIT _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState181 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SWITCH ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | XOR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | CASE | DEFAULT | FALLTHROUGH | RBLOCK ->
            _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState181) : 'freshtv332)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv333 * _menhir_state * 'tv_eat_unimplemented) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)) : 'freshtv336)) : 'freshtv338)) : 'freshtv340)

and _menhir_run167 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_stmt = 
# 170 "parser.mly"
                 (Continue)
# 3634 "parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv330)

and _menhir_run168 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_stmt = 
# 169 "parser.mly"
               (Break)
# 3652 "parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv328)

and _menhir_goto_type_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_type_decl -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_decl) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_type_decl) : 'tv_type_decl) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_toplevel_decl = 
# 79 "parser.mly"
             (List.map (fun dcl -> Global dcl) _1)
# 3675 "parser.ml"
     in
    _menhir_goto_toplevel_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv324)) : 'freshtv326)

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv293 * _menhir_state)) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv291 * _menhir_state)) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _endpos__3_, _, (_3 : 'tv_typ)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _endpos = _endpos__3_ in
        let _v : 'tv_slice_literal = 
# 101 "parser.mly"
                          (Slice(_3))
# 3695 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_slice_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_slice_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_slice_literal) : 'tv_slice_literal) = _v in
        ((let _endpos = _endpos__1_ in
        let _v : 'tv_type_literal = 
# 94 "parser.mly"
                    (`TypeLit(_1))
# 3716 "parser.ml"
         in
        _menhir_goto_type_literal _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv286)) : 'freshtv288)) : 'freshtv290)) : 'freshtv292)) : 'freshtv294)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv303 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 3724 "parser.ml"
        ) * Lexing.position)) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv301 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 3730 "parser.ml"
        ) * Lexing.position)) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _endpos__2_, (_2 : (
# 22 "parser.mly"
       (int)
# 3735 "parser.ml"
        )), _startpos__2_), _endpos__4_, _, (_4 : 'tv_typ)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _endpos = _endpos__4_ in
        let _v : 'tv_array_literal = 
# 98 "parser.mly"
                                 (Array(_2, _4))
# 3743 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299) = _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_array_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_array_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_array_literal) : 'tv_array_literal) = _v in
        ((let _endpos = _endpos__1_ in
        let _v : 'tv_type_literal = 
# 93 "parser.mly"
                    (`TypeLit(_1))
# 3764 "parser.ml"
         in
        _menhir_goto_type_literal _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv296)) : 'freshtv298)) : 'freshtv300)) : 'freshtv302)) : 'freshtv304)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv309 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv305 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState33 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RBLOCK | RPAREN ->
                _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv306)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv307 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)) : 'freshtv310)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv317 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ASSIGN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv311 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLLIT _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FLOATLIT _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INTLIT _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | MINUS ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NOT ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | PLUS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRINGLIT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | XOR ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99) : 'freshtv312)
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv313 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_identifier_list), _startpos__2_), _endpos__3_, _, (_3 : 'tv_typ)) = _menhir_stack in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : 'tv_typed_var_decl = 
# 132 "parser.mly"
                                               (List.map (fun id -> Var(id, _3, None)) _2)
# 3840 "parser.ml"
             in
            _menhir_goto_typed_var_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv314)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv315 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)) : 'freshtv318)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv319 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3855 "parser.ml"
        ) * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENT _v ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RPAREN | SEMI ->
            _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv320)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv321 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 3873 "parser.ml"
        ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LBLOCK ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv322)
    | _ ->
        _menhir_fail ()

and _menhir_run151 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_identifier_list * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv283) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_op_unary = 
# 316 "parser.mly"
        (`BNOT)
# 3929 "parser.ml"
     in
    _menhir_goto_op_unary _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv284)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 21 "parser.mly"
       (string)
# 3936 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 21 "parser.mly"
       (string)
# 3947 "parser.ml"
    )) : (
# 21 "parser.mly"
       (string)
# 3951 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_literal = 
# 333 "parser.mly"
              (String _1)
# 3959 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv282)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_op_unary = 
# 314 "parser.mly"
         (`POS)
# 3975 "parser.ml"
     in
    _menhir_goto_op_unary _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv280)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_op_unary = 
# 317 "parser.mly"
        (`NOT)
# 3991 "parser.ml"
     in
    _menhir_goto_op_unary _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv278)

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv275) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_op_unary = 
# 315 "parser.mly"
          (`NEG)
# 4007 "parser.ml"
     in
    _menhir_goto_op_unary _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv276)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState41 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState41 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState41 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState41 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState41 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState41 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run42 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 4045 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv273) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 22 "parser.mly"
       (int)
# 4056 "parser.ml"
    )) : (
# 22 "parser.mly"
       (int)
# 4060 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_literal = 
# 335 "parser.mly"
           (Int _1)
# 4068 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv274)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 4075 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState43 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | AND | ANDXOR | BAND | BOR | COLON | COMMA | DIV | EQUAL | GEQ | GREATER | LBLOCK | LEQ | LESSER | LSHIFT | MINUS | MOD | NEQUAL | OR | PLUS | RPAREN | RSHIFT | SEMI | TIMES | XOR ->
        _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_run46 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 23 "parser.mly"
       (float)
# 4094 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv271) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 23 "parser.mly"
       (float)
# 4105 "parser.ml"
    )) : (
# 23 "parser.mly"
       (float)
# 4109 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_literal = 
# 336 "parser.mly"
             (Float64 _1)
# 4117 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv272)

and _menhir_run47 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 24 "parser.mly"
       (bool)
# 4124 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 24 "parser.mly"
       (bool)
# 4135 "parser.ml"
    )) : (
# 24 "parser.mly"
       (bool)
# 4139 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_literal = 
# 334 "parser.mly"
            (Bool _1)
# 4147 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv270)

and _menhir_run115 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLLIT _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | BREAK ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | CONTINUE ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DEFER ->
        _menhir_run166 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | FLOATLIT _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INTLIT _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LBLOCK ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | MINUS ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NOT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PLUS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINT ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | PRINTLN ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SEMI ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | STRINGLIT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState115 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SWITCH ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | VAR ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | XOR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RBLOCK ->
        _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115

and _menhir_goto_type_literal : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_type_literal -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv267) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_literal) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv265) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_type_literal) : 'tv_type_literal) = _v in
    ((let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 90 "parser.mly"
                   (_1)
# 4224 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv266)) : 'freshtv268)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_dist_type_decl : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_dist_type_decl -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv251 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4242 "parser.ml"
        ) * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv249 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4248 "parser.ml"
        ) * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 20 "parser.mly"
       (string)
# 4253 "parser.ml"
        )), _startpos__1_), _endpos__2_, _, (_2 : 'tv_typ)), _endpos__3_, _, (_3 : 'tv_dist_type_decl)) = _menhir_stack in
        let _endpos = _endpos__3_ in
        let _v : 'tv_dist_type_decl = 
# 143 "parser.mly"
                               ((Type(_1, _2))::_3)
# 4259 "parser.ml"
         in
        _menhir_goto_dist_type_decl _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv250)) : 'freshtv252)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv259 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv255 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv253 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let (((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos__2_, _, _startpos__2_), _endpos__3_, _, (_3 : 'tv_dist_type_decl)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__4_ in
            let _v : 'tv_type_decl = 
# 140 "parser.mly"
                                        (_3)
# 4285 "parser.ml"
             in
            _menhir_goto_type_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv254)) : 'freshtv256)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv257 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)) : 'freshtv260)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv261 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * 'tv_dist_type_decl) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : 'tv_dist_type_decl)) = _menhir_stack in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__2_ in
        let _v : 'tv_type_decl = 
# 139 "parser.mly"
                          (_2)
# 4307 "parser.ml"
         in
        _menhir_goto_type_decl _menhir_env _menhir_stack _endpos _menhir_s _v _startpos) : 'freshtv262)) : 'freshtv264)
    | _ ->
        _menhir_fail ()

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBLOCK ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245 * _menhir_state) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState12 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RBLOCK ->
            _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv246)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv243) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 88 "parser.mly"
                (`STRING)
# 4355 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv244)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv241) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 87 "parser.mly"
                (`RUNE)
# 4371 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv242)

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INTLIT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv235 * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_v : (
# 22 "parser.mly"
       (int)
# 4388 "parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RSQUARE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv231 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 4400 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState30
            | FLOAT ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState30
            | IDENT _v ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState30 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState30
            | LSQUARE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | RUNE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState30
            | STRING ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState30
            | STRUCT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv232)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv233 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 4432 "parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)) : 'freshtv236)
    | RSQUARE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv237 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState19
        | FLOAT ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState19
        | IDENT _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState19 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState19
        | LSQUARE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | RUNE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState19
        | STRING ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState19
        | STRUCT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv238)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv229) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 84 "parser.mly"
                (`INT)
# 4482 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv230)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 4489 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "parser.mly"
       (string)
# 4500 "parser.ml"
    )) : (
# 20 "parser.mly"
       (string)
# 4504 "parser.ml"
    )) = _v in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 89 "parser.mly"
                (`Type(_1))
# 4511 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv228)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv225) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 85 "parser.mly"
                (`FLOAT64)
# 4527 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv226)

and _menhir_run23 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _endpos = _endpos__1_ in
    let _v : 'tv_typ = 
# 86 "parser.mly"
                (`BOOL)
# 4543 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv224)

and _menhir_goto_separated_nonempty_list_COMMA_IDENT_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_IDENT_ -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    match _menhir_s with
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4555 "parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_IDENT_) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv197 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4564 "parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_COMMA_IDENT_) : 'tv_separated_nonempty_list_COMMA_IDENT_) = _v in
        let (_startpos_xs_ : Lexing.position) = _startpos in
        ((let ((_menhir_stack, _endpos_x_, _menhir_s, (x : (
# 20 "parser.mly"
       (string)
# 4572 "parser.ml"
        )), _startpos_x_), _) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos_x_ in
        let _v : 'tv_separated_nonempty_list_COMMA_IDENT_ = 
# 243 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 4579 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv198)) : 'freshtv200)
    | MenhirState4 | MenhirState212 | MenhirState115 | MenhirState116 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 | MenhirState136 | MenhirState111 | MenhirState33 | MenhirState12 | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_IDENT_) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_separated_nonempty_list_COMMA_IDENT_) : 'tv_separated_nonempty_list_COMMA_IDENT_) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _v : 'tv_identifier_list = 
# 184 "parser.mly"
                                       (_1)
# 4597 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_identifier_list) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
        match _menhir_s with
        | MenhirState5 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv203 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ASSIGN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv201 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState10 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOLLIT _v ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState35 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | FLOATLIT _v ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState35 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IDENT _v ->
                    _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState35 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | INTLIT _v ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState35 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | LPAREN ->
                    _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | MINUS ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | NOT ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PLUS ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | STRINGLIT _v ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState35 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | XOR ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv202)
            | BOOL ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState10
            | FLOAT ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState10
            | IDENT _v ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState10 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState10
            | LSQUARE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | RUNE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState10
            | STRING ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState10
            | STRUCT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv204)
        | MenhirState111 | MenhirState33 | MenhirState12 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState15
            | FLOAT ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState15
            | IDENT _v ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState15 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState15
            | LSQUARE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | RUNE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState15
            | STRING ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState15
            | STRUCT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15) : 'freshtv206)
        | MenhirState115 | MenhirState116 | MenhirState188 | MenhirState132 | MenhirState133 | MenhirState181 | MenhirState172 | MenhirState136 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv211 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ASSIGN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv207 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOLLIT _v ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | FLOATLIT _v ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | IDENT _v ->
                    _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | INTLIT _v ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | LPAREN ->
                    _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | MINUS ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | NOT ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | PLUS ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | STRINGLIT _v ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | XOR ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153) : 'freshtv208)
            | COLASSIGN ->
                _menhir_run151 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv209 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)) : 'freshtv212)
        | MenhirState4 | MenhirState212 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv215 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COLASSIGN ->
                _menhir_run151 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv213 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)) : 'freshtv216)
        | _ ->
            _menhir_fail ()) : 'freshtv218)) : 'freshtv220)) : 'freshtv222)
    | _ ->
        _menhir_fail ()

and _menhir_goto_signature_ids : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_signature_ids -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state) * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBLOCK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv175 * _menhir_state) * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv173 * _menhir_state) * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            let (_endpos__4_ : Lexing.position) = _endpos in
            ((let (((_menhir_stack, _menhir_s), _startpos__2_), _, (_3 : 'tv_signature_ids)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _endpos = _endpos__4_ in
            let _v : 'tv_struct_literal = 
# 104 "parser.mly"
                                         (Struct(_3))
# 4781 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv171) = _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_struct_literal) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_struct_literal) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
            let (_endpos__1_ : Lexing.position) = _endpos in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_struct_literal) : 'tv_struct_literal) = _v in
            ((let _endpos = _endpos__1_ in
            let _v : 'tv_type_literal = 
# 95 "parser.mly"
                     (`TypeLit(_1))
# 4802 "parser.ml"
             in
            _menhir_goto_type_literal _menhir_env _menhir_stack _endpos _menhir_s _v) : 'freshtv168)) : 'freshtv170)) : 'freshtv172)) : 'freshtv174)) : 'freshtv176)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv177 * _menhir_state) * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)) : 'freshtv180)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv183 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv181 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_identifier_list), _startpos__1_), _endpos__2_, _, (_2 : 'tv_typ)), _, (_4 : 'tv_signature_ids)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_signature_ids = 
# 116 "parser.mly"
                                              ((List.map (fun id -> (id, _2)) _1) @ _4)
# 4822 "parser.ml"
         in
        _menhir_goto_signature_ids _menhir_env _menhir_stack _menhir_s _v) : 'freshtv182)) : 'freshtv184)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * Lexing.position * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv191 * Lexing.position * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv189 * Lexing.position * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            let (_endpos__3_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _endpos__1_, _startpos__1_), _, (_2 : 'tv_signature_ids)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_signature = 
# 113 "parser.mly"
                               (_2)
# 4845 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv187) = _menhir_stack in
            let (_v : 'tv_signature) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv185 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 4855 "parser.ml"
            ) * Lexing.position) * 'tv_signature) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | FLOAT ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | IDENT _v ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | LBLOCK ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LSQUARE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | RUNE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | STRING ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState114
            | STRUCT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv186)) : 'freshtv188)) : 'freshtv190)) : 'freshtv192)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv193 * Lexing.position * Lexing.position) * _menhir_state * 'tv_signature_ids) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)) : 'freshtv196)
    | _ ->
        _menhir_fail ()

and _menhir_goto_toplevel : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_toplevel -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv151 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position)) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv149 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position)) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_toplevel_decl), _startpos__1_), _, (_3 : 'tv_toplevel)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_toplevel = 
# 73 "parser.mly"
                                  ( (List.map (fun dcl -> annot dcl _startpos__1_ _endpos__1_) _1) @ _3 )
# 4906 "parser.ml"
         in
        _menhir_goto_toplevel _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)) : 'freshtv152)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv165 * 'tv_package) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv161 * 'tv_package) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv159 * 'tv_package) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : 'tv_package)), _, (_2 : 'tv_toplevel)) = _menhir_stack in
            let _3 = () in
            let _v : (
# 64 "parser.mly"
      (Golite.ast)
# 4925 "parser.ml"
            ) = 
# 67 "parser.mly"
                           (Program(_1,_2))
# 4929 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv157) = _menhir_stack in
            let (_v : (
# 64 "parser.mly"
      (Golite.ast)
# 4936 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv155) = Obj.magic _menhir_stack in
            let (_v : (
# 64 "parser.mly"
      (Golite.ast)
# 4943 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv153) = Obj.magic _menhir_stack in
            let ((_1 : (
# 64 "parser.mly"
      (Golite.ast)
# 4950 "parser.ml"
            )) : (
# 64 "parser.mly"
      (Golite.ast)
# 4954 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv154)) : 'freshtv156)) : 'freshtv158)) : 'freshtv160)) : 'freshtv162)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv163 * 'tv_package) * _menhir_state * 'tv_toplevel) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)) : 'freshtv166)
    | _ ->
        _menhir_fail ()

and _menhir_reduce9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_, _endpos) = Obj.magic _menhir_stack in
    let _v : 'tv_dist_type_decl = 
# 144 "parser.mly"
      ( [] )
# 4973 "parser.ml"
     in
    _menhir_goto_dist_type_decl _menhir_env _menhir_stack _endpos _menhir_s _v

and _menhir_run103 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 4980 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103
    | FLOAT ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103
    | IDENT _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103
    | LSQUARE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | RUNE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103
    | STRING ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103
    | STRUCT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103

and _menhir_reduce85 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5011 "parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos_x_, _menhir_s, (x : (
# 20 "parser.mly"
       (string)
# 5017 "parser.ml"
    )), _startpos_x_) = _menhir_stack in
    let _startpos = _startpos_x_ in
    let _v : 'tv_separated_nonempty_list_COMMA_IDENT_ = 
# 241 "/home/notjustin/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 5023 "parser.ml"
     in
    _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_run7 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5030 "parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState7 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_reduce92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_signature_ids = 
# 117 "parser.mly"
      ( [] )
# 5049 "parser.ml"
     in
    _menhir_goto_signature_ids _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv31 * Lexing.position * _menhir_state * 'tv_toplevel_decl * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv33 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5066 "parser.ml"
        ) * Lexing.position) * 'tv_signature) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv35 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * 'tv_switch_case) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv41 * _menhir_state * 'tv_statements)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv43 * _menhir_state) * Lexing.position * _menhir_state * 'tv_expr_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * _menhir_state * 'tv_eat_unimplemented)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * Lexing.position * _menhir_state * 'tv_stmt * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_conds) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv53 * _menhir_state * 'tv_option_expr_)) * _menhir_state * 'tv_option_expr_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * 'tv_option_expr_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * 'tv_identifier_list * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * 'tv_identifier_list * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv64)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * Lexing.position) * _menhir_state * 'tv_if_cond) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * Lexing.position * _menhir_state * 'tv_simple_stmt * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv77 * _menhir_state * Lexing.position) * _menhir_state * 'tv_switch_cond) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5184 "parser.ml"
        ) * Lexing.position) * _menhir_state * 'tv_assign_op) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5193 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * _menhir_state * Lexing.position) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5227 "parser.ml"
        ) * Lexing.position) * 'tv_signature) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * Lexing.position * Lexing.position) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv96)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv97 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5240 "parser.ml"
        ) * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5249 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv101 * Lexing.position * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv105 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * Lexing.position * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv109 * Lexing.position * _menhir_state * 'tv_expr1 * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv111 * Lexing.position * _menhir_state * 'tv_expr2 * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv113 * Lexing.position * _menhir_state * 'tv_expr3 * Lexing.position) * 'tv_op_rel) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv115 * Lexing.position * _menhir_state * 'tv_expr4 * Lexing.position) * 'tv_op_add) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * Lexing.position * _menhir_state * 'tv_expr5 * Lexing.position) * 'tv_op_mul) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_op_unary * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5313 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv129 * _menhir_state * 'tv_identifier_list * Lexing.position) * Lexing.position * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv131 * _menhir_state) * Lexing.position * (
# 22 "parser.mly"
       (int)
# 5337 "parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * _menhir_state) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv139 * _menhir_state * Lexing.position) * _menhir_state * 'tv_identifier_list * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv141 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5366 "parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * Lexing.position * _menhir_state * (
# 20 "parser.mly"
       (string)
# 5375 "parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * 'tv_package) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv148)

and _menhir_reduce124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_toplevel = 
# 74 "parser.mly"
      ( [] )
# 5394 "parser.ml"
     in
    _menhir_goto_toplevel _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState5 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run101 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState101 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState101 in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENT _v ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState102 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RPAREN ->
            _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState102
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102) : 'freshtv30)
    | SEMI ->
        _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101

and _menhir_run6 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 5447 "parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | ASSIGN | BOOL | COLASSIGN | FLOAT | IDENT _ | INT | LSQUARE | RUNE | STRING | STRUCT ->
        _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

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
# 5476 "parser.ml"
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
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState111 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
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
# 5507 "parser.ml"
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
# 5534 "parser.ml"
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
# 5566 "parser.ml"
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
# 5578 "parser.ml"
                ) * Lexing.position) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv5) * Lexing.position * (
# 20 "parser.mly"
       (string)
# 5585 "parser.ml"
                ) * Lexing.position) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _endpos__2_, (_2 : (
# 20 "parser.mly"
       (string)
# 5590 "parser.ml"
                )), _startpos__2_) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_package = 
# 70 "parser.mly"
                            (Package _2)
# 5597 "parser.ml"
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
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState4 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TYPE ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState4 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
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
# 5629 "parser.ml"
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
  

# 5648 "parser.ml"
