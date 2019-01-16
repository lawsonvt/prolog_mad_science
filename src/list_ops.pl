% The following represent list operations from the
% Bratko Prolog book in order to better understand them

% find if X is a member through recursive search

member(X, [X | Tail]).		% X is the head
member(X, [Head | Tail]) :-	% if not
	member(X, Tail).	% search tail

% concatenation
conc([], L, L).			% nothing in L1, then L2=L3
conc( [X|L1], L2, [X|L3]) :-	% piecewise place L1
	conc(L1,L2,L3).		% into L3

% define mebership through conc
member1(X,L) :- 
	conc(L1,[X|L2],L).

% exerice from book, define last(Item, List) 
% with and without conc
last(X, [X]).			% traverse through until we
last(X, [Head|Tail]) :-		% reach the end, check if it matches
	last(X, Tail).

lastc(X,L) :-			% last item if any list + item
	conc(L1, [X], L).	% equals original list

% add and delete
add(X, L, [X|L]).		% simple

del(X, [X|Tail], Tail).		% if head, list is tail
del(X, [Y|Tail], [Y|Tail1]) :-  % this ... is confusing 
	del(X, Tail, Tail1).

insert(X, List, BiggerList) :-		% inserting X into list to make bigger list
	del(X, BiggerList, List).	% is equivalent to removing X from bigger list to make list


% sublist through conc
sublist(S, L) :-		% sublist is a part of list
	conc(L1, L2, L),	% breakdown L into L1 and L2
	conc(S, L3, L2).	% sublist plus some L3 equals L2

% permutations of a list
permutation([],[]).		% empty list permutes to empty list

permutation([X|L], P) :- 	% breakdown list into head and tail
	permutation(L, L1),	% L1 is a permutation of L (the tail of our original list)
	insert(X, L1, P).	% then adding X to L1 gives the permutation P

% alternate form using delete
permutation2([],[]).

permutation2(L, [X|P]) :- 	% L is a permutation of some X and P
	del(X, L, L1),		% deleting X from L gives us L1
	permutation2(L1, P).	% which is a permutation of P

% Exercises from page 73

evenlength([]).			% this one is a mindfuck
				% and proves that functors do not need to be declared before use
evenlength([First|Rest]) :-
	oddlength(Rest).
oddlength([First|Rest]) :-
	evenlength(Rest).





