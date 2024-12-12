%
% in(X,ep)
% in(X,es)
% map(ep,M,X)
% map(es,M,X)
% in((X,Y),d)
%

% ...

% regular constraints
if(
  nonempty(int(ee,expand(union(A,B)))),
  in'(int(ee,expand(A)),A)
) :- in(M,m), map(ep,M,A), map(es,M,B).
%
if(
  neg(empty(int(ee,expand(union(A,B))))),
  in'(int(ee,expand(B)),B)
) :- in(M,m), map(ep,M,A), map(es,M,B).

% temporal constraints
empty(int(e(I),e(J))) :- I = 1..n, J = 1..n, I < J.
%
if(
  subseteq(X,ee),
  exists(sk(X,Y),Y,and(
    subseteq(sk(X,Y),ee),
    notafter(sk(X,Y),X)
  ))
) :- in((X,Y),d).
