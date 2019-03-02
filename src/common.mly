%{
%}
%% 

%public annot(X): 
| X {annot $1 $startpos($1) $endpos($1)}

%public mapannot(X):
| X {List.map (fun x -> annot x $startpos($1) $endpos($1)) $1}

%public golist(X):
| separated_nonempty_list(COMMA,X) {$1}

%public gooptlist(X):
| separated_list(COMMA,X) {$1}

%public goargs(X):
| delimited(LPAREN,X,RPAREN) {$1}
