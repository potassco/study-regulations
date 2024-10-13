s'(bm1,1). s'( bm3,1). s'( fm1,1). s'(am12,1).
s'(bm2,2). s'(am21,2). s'( pm1,2).
s'( im,3). s'( pm3,3). s'(am31,3).
s'(msc,4).
%
:- in(M,s(I)), not s'(M,I).
:- not in(M,s(I)), s'(M,I).
