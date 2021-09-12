faster(x, y).
faster(y, z).
faster(z, m).

is_faster(X,Y) :- 
	faster(X,Y).
is_faster(X,Y) :- 
	faster(X,Z),
	is_faster(Z,Y).

f(mouse).