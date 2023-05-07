man('Petya').
man('Vasya').
man('Vitya').
man('Tolya').
man('Kolya').
%# man('Senya').

woman('Nadya').
woman('Sveta').
woman('Galya').
woman('Luda').
woman('Lida').
woman('Natasha').

%# relation(child, parent).
mother('Galya', 'Nadya').
mother('Vitya', 'Nadya').
mother('Luda', 'Sveta').
mother('Lida', 'Sveta').
mother('Tolya', 'Sveta').
mother('Kolya', 'Luda').

father('Galya', 'Petya').
father('Vitya', 'Petya').
father('Luda', 'Vasya').
father('Lida', 'Vasya').
father('Tolya', 'Vasya').
father('Kolya', 'Vitya').

%# mrariage(husband, wife)
marriage('Petya', 'Nadya').
marriage('Vasya', 'Sveta').
marriage('Vitya', 'Luda').
marriage('Kolya', 'Natasha').


%# вспомогательные связи
%# X is sister of Y
sister(X, Y) :- woman(X), mother(X, M), mother(Y, M), X \== Y.
brother(X, Y) :- man(X), mother(X, M), mother(Y, M), X \== Y.

%# пять типов родственных связей

%# свояченица (сестра жены)
svoyachenitsa(X, Y) :- marriage(Y, W), sister(X, W).

%# свекровь (мать мужа)
svekrov(X, Y) :- marriage(M, Y), mother(M, X).

%# шурин (брат жены)
shurin(X, Y) :- marriage(Y, W), brother(X, W).

%# золовка (сестра мужа)
zolovka(X, Y) :- marriage(M, Y), sister(X, M).

%# сноха (жена сына по отношению к его отцу)
snoha(X, Y) :- marriage(M, X), father(M, Y).

%# бабушка энного порядка

nBabushka(X, Y, N) :- N > 1, mother(X, Z), nBabushka(Z, Y, N-1).
nBabushka(X, Y, N) :- mother(X, Y).
