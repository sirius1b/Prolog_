:- write('Hello, have a beautiful day!').
% 3.1 
distance((A,B),(C,D),X) :- X is sqrt((A -C)**2 + (B - D)**2).

% 3.2
print_L(0,_).
print_L(N,C):- 
	X is N-1,
	write(C),
	print_L(X,C).

print_M(_,0,_).
print_M(N,M,C):-
	X1 is M-1,
	print_L(N,C),
	nl,
	print_M(N,X1,C).

square(N,C):-
	print_M(N,N,C).


% 3.3
%% fib(Y,X) :- (Y =:= 1 ; Y =:= 2 ) ,X = 1 .
fib(1,X) :- X = 1.
fib(2,X) :- X = 2.
fib(Y,X) :-  
	Y > 2, 
	Y1 is Y - 1,
	Y2 is Y - 2 ,
	fib(Y1,X1),
	fib(Y2,X2),
	X is X1 + X2.



