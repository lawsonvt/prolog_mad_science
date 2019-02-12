% simple arithmetic

% greatest common denominator
% what is the greatest common denominator between X and Y

gcd(X,X,X). 	% X and Y are the same, then D is equal X

gcd(X,Y,D) :-		% X < Y, subtract X from Y and continue 
	X < Y,		% keep going until X and Y are the same
	Y1 is Y - X,
	gcd(X, Y1, D).

gcd(X,Y,D) :-		% Y < X, swap em and enter clause 2
	Y < X,
	gcd(Y, X, D).

% calculate the length of a list
% lengthy(List,N) 
% (length is a static procedure and the interpreter yelled at me when
% I tried to "modify" it)

lengthy([],0).

lengthy([_|Tail],N) :-
	lengthy(Tail, N1),
	N is 1 + N1.

% further exercises on page 85
% DO SOME, YA SLACKER!

