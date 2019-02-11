parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, pat).
parent(bob, ann).
parent(pat, jim).

female(pam).
female(liz).
female(pat).
female(ann).
male(jim).
male(tom).
male(bob).

mother(X,Y) :- parent(X,Y),
		female(X).

father(X,Y) :- parent(X,Y),
		male(X).

sibling(X,Y) :- parent(Z,Y),
		parent(Z,X),
		X \= Y.

predecessor(X,Y) :- parent(X,Y).

predecessor(X,Y) :- 
	parent(Z,Y),
	predecessor(X,Z).

