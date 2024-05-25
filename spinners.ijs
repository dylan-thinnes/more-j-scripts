load './braille.ijs'

NB. Calculate normalized angle and magnitude of every point
NB. on a 100x100 cartesian plane
centered =: 50j50 -~ ([ + 0j1 * ])"0 1~ i. 100
angles =: 1 | (o. 2) %~ (o. 1) + 12 o. centered
distances =: 50 %~ 10 o. centered

NB. Parts of a chord
offset =: 0 { ]
size =: 1 { ]
speed =: 2 { ]
inner_radius =: 3 { ]
outer_radius =: 4 { ]

NB. Draw one or multiple chords
draw_chord_distance =: (distances >: inner_radius) *. (distances < outer_radius)
draw_chord_angle =: size > 1 | angles + offset + speed * [
draw_chord =: draw_chord_angle *. draw_chord_distance
draw_chords =: [: +./ draw_chord"0 1

NB. Create some interesting chords
inner_circle =: 1 1 1 0 0.1
chord1 =: 0.3 0.3 0.6 0.15 0.4
chord2 =: 0.7 0.4 _0.4 0.4 0.55
chord3 =: 0 0.6 0.8 0.55 0.7
outer_triple =: (0.94 0.3 , 0.56 0.3 ,: 0.2 0.2) ,"1]: _0.5 0.7 0.85
outer_circle =: 1 1 1 0.94 0.98
chords =: inner_circle , chord1 , chord2 , chord3 , outer_triple , outer_circle

NB. Render them on a loop with timestep = 0.01 at 100 steps per second
(chords draw_chords~ ]) print_with (0.01 + ]) loop 0.01]: 0
