even(0).
even(X) :- odd(Y), X is Y+1, X>0.

odd(1).
odd(X) :- even(Y), X is Y+1, X>1.
