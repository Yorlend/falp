greater(_, [], []) :- !.
greater(N, [H|R], [H|T]) :- 
    H > N,
    greater(N, R, T), !.
greater(N, R, [_|T]) :- greater(N, R, T).

delete(_, [], []) :- !.
delete(H, R, [H|T]) :- delete(H, R, T), !.
delete(E, [H|R], [H|T]) :- delete(E, R, T).

merge(R, [], R) :- !.
merge([H|R], [H|T], L) :- merge(R, T, L).
