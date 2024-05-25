NB. Render a logical array as braille
shaped =: [: , 4 2 ,.~ 4 2 %~ $
braille_weights =: 4 2 $ 16b1 16b8 16b2 16b10 16b4 16b20 16b40 16b80
render =: [: u: 16b2800 + [: +/"1 [: +/"1 braille_weights *"2 (1 3 |: shaped $ ,)

NB. Conway's game of life iteration
rotations =: <: 3 3 #: (#~ 4 ~: ]) i. 9
neighbours =: [: +/ rotations |. ]
rule =: (3 = ]) +. ([ *. 2 = ])
NB. Alternate Dry Life version:
NB.rule =: (3 = ]) +. ((0 = [) *. 7 = ]) +. ([ *. 2 = ])
conway =: [ rule neighbours

NB. Emit a 'clear' in ANSI
ESC =: 16b1b { a.
clear =: ESC , '[2J' , ESC , '[H'

NB. Print an iteration of Conway's Game of Life to the screen
frame_duration =: 0.01
height =: 200
width =: 200
3 : 0 ''
step =. 0
field =. ? (height , width) $ 2
while. 1 do.
  (2!:1) 'sleep ' , ": frame_duration
  field =. conway field
  step =. step + 1
  footer =. LF , (": step) , LF
  4 (1!:2)~ clear , footer ,~ 8 u: , LF ,"0 1 render field
end.
)
