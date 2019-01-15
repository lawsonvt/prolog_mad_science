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
