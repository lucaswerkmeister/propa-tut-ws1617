shifted(S,P,C) :- integer(S), integer(P), !,
                  C is mod(P + S, 256).
shifted(S,P,C) :- integer(S), integer(C), !,
                  P is mod(C - S, 256).
shifted(S,P,C) :- integer(P), integer(C), !,
                  S is mod(C - P, 256).
shifted(_,_,_).

caesar(_, [], []).
caesar(S, [P|Ps], [C|Cs]) :- shifted(S, P, C),
                             caesar(S, Ps, Cs).

vigenere(_, [], []).
vigenere([S|Ss], [P|Ps], [C|Cs]) :- shifted(S, P, C),
                                    append(Ss, [S], NS),
                                    vigenere(NS, Ps, Cs).

subseq(S, L) :- append(_, S, X),
                append(X, _, L).

:- consult(tut8_ciphertext).

key(K) :- ciphertext(C), length(K, 8),
          subseq(`procedure`, M),
          vigenere(K, M, C).

main :- ciphertext(C),
        key(K),
        vigenere(K, M, C),
        writef("%s\nKey: %s\n", [M,K]).
