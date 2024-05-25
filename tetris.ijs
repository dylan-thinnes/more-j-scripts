print =: 4 (1!:2)~ 8 u: [: , LF ,~"0 1 render
render =: [: render_one chunks
render_one =: ([: u: 16b2800 + 2 #. 7 6 5 3 1 4 2 0 { ,)"2
chunks =: 1 3 |: , $~ [: , 4 2 ,.~ 4 2 %~ $

esc =: 16b1b { a.
erase_home =: 4 (1!:2)~ esc , '[2J' , esc , '[H' [ ]

flip =: [: |. |."1
field_top_left =: 12 (> +. 0 = |) i. 22 12
field =: (+. flip) field_top_left

project =: (_1 _1 - [) |. [: {. (0 22 12 $ 0) ,~ ]

tpiece =: 1 3 4 5 e.~ i. 3 3
opiece =: 2 2 $ 1
ipiece =: 4 5 6 7 e.~ i. 4 4
lpiece =: 1 4 7 8 e.~ i. 3 3
jpiece =: 1 4 6 7 e.~ i. 3 3
zpiece =: 1 3 4 6 e.~ i. 3 3
spiece =: 0 3 4 7 e.~ i. 3 3

game =: 0 4 ; spiece
modify_head =: ((]: &. > {.) , }.@:])
step =: + modify_head
render_game =: [: print project&.>/

loop =: adverb define
a =. y
while. 1 do. a =. u y end.
)

NB. sleep =: [: 2!:1 'sleep ' , ":
NB. (([ print) 1 step [ [: sleep 1 [ ])
