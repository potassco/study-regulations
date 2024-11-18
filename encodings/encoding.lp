% generate
{ in(M,s(I)) } :- in(M,m), I=1..n.

% s = s(1) U ... U s(n)
in(M,s) :- in(M,s(I)).

% m(w) and m(s)
in(M,m(X)) :- X = (s;w), in(M,m), map(s,M,X).

% additional sets
set(A) :-      empty(A).
set(A) :- subseteq(A,B).    set(A) :-   equal(A,B).
set(B) :- subseteq(A,B).    set(B) :-   equal(A,B).
set(A) :-   card(A,R,L).    set(A) :- sum(A,M,R,L).
%
set(A) :- set( int(A,B)).   set(B) :- set(int(A,B)).
set(A) :- set(before(A)).
%
in( M, int(A,B)) :- set( int(A,B)), in(M,A), in(M,B).
in(M1,before(A)) :- set(before(A)), in(M1,s(I)), in(M2,A), in(M2,s(J)), I < J.

% constraints
:- empty(A), in(M,A).
%
:- subseteq(A,B), in(M,A), not in(M,B).
%
:- equal(A,B), in(M,A), not in(M,B).
:- equal(A,B), not in(M,A), in(M,B).
%
:- card(A,leq,U), not { in(M,A) } U.
%
:- sum(A,F,bw,(L,U)), not L #sum{ V,M : in(M,A), map(F,M,V) } U.
:- sum(A,F,geq,   L), not L #sum{ V,M : in(M,A), map(F,M,V) }.

