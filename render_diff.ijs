NB. loop takes two functions u, v and runs u until v returns 0, or fixpoint
loop =: conjunction define
a =. y
i =. 0
b =. y
while. (i v a) *. (0 = i) +. (-. a -: b) do.
  b =. a
  a =. i u a
  i =. i + 1
end.
a
)

NB. Printf with padding being 0 instead of spaces
zero_pad =: [: (('0' ,.~ ]) {~"1 0 ' ' = ]) ":

NB. Calculate stats
filename =: 'out-' , (5 zero_pad 0 { [) , '-' , (5 zero_pad 1 { [) , '.' , ]
stats =: [: +/ 0 1 2 3 ="1 0 ,
save_stats =: <@:[ (1!:2)~ LF ,~ [: ": stats@:]

NB. Diff
diff =: + +:
diff_to_rgb =: 255 * 1 2 3 ="1 0 ]

NB. Render n x m x 3 array to a PPM with file name
header =: 'P6 ' , [: ": 255 ,~ 1 0 { $
body =: [: a. & ({~) ,
render_n =: <@:[ (1!:2)~ header@:] , LF , body@:]

NB. Sleep functions
thensleep =: conjunction def 'u [ [: delay n [ ]'
delay =: monad def '(2!:1) ''sleep '' , ": y'

NB. Wolfram indexing
rotations =: <: 3 3 #: i. 9
rule =: decompose @: [ {~ index @: ]
decompose =: [: |. (2 $~ 9 * 2) #: ]
index =: ] + 2 * neighbours
neighbours =: ] -~ [: +/ rotations |. ]

NB. Create N x N field with a single on in the middle
field =: (2 %~ ] + *:) = [: i. ] , ]

NB. Run 
render =: adverb define
wolfram =. m
out =: wolfram rule^:2 y
d =: y diff out
((x , wolfram) filename 'stats') save_stats d
('rawoutput2') render_n diff_to_rgb d
out
)

run =: monad define
for_i. i. 1000 do.
  i render loop (500 > [) field 500
end.
)
