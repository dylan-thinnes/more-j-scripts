print =: 4 (1!:2)~ 8 u: [: , LF ,~"0 1 render
render =: [: render_one chunks
render_one =: ([: u: 16b2800 + 2 #. 7 6 5 3 1 4 2 0 { ,)"2
chunks =: 1 3 |: , $~ [: , 4 2 ,.~ 4 2 %~ $

read_byte_spec =: '@' = [: ([ ;. _1~ ' ' = ])~ [: (1!:1) [: < ':' ,~ 'bleh/0x' , '0123456789abcdef' {~ 16 16 #: a. i. ]
monobit_array =: [: ,./ read_byte_spec"0

empty print monobit_array 'Hello! What game would you like to play?'
