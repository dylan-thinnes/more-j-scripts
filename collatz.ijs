collatz =: (2 %~ ]) ` (1 + 3 * ]) @. (2 | ])
collatz_orbit =: ([ , [: collatz {:) ^: (1 < {:) ^: _
