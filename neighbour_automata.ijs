NB. https://oeis.org/A072272
NB. https://oeis.org/wiki/Index_to_2D_5-Neighbor_Cellular_Automata
NB. https://arxiv.org/pdf/1503.01168.pdf

NB. For four neighbours:
rotations =: (,~ -) (,: |.) 1 0
decompose_rule =: [: |."1]: (2 #~ 2 * 5) #: [

NB. For eight neighbours:
NB.rotations =: (,~ -) (,~ |:) 1 0 ,: 1 _1
NB.decompose_rule =: [: |."1]: (2 #~ 2 * 9) #: [

NB. Run an automaton
count_neighbours =: [: +/ rotations |. ]
cell_to_index =: ] + 2 * [: count_neighbours ]
rule =: cell_to_index {"0 1 decompose_rule

NB. Given n, generate an n x n field with a single on cell in the middle
mk_seed =: (2 %~ ] + ] * ]) = [: i. 2 # ]

NB. Given n, generate an n x n field with cells all along the border
NB.surrounded =: (((0 = [ | 1 + ]) +. (0 = |) +. (] >: [ * 1 -~ [) +. >) [: i. ] , ])

NB. Paper discusses 780 and a few other rules
NB.' #' {~ 780 rule mk_seed 80

NB. Eight neighbour rule for Conway's game of life is 224
' #' {~ 224 rule^:1]: 1 12 20 21 22 e.~ i. 10 10
