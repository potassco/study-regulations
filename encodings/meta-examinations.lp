% examinations input:
% * in(X,ep)
% * in(X,es)
% * map(ep,M,X)
% * map(es,M,X)
% * in((X,Y),d)

% generate
{ in(E,e(I)) } :- X=(ep;es), in(E,X), I=1..n.

% ee = e(1) U ... U e(n)
in(E,ee) :- in(E,e(I)).

% before(I) = e(1) U ... U e(I)
in(E,before(I)) :- I=1..n, in(E,e(J)), J<=I.

% function f from e(I)'s to s(I)'s
in(M,s(I)) :- in(M,m), I=1..n,
              map(ep,M,P), in(X,P),
              map(es,M,S), in(Y,S),
              in(E,before(I)) : in(E,X);
              in(E,before(I)) : in(E,Y);
              1 { not in(E,before(I-1)) : in(E,X) ;
                  not in(E,before(I-1)) : in(E,Y) }.

% s = s(1) U ... U s(n)
in(E,s) :- in(E,s(I)).

% m(w) and m(s)
in(E,m(X)) :- X = (s;w), in(E,m), map(s,E,X).

% constraints (logical connectives)
constraint( if(X,Y)) :-  if(X,Y).
constraint( eq(X,Y)) :-  eq(X,Y).
constraint(and(X,Y)) :- and(X,Y).
constraint( or(X,Y)) :-  or(X,Y).
constraint(  neg(X)) :-   neg(X).
constraint(exists(A,B,X)) :- exists(A,B,X). % exists some A from B such that X
%                            % A has to be a unique name occurring in X and nowhere else

