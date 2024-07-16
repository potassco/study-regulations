%
% * in(X,ep)
% * in(X,es)
% * map(ep,M,X)
% * map(es,M,X)
% * in((X,Y),d)
%

map(ep,M, ep(M)) :- in(M,m).
 in( a(M),ep(M)) :- in(M,m).
 in(aa(M), a(M)) :- in(M,m).
 in(xa(M),ep(M)) :- in(M,m).
 in(xx(M),xa(M)) :- in(M,m).
in(F,ep) :- map(ep,M,X), in(E,X), in(F,E).
%
map(es,M, es(M)) :- in(M,m).
 in( b(M),es(M)) :- in(M,m).
 in(bb(M), b(M)) :- in(M,m).
in(F,es) :- map(es,M,X), in(E,X), in(F,E).

% one of (aa(M) or xx(M)) and bb(M) at the same semester
:- in(aa(M),e(I)), not in(bb(M),e(I)).
:- in(xx(M),e(I)), not in(bb(M),e(I)).
:- not in(aa(M),e(I)), not in(xx(M),e(I)), in(bb(M),e(I)).
