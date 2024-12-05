
% constraint - the primary and secondary examination tasks for each module must be in the same semester

in(E,examinations_of_module(M)) :- in(E,W), in(W,R), map(ep,M,R).
in(E,examinations_of_module(M)) :- in(E,W), in(W,R), map(es,M,R).

or(
  empty(int(e(I),examinations_of_module(M))), 
  empty(int(e(J),examinations_of_module(M)))
) :- in(M,m), I=1..n, J=I+1..n.
