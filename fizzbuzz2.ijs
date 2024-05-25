words =: 'Fizz' ; 'Buzz' ; 'Quux' ; 'Ping'

fizz =: 0 = 3 | ]
buzz =: 0 = 5 | ]
quux =: 0 = 7 | ]
ping =: 1 p: ]
specs =: fizz ` buzz ` quux ` ping

run =: [: ; (words , <@":) #~ [: (, 0 = +/) specs `: 0
