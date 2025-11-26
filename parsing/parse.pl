%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main parse predicate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parse(Tokens) :-
    lines(Tokens, []).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grammar
%
% Lines → Line
% Lines → Line ; Lines
%
% Line → Num
% Line → Num , Line
%
% Num → Digit
% Num → Digit Num
%
% Digit → '0' | ... | '9'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%
% Lines
%%%%%%%%%%%%%%

% Lines → Line (end)
lines(Input, Rest) :-
    line(Input, Rest).

% Lines → Line ; Lines
lines(Input, Rest) :-
    line(Input, AfterLine),
    semicolon(AfterLine, AfterSemicolon),
    lines(AfterSemicolon, Rest).


%%%%%%%%%%%%%%
% Line
%%%%%%%%%%%%%%

% Line → Num
line(Input, Rest) :-
    num(Input, Rest).

% Line → Num , Line
line(Input, Rest) :-
    num(Input, Mid),
    comma(Mid, AfterComma),
    line(AfterComma, Rest).


%%%%%%%%%%%%%%
% Num
%%%%%%%%%%%%%%

% Num → Digit
num(Input, Rest) :-
    digit(Input, Rest).

% Num → Digit Num
num(Input, Rest) :-
    digit(Input, Mid),
    num(Mid, Rest).


%%%%%%%%%%%%%%
% Digit
%%%%%%%%%%%%%%

digit(['0'|Rest], Rest).
digit(['1'|Rest], Rest).
digit(['2'|Rest], Rest).
digit(['3'|Rest], Rest).
digit(['4'|Rest], Rest).
digit(['5'|Rest], Rest).
digit(['6'|Rest], Rest).
digit(['7'|Rest], Rest).
digit(['8'|Rest], Rest).
digit(['9'|Rest], Rest).


%%%%%%%%%%%%%%
% Separator helpers
%%%%%%%%%%%%%%

comma([','|Rest], Rest).
semicolon([';'|Rest], Rest).
