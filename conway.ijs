NB. rule =: (1 3 , 0 3 ,: 1 4) e.~ ,
NB. rule =: [: +./ (1 , [) *. 3 4 = ]
NB. rule =: (1 , [ , 0:) {~ 3 4 i. ]

rule =: (3 = ]) +. [ *. 4 = ]
convolve =: [: +/ (<: 3 3 #: i. 9) |. ]
step =: rule"0 convolve

glider =: 1 7 10 11 12 e.~ i. 5 5

NB. +./"1 ((0 1 <:"1 0 ]) *."1 (3 4 ="1 0 conv)) glider