% constraints (relations)
constraint(   empty(A)) :-    empty(A).
constraint(nonempty(A)) :- nonempty(A).
%
constraint(  subset(A,B)) :-   subset(A,B).
constraint(subseteq(A,B)) :- subseteq(A,B).
constraint(   equal(A,B)) :-    equal(A,B).
constraint(supseteq(A,B)) :- supseteq(A,B).
constraint(  supset(A,B)) :-   supset(A,B).
constraint(     in'(A,B)) :-      in'(A,B). % the set A belongs to the set of sets B
%
constraint( card(A,R,L)) :-  card(A,R,L).
constraint(sum(A,M,R,L)) :- sum(A,M,R,L).
%
constraint(notafter(A,B)) :- notafter(A,B). % in the e(I)'s no element of A occurs after some element of B

% statements
st(X) :- constraint(X).
st(X) :- st( if(X,Y)). st(Y) :- st( if(X,Y)).
st(X) :- st( eq(X,Y)). st(Y) :- st( eq(X,Y)).
st(X) :- st(and(X,Y)). st(Y) :- st(and(X,Y)).
st(X) :- st( or(X,Y)). st(Y) :- st( or(X,Y)).
st(X) :- st(  neg(X)).
st(X) :- st(exists(A,B,X)).

% additional sets (logical connectives)
set(B) :- st(exists(A,B,X)).

% additional sets (relations)
set(A) :-   st(   empty(A)).
set(A) :-   st(nonempty(A)).
%
set(A) :- st(  subset(A,B)).  set(B) :- st(  subset(A,B)).
set(A) :- st(subseteq(A,B)).  set(B) :- st(subseteq(A,B)).
set(A) :- st(   equal(A,B)).  set(B) :- st(   equal(A,B)).
set(A) :- st(supseteq(A,B)).  set(B) :- st(supseteq(A,B)).
set(A) :- st(  supset(A,B)).  set(B) :- st(  supset(A,B)).
set(A) :- st(     in'(A,B)).  set(B) :- st(     in'(A,B)).
%
set(A) :- st(  card(A,R,X)).
set(A) :- st( sum(A,M,R,X)).
%
set(A) :- st(notafter(A,B)).  set(B) :- st(notafter(A,B)).

% additional sets (set operations)
set(A) :- set(int(A,B)).  set(B) :- set(int(A,B)).
in(E,int(A,B)) :- set(int(A,B)), in(E,A), in(E,B).
%
set(A) :- set(union(A,B)).  set(B) :- set(union(A,B)).
in(E,union(A,B)) :- set(union(A,B)), in(E,A).
in(E,union(A,B)) :- set(union(A,B)), in(E,B).
%
set(A) :- set(expand(A)).
in(F,expand(A)) :- set(expand(A)), in(E,A), in(F,E).
%
set(A) :- set(before(A)). % contains the elements that occur in s(I) before some element of A
in(E,before(A)) :- set(before(A)), in(E,s(I)), in(F,A), in(F,s(J)), I < J.
%
set(A) :- set(after(A)). % contains the elements that occur in s(I) after some element of A
in(E,after(A)) :- set(after(A)), in(E,s(I)), in(F,A), in(F,s(J)), I > J.
%
set(A) :- set(between(A)). % contains the elements that occur in s(I) between some elements of A
in(E,between(A)) :- set(between(A)), in(E,s(I)), in(F,A), in(F,s(J)),
                                                 in(G,A), in(G,s(K)), F != G, J <= I, I <= K.


% holds (logical connectives)
holds( if(X,Y)) :- st( if(X,Y)), not holds(X).
holds( if(X,Y)) :- st( if(X,Y)),     holds(Y).
holds( eq(X,Y)) :- st( eq(X,Y)),     holds(X),     holds(Y).
holds( eq(X,Y)) :- st( eq(X,Y)), not holds(X), not holds(Y).
holds(and(X,Y)) :- st(and(X,Y)), holds(X), holds(Y).
holds( or(X,Y)) :- st( or(X,Y)), holds(X).
holds( or(X,Y)) :- st( or(X,Y)), holds(Y).
holds(  neg(X)) :- st(  neg(X)), not holds(X).
%
{ assign(A,E) : in(E,B) } = 1 :- st(exists(A,B,X)).
                      in(F,A) :- st(exists(A,B,X)), assign(A,E), in(F,E).
         holds(exists(A,B,X)) :- st(exists(A,B,X)), holds(X).

% holds (relations)
holds(   empty(A)) :- st(   empty(A)), not in(_,A).
holds(nonempty(A)) :- st(nonempty(A)),     in(_,A).
%
holds(  subset(A,B)) :- st(  subset(A,B)), not in(E,A), in(E,B), in(F,B) : in(F,A).
holds(subseteq(A,B)) :- st(subseteq(A,B)), in(E,B) : in(E,A).
holds(   equal(A,B)) :- st(   equal(A,B)), in(E,A) : in(E,B); in(E,B) : in(E,A).
holds(supseteq(A,B)) :- st(supseteq(A,B)), in(E,A) : in(E,B).
holds(  supset(A,B)) :- st(  supset(A,B)), in(E,A), not in(E,B), in(F,A) : in(F,B).
holds(     in'(A,B)) :- st(     in'(A,B)), in(E,B), in(F,A) : in(F,E); in(F,E) : in(F,A).
%
holds(card(A, lt,X)) :- st(card(A, lt,X)), { in(E,A) } <  X.
holds(card(A,leq,X)) :- st(card(A,leq,X)), { in(E,A) } <= X.
holds(card(A, eq,X)) :- st(card(A, eq,X)), { in(E,A) }  = X.
holds(card(A,geq,X)) :- st(card(A,geq,X)), { in(E,A) } >= X.
holds(card(A, gt,X)) :- st(card(A, gt,X)), { in(E,A) } >  X.
holds(card(A, bw,(L,U))) :- st(card(A, bw,(L,U))), L { in(E,A) } U.
%
holds(sum(A,M, lt,X)) :- st(sum(A,M, lt,X)), #sum{ V,E : in(E,A), map(M,E,V) } <  X.
holds(sum(A,M,leq,X)) :- st(sum(A,M,leq,X)), #sum{ V,E : in(E,A), map(M,E,V) } <= X.
holds(sum(A,M, eq,X)) :- st(sum(A,M, eq,X)), #sum{ V,E : in(E,A), map(M,E,V) }  = X.
holds(sum(A,M,geq,X)) :- st(sum(A,M,geq,X)), #sum{ V,E : in(E,A), map(M,E,V) } >= X.
holds(sum(A,M, gt,X)) :- st(sum(A,M, gt,X)), #sum{ V,E : in(E,A), map(M,E,V) } >  X.
holds(sum(A,M, bw,(L,U))) :- st(sum(A,M,bw,(L,U))), L #sum{ V,E : in(E,A), map(M,E,V) } U.
%
holds(notafter(A,B)) :- st(notafter(A,B)), I <= J : in(E,A), in(E,e(I)), in(F,B), in(F,e(J)).

% it cannot be the case that a constraint does not hold
:- constraint(X), not holds(X).
%
% for debugging:
% error(X) :- constraint(X), not holds(X).
% #minimize{ 1,X: error(X) }.
% #show error/1.

% display
#show.
#show (E,e(I)) : in(E,e(I)).
#show (E,s(I)) : in(E,s(I)).

% defined
#defined  if/2.
#defined  eq/2.
#defined and/2.
#defined  or/2.
#defined   neg/1.
#defined exists/3.
%
#defined    empty/1.
#defined nonempty/1.
%
#defined   subset/2.
#defined subseteq/2.
#defined    equal/2.
#defined supseteq/2.
#defined   supset/2.
#defined      in'/2.
%
#defined card/3.
#defined  sum/4.
%
#defined notafter/2.
