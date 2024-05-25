ordered_lines =: 16b2500 + 16b_24e0 16b00 16b02 16b0c 16b10 16b14 16b18 16b1c 16b24 16b2c 16b34 16b3c 16b74 16b75 16b76 16b77 {~ 0 13 14 5 15 2 3 7 12 6 1 10 4 8 9 11

next =: rev90 , 0 , ] , 1 , ] , 2 , rev270
rev90 =: 4 | 1 - ]
rev270 =: 4 | 3 - ]

dirs =: 1 0 , 0 1 , _1 0 ,: 0 _1
to_locations =: ] ,. [: }: [: +/\ 0 0 , dirs {~ ]
to_logical =: e.~ [: (#: i.) bounds
bounds =: 4 , [: }. [: >: >./

in_reverse =: 2 3 0 1 { (- dirs) |."1 2 ]
bidirectional =: +. in_reverse
render =: [: u: ordered_lines {~ 2 #."1]: 0 |: 3 0 1 2 { ]

ladder =: 20 $ 0 1
spiral =: (] # 0 1 2 3 $~ #) 2 # >: |. i. 20

NB. render bidirectional to_logical to_locations next^:3 ''

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
