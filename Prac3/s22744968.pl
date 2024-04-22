% Define who is married to whom
married(peter, mary).
married(lilly, joseph).
% Define who owns which pet
ownsPet(peter, rover).
ownsPet(mary, fluffy).
ownsPet(joseph, tweety).
ownsPet(lilly, fluffy).
household(X, Y) :- married(X, Y); married(Y, X).
householdPet(O1, O2, P) :- household(O1, O2), (ownsPet(O1, P); ownsPet(O2, P)).
wanderingPet(P) :- householdPet(O1, O2, P), householdPet(A, B, P), O1 \= A, O2 \= B, O1 \= B, O2 \= A, A \= B, O1 \= O2.

% Base case: the sum of an empty list is 0
addPositives([], 0).

% Recursive case: if the head of the list is positive, add it to the sum
addPositives([H|T], Sum) :-
    H > 0,
    addPositives(T, Rest),
    Sum is H + Rest.

% Recursive case: if the head of the list is not positive, ignore it
addPositives([H|T], Sum) :-
    H =< 0,
    addPositives(T, Sum).

% Base case: the second value of an empty list or a single-element list is an empty list
getEverySecondValue([], []).
getEverySecondValue([_], []).

% Recursive case: ignore the first element and add the second element to the list
getEverySecondValue([_, H|T], [H|Rest]) :-
    getEverySecondValue(T, Rest).
    