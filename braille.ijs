split_into_four_by_two =: 1 3 |: ((4 %~ 0 { $) , 4 , (2 %~ 1 { $) , 2 [ ]) $ ,
braille =: [: u: 16b2800 + 2 #. 7 6 5 3 1 4 2 0 { ,
render =: [: braille"2 split_into_four_by_two

esc =: 16b1b { a.
clear =: esc , '[2J' , esc , '[H'
print =: '' [ 4 (1!:2)~ clear , 8 u: [: , LF ,"1 0~ render
print_id =: ([ [ print) @: ]:
print_with =: ([ [ (print @: [.)) @: ].

loop =: conjunction define
i =. 0
a =. y
while. 1 do.
  a =. u a
  (2!:0) 'sleep ' , ": n
end.
''
)
