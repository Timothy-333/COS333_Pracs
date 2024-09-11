married(peter, mary).
married(lilly, joseph).
ownsPet(peter, rover).
ownsPet(mary, fluffy).
ownsPet(joseph, tweety).
ownsPet(lilly, fluffy).

household(X,Y) :- married(X,Y); married(Y,X).
householdPet(O1,O2,P) :- household(O1,O2), (ownsPet(O1,P); ownsPet(O2,P)).
wanderingPet(P) :- householdPet(X,Y,P), householdPet(A,B,P), not(X=A), not(Y=B), not(X=B), not(Y=A).
addPositives([],0).
addPositives([H|T], Sum) :-
    H > 0,
    addPositives(T, R),
    Sum is H + R.
addPositives([H|T], Sum) :-
    H =< 0,
    addPositives(T, Sum).

getEverySecondValue([], []).
getEverySecondValue([_],[]).
getEverySecondValue([_,H|T],[H|Rest]) :-
    getEverySecondValue(T,Rest).

father(bill, jake).
father(bill, shelley).
father(jake, ted).
father(ron, liz).
mother(mary, jake).
mother(mary, shelley).
mother(janet, ted).
mother(shelley, liz).

sibling(X,Y) :- ((father(Z,X), father(Z,Y)); (mother(Z,X), mother(Z,Y))), not(X = Y).
uncleAunt(X,Y) :- sibling(X,Z), (father(Z,Y); mother(Z,Y)).

getPositiveValues([],[]).
getPositiveValues([_],[]).
getPositiveValues([H|T], L2) :-
    H < 0,
    getPositiveValues(T, L2).
getPositiveValues([H|T], [H|L2]) :-
    H >= 0,
    getPositiveValues(T, L2).

sumNonNegativeValues([],0).
sumNonNegativeValues([_],0).
sumNonNegativeValues([H|T], X) :-
    H >= 0,
    sumNonNegativeValues(T, Rest),
    X is H + Rest.
sumNonNegativeValues([H|T], X) :-
    H < 0,
    sumNonNegativeValues(T, X).

stripOccurrences(_, [], []).
stripOccurrences(X, [H|T], L2) :-
    X = H,
    stripOccurrences(X, T, L2).
stripOccurrences(X, [H|T], [H|L2]) :-
    not(X = H),
    stripOccurrences(X, T, L2).

doubleNonMatching([], _, []).
doubleNonMatching([H|T], X, [R|L2]) :-
    not(X = H),
    doubleNonMatching(T, X, L2),
    R is H * 2.
doubleNonMatching([H|T], X, [H|L2]) :-
    X = H,
    doubleNonMatching(T, X, L2).

