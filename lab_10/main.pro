r_fact(N, R, A) :- N > 1, !, NewN is N - 1, NewA is A * N, r_fact(NewN, R, NewA).
r_fact(_, R, A) :- R = A.
fact(N, R) :- r_fact(N, R, 1).

rec_fib(N, F1, F2, R) :- N > 2, !, NewF1 = F2, NewF2 is F1 + F2, NewN is N - 1, rec_fib(NewN, NewF1, NewF2, R).
rec_fib(_, _, B, R) :- R = B.
fib(N, R) :- rec_fib(N, 1, 1, R).