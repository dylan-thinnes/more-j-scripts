load './braille.ijs'

NB. Generate positions for a hilbert curve
step =: rev90 , 0 , ] , 1 , ] , 2 , rev270
rev90 =: 4 | 1 - ]
rev270 =: 4 | 3 - ]
dirs =: 1 0 , 0 1 , _1 0 ,: 0 _1
hilbert_positions =: +/\ 0 0 , dirs {~ 2 # step^:6 ''

NB. Field into which curve will be drawn
field =: ((#: i.) 128 128)

NB. Draw hilbert curve
print field e. hilbert_positions
exit 0
