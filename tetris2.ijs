load 'braille.ijs'

esc =: 16b1b { a.
clear =: esc , '[2J' , esc , '[H'
print =: 4 (1!:2)~ clear , 8 u: [: , LF ,~"0 1 render

tpiece =: 1 3 4 5 e.~ i. 3 3
opiece =: 2 2 $ 1
ipiece =: 4 5 6 7 e.~ i. 4 4
lpiece =: 1 4 7 8 e.~ i. 3 3
jpiece =: 1 4 6 7 e.~ i. 3 3
zpiece =: 1 3 4 6 e.~ i. 3 3
spiece =: 0 3 4 7 e.~ i. 3 3

pieces =: tpiece ; opiece ; ipiece ; lpiece ; jpiece ; zpiece ; spiece
offsets =: 0 4 ; 0 4 ; 1 3 ; 0 4 ; 0 4 ; 0 4 ; 0 4

rot0 =: ]
rot90 =: |:@:|.
rot180 =: |."1@:|.
rot270 =: |.@:|:
rot =: (rot0@:]) ` (rot90@:]) ` (rot180@:]) ` (rot270@:]) @. [

flip =: [: |. |."1
walls_top_left =: 12 (> +. 0 = |) i. 22 12
walls =: (+. flip) walls_top_left

project_image =: (_1 _1 - [) |. [: {. (0 22 12 $ 0) ,~ ]
project_field =: ([: - [) |. [: {. (0 20 10 $ 0) ,~ ]

random_piece_with_offset =: (< 0) ,~ [: (; offsets {~ ]) [: ? 7:
init_state =: random_piece_with_offset ; 20 10 $ 0:

field =: 1 pick ]
field_in_image =: 0 0 project_image field
piece_in_field =: ((1 pick ]) project_field (2 pick ]) rot pieces pick~ 0 pick ])@:(0 pick ])
piece_in_image =: ((1 pick ]) project_image (2 pick ]) rot pieces pick~ 0 pick ])@:(0 pick ])
print_hi_res =: [: empty [: print 8 #"1]: 8 # ]
print_state =: [: print_hi_res walls +. field_in_image +. piece_in_image

state =: init_state ''

shift_piece_right =: ((0 ; 0 1 ; 0) +&.>"0 ])&.>@:{. , }.
shift_piece_left =: ((0 ; 0 _1 ; 0) +&.>"0 ])&.>@:{. , }.
shift_piece_down =: ((0 ; 1 0 ; 0) +&.>"0 ])&.>@:{. , }.
rotate_piece =: (}: , (4 | 1 + ])&.>@:{:)&.>@:{. , }.
lock_piece =: random_piece_with_offset ; [: clear_lines field +. piece_in_field

full_lines_count =: [: +/ *./"1
not_full_lines =: [: -. *./"1
clear_lines =: (0 $~ 10 ,~ full_lines_count) , not_full_lines # ]

collided =: [: +./ [: +./ (field_in_image *. piece_in_image [ ]) +. piece_in_image *. walls [ ]

move_right =: ]`[@.(collided@:]) shift_piece_right
move_left =: ]`[@.(collided@:]) shift_piece_left
move_up =: ]`[@.(collided@:]) rotate_piece
move_down =: ]`(lock_piece@:[)@.(collided@:]) shift_piece_down

arrow_A =: verb def 'print_state state =: move_up state'
arrow_B =: verb def 'print_state state =: move_down state'
arrow_C =: verb def 'print_state state =: move_right state'
arrow_D =: verb def 'print_state state =: move_left state'
tick =: verb def 'print_state state =: move_down state'
