%
% * in(X,ep)
% * in(X,es)
% * map(ep,M,X)
% * map(es,M,X)
% * in((X,Y),d)
%
% '%\*' means "madeup - no such data on PULS"

%bm1
map(ep,bm1,ep_bm1).
in(ep_bm1_01,ep_bm1). 
in((ep_bm1__109128;ep_bm1__209128),ep_bm1_01).

map(es,bm1,es_bm1).
in(es_bm1_01,es_bm1).
in((es_bm1__119128;es_bm1__219128),es_bm1_01).


%bm2
map(ep,bm2,ep_bm2).
in(ep_bm2_01,ep_bm2). 
in(ep_bm2__208555,ep_bm2_01).

map(es,bm2,es_bm2).
in(es_bm2_01,es_bm2). 
in((es_bm2__218555;es_bm2__318555),es_bm2_01).


%bm3
map(ep,bm3,ep_bm3).
in(ep_bm3_01,ep_bm3). 
in(ep_bm3__109555,ep_bm3_01).

map(es,bm3,es_bm3).
in(es_bm3_01,es_bm3). 
in((es_bm3__119555;es_bm3__219555;es_bm3__319555;es_bm3__419555),es_bm3_01).


%pm1
map(ep,pm1,ep_pm1).
in(ep_pm1_01,ep_pm1). 
in(ep_pm1__116228,ep_pm1_01). %\*

map(es,pm1,es_pm1).
in(es_pm1_01,es_pm1).
in(es_pm1__116228,es_pm1_01).


%pm2
map(ep,pm2,ep_pm2).
in(ep_pm2_01,ep_pm2). 
in(ep_pm2__117228,ep_pm2_01). %\*

map(es,pm2,es_pm2).
in(es_pm2_01,es_pm2).
in(es_pm2__117228,es_pm2_01).


%pm3
map(ep,pm3,ep_pm3).
in(ep_pm3_01,ep_pm3). 
in(ep_pm3__113655,ep_pm3_01). %\*

map(es,pm3,es_pm3).
in(es_pm3_01,es_pm3).
in(es_pm3__113655,es_pm3_01).


%am11
map(ep,am11,ep_am11).
in(ep_am11_01,ep_am11). 
in(ep_am11__112228,ep_am11_01). %\*

map(es,am11,es_am11).
in(es_am11_01,es_am11).
in(es_am11__112228,es_am11_01).


%am12
map(ep,am12,ep_am12).
in(ep_am12_01,ep_am12). 
in(ep_am12__113228,ep_am12_01). %\*

map(es,am12,es_am12).
in(es_am12_01,es_am12).
in(es_am12__113228,es_am12_01).



%am21
map(ep,am21,ep_am21).
in(ep_am21_01,ep_am21).
in(ep_am21__114228,ep_am21_01). %\*

map(es,am21,es_am21).
in(es_am21_01,es_am21).
in(es_am21__114228,es_am21_01).

%am22
map(ep,am22,ep_am22).
in(ep_am22_01,ep_am22). 
in(ep_am22__115228,ep_am22_01). %\*

map(es,am22,es_am22).
in(es_am22_01,es_am22).
in(es_am22__115228,es_am22_01).

%am31
map(ep,am31,ep_am31).
in(ep_am31_01,ep_am31).
in(ep_am31__111655,ep_am31_01). %\*

map(es,am31,es_am31).
in(es_am31_01,es_am31).
in(es_am31__111655,es_am31_01).

%am32
map(ep,am32,ep_am32).
in(ep_am32_01,ep_am32).
in(ep_am32__112655,ep_am32_01). %\*

map(es,am32,es_am32).
in(es_am32_01,es_am32).
in(es_am32__112655,es_am32_01).

%fm1
map(ep,fm1,ep_fm1).
in(ep_fm1_01,ep_fm1).
in(ep_fm1__100228,ep_fm1_01). %\*

map(es,fm1,es_fm1).
in(es_fm1_01,es_fm1).
in((es_fm1__110228;es_fm1__210228),es_fm1_01).

%fm2
map(ep,fm2,ep_fm2).
in(ep_fm2_01,ep_fm2).
in(ep_fm2__100655,ep_fm2_01).

map(es,fm2,es_fm2).
in(es_fm2_01,es_fm2).
in((es_fm2__110655;es_fm2__210655),es_fm2_01).

%fm3
map(ep,fm3,ep_fm3).
in(ep_fm3_01,ep_fm3).
in(ep_fm3__010228,ep_fm3_01).

map(es,fm3,es_fm3).
in(es_fm3_01,es_fm3).
in((es_fm3__111228;es_fm3__211228),es_fm3_01).

%im
map(ep,im,ep_im).
in(ep_im_01,ep_im).
in(ep_im__118228,ep_im_01). %\*
%-
map(es,im,es_im).
in(es_im_01,es_im).
in(es_im__118228,es_im_01).

%msc
map(ep,msc,ep_msc).
in(ep_msc_01,ep_msc).
in(ep_msc,ep_msc_01). %\*

map(es,msc,es_msc).
in(es_msc_01,es_msc).
in(es_msc,es_msc_01). %\*

%Ep and Es
in(F,ep) :- map(ep,_,X), in(E,X), in(F,E).
in(F,es) :- map(es,_,X), in(E,X), in(F,E).


%d
%bm1 
in(es_bm1_01,d_bm1).
in((ep_bm1_01,d_bm1),d).

%bm2
in(es_bm2_01,d_bm2).
in((ep_bm2_01,d_bm2),d).


% constraint - the primary and secondary examination tasks for each module must be in the same semester
:- in(Ep,e(I)), not in(Es,e(I)), 
    in(Ep,W), in(W,R), 
    map(es,M,R), 
    in(Es,W'), in(W',R'), 
    map(ep,M,R').
    
:- not in(Ep,e(I)), in(Es,e(I)), 
    in(Ep,W), in(W,R), 
    map(es,M,R), 
    in(Es,W'), in(W',R'), 
    map(ep,M,R').
