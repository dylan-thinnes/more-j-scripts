NB. Simple fibonacci step
step =: [: }. ] , (| +/)

NB. First impl
trace =: ] ,~ (step {.)
trace_fixpoint =: [: -. {. -: {:
steps =: [ trace^:(trace_fixpoint@:])^:_ [ trace ,:@:]
all_traces =: [ <@:steps"0 1]: 0 ,"0 i.
traces_cover_all =: *: = # @: ~. @: ; @: all_traces

NB. Second impl (faster)
counting_step =: >:@:{.@:] , (step }.)
cycle =: [: {. ([ counting_step^:([: * 1 { ])^:_]: 1 , step)
success =: *: = [: +/ (cycle"0 1]: 0 ,"0]: i.)

NB. Printing utilities
print =: [ [ 4 (1!:2)~ LF ,~ ":
print_if =: ] ` (] [ print@:[) @. ]

NB. Compare speeds! First line runs slower impl, second line runs faster one
result =: (print_if traces_cover_all)"0 p: i. 100
NB. result =: (print_if success)"0 p: i. 100

NB.exit 0
