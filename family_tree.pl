female(mary).
female(sandra).
female(juliet).
female(lisa).
male(peter).
male(paul).
male(dick).
male(bob).
male(harry).
parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, dick).
parent(mary, sandra).


brother(X,Y):-
	parent(Z,X),
	parent(Z,Y),
	male(X),
	X \= Y.

father(X,Y):-
	parent(X,Y),
	male(X).

sister(X,Y):-
	parent(Z,Y),
	parent(Z,X),
	female(X),
	X\=Y.

grandmother(X,Y):-
	parent(X,Z),
	parent(Z,Y),
	female(X).

cousin(X,Y):-
	parent(M,X),
	parent(N,Y), 
	(
		sister(M,N) ;
		sister(N,M) ; 
		brother(M,N);
		brother(N,M)).


	