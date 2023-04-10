max([X], X) :- !.
max([X | Y], Z) :- max(Y, Z), Z > X, !.
max([X | _], X).
