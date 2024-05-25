print =: 4 (1!:2)~ 8 u: [: , LF ,~"0 1 render
render =: [: render_one chunks
render_one =: ([: u: 16b2800 + 2 #. 7 6 5 3 1 4 2 0 { ,)"2
chunks =: 1 3 |: , $~ [: , 4 2 ,.~ 4 2 %~ $

circle =: (|: +. ]) (|. +. ]) 22 23 14 15 26 27 e.~ i. 10 10
cross =: (|. +. ])"1 (|. +. ]) 11 22 33 44 e.~ i. 10 10
field =: ([ , |.)"1 ([ , |.) 6 6 |. ((16 > ]) +. 0 = 16 | ]) i. 16 16
project =: (_11 * [) |. [: {. (0 32 32 $ 0) ,~ ]
assemble =: field +. [: +./ (project"1 2 (circle ,: cross) $~ #)

esc =: 16b1b { a.
erase_home =: 4 (1!:2)~ esc , '[2J' , esc , '[H' [ ]

game =: 3 : 0
erase_home ''
print field
locations =: 0 2 $ 0
while. 1 do.
  input =: 1!:1]:1
  locations =: locations , ". input
  erase_home ''
  print assemble locations
end.
)
