ordered_lines =: 16b2500 + 16b_24e0 16b00 16b02 16b0c 16b10 16b14 16b18 16b1c 16b24 16b2c 16b34 16b3c 16b74 16b75 16b76 16b77 {~ 0 13 14 5 15 2 3 7 12 6 1 10 4 8 9 11
deltas =: _1 0 , 0 1 , 1 0 ,: 0 _1
adjacencies =: [: +/ 1 2 4 8 *"0 2 (*."2 deltas |. ])
joined =: [: u: ordered_lines {~ adjacencies

dirs =: 1 0 , 0 1 , _1 0 ,: 0 _1
to_locations =: [: +/\ 2 # 0 0 , dirs {~ ]
to_logical =: e.~ [: (#: i.) bounds
bounds =: [: >: >./
next =: rev90 , 0 , ] , 1 , ] , 2 , rev270
rev90 =: 4 | 1 - ]
rev270 =: 4 | 3 - ]

pad =: _1 _1 |. [: {. (,: 0 $~ 2 + $)
field =: pad to_logical to_locations next^:4 ''

NB. joined field
