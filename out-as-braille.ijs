load 'braille.ijs'
input =: (1!:1) < 'out.ppm'
bytes =: 15 }. input
pixels =: a. i. {."1]: 480 640 3 $ bytes
chunks =: 1 3 |: , @: ] $~ [: , [ ,.~ [ %~ $ @: ]
average =: +/ % #
quantized =: average"1 average"1]: 5 5 chunks pixels
range =: {:@:[ {. {.@:[ }. ]
range2d =: (2 {. [) range"1 (2 }. [) range ]
print 248 212 155 300 range2d 95 < pixels
NB. print 44 48 30 64 range2d 95 < quantized
exit 0
