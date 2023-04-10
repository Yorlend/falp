father(ivan, petya).
father(petya, vasya).
father(nastya, grisha).

mother(ivan, nastya).
mother(petya, lera).
mother(nastya, masha).

parent(X, Y) :- 	 father(X, Y); mother(X, Y).
grandfather(X, Y) :- parent(X, Z), father(Z, Y).
grandmother(X, Y) :- parent(X, Z), mother(Z, Y).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

allgrandfathers(X, L) :- findall(Name, grandfather(X, Name), L).
allgrandmothers(X, L) :- findall(Name, grandmother(X, Name), L).
allgrandparents(X, L) :- findall(Name, grandparent(X, Name), L).

grandmothermline(X, Y) 	:-      mother(X, Z), mother(Z, Y), !.
grandparentsmline(X, GF, GM) :- mother(X, M), father(M, GF), mother(M, GM), !.

max(A, A, B) :- A >= B, !.
max(B, _, B).

max(A, B, C, A) :- A >= B, A >= C, !.
max(_, B, C, B) :- B >= C, !.
max(_, _, C, C).

max([X], X) :- !.
max([X | Y], Z) :- max(Y, Z), Z > X, !.
max([X | _], X).
