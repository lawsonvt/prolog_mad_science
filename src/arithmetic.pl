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

% determine the maximum of two numbers
% max(X, Y, Max)

max(X,X,Max) :-		% same value, that's the max
	Max is X.

max(X,Y,Max) :-		% X > Y, that's the max
	X > Y,
	Max is X.

max(X,Y,Max) :-		% Y > X, that's the max
	Y > X,
	Max is Y.

% my solution (above) works, but this is the book solution

max2(X,Y,X) :- 
	X >= Y.
max2(X,Y,Y) :-
	X < Y.

% determine the maximum of a list
% maxlist(List, Max)

maxlist([X], X).		% only one element, it is the max

maxlist([X, Y | Rest], Max) :-		% grab first two elements
	maxlist([Y | Rest],MaxRest),	% see if second element is greater than rest
	max(X, MaxRest, Max).		% compare first element to rest

% determine the sum of a list
% sumlist(List, Sum)

sumlist([X], X).

sumlist([X, Y | Rest], Sum) :-		% similar structure to maxlist
	sumlist([Y | Rest], SumRest),	% just adding the rest instead of comparing
	Sum is SumRest + X.

% determine if a list is ordered
% ordered(List)

ordered([X]).

ordered([X, Y | Rest]) :-
	ordered([ Y | Rest]),
	X =< Y.

