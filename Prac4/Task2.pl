stripNegativesAndZerosDuplicatePositives([], []).
stripNegativesAndZerosDuplicatePositives([H|T], [H,H|L]) :-
    H > 0,
    stripNegativesAndZerosDuplicatePositives(T, L).
stripNegativesAndZerosDuplicatePositives([H|T], L) :-
    H =< 0,
    stripNegativesAndZerosDuplicatePositives(T, L).
