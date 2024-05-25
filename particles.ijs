load './braille.ijs'

NB. Enlarge a matrix to double the size, add walls
enlarge =: 2 # 2 #"1 ]
walls =: 1 ,~ 1 ,~ 1 , 1 , 1 1 ,~"1]: 1 1 ,"1 ]

NB. Define field
field_dimensions =: 100 100
field_positions =: (#: i.) field_dimensions

NB. Track state in global variable t with some diff function v
trace =: conjunction define
  t =: t v u y
  t
)
trace_init =: conjunction define
  t =: 0
  u trace v
)

NB. Move a particle
position =: {.
velocity =: {:
step =: [: (bounce_p ,: bounce_v) increment_particle
bounce_p =: position - 2 * overflow
bounce_v =: velocity * 1 -~ 2 * 0 = overflow
overflow =: (0 0 <. position) + (0 0 >. field_dimensions -~ position)
increment_particle =: +/ ,: velocity

NB. Define some particles
particle_avg_vel =: 5 5
particles_n =: 20
particles =: ? particles_n # ,: field_dimensions ,: 200 200
normalize_vel =: particle_avg_vel * 100 100 %~ 100 100 -~ ]
particles =: (position ,: [: normalize_vel velocity)"2 particles

NB. Run simulation
NB.printer =: [: walls [: enlarge field_positions e. <.@:position"2
NB.printer print_with (step"2) loop 0.01 particles

NB. Run simulation with tracing of particles
printer =: (field_positions e. <.@:position"2) trace_init +.
printer print_with (step"2) loop 0.01 particles
