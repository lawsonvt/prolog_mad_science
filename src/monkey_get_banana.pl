% The following represents a program for a monkey to get a banana
% by moving a box to the middle of the room, 
% getting on the box and grabbing the banana
%
% These are the functors for this program:
% move(State1,Move,State2): making move in State1 results in State2;
%	a state is represented by a term:
%	state(MonkeyHorizontal, MonkeyVertical, BoxPosition, HasBanana)

move( state( middle, onbox, middle, hasnot),	% monkey is on box, no nana
	grasp,					% get banana
	state( middle, onbox, middle, has) ).	% monkey has the nana! monkey wins!

move( state( P, onfloor, P, H),			% monkey and box are in same location, monkey on floor
	climb,					% monkey climbs box
	state( P, onbox, P, H) ).			% monkey is on box

move( state( P1, onfloor, P1, H),		% monkey and box are in same location
	push(P1, P2),				% monkey pushes box
	state( P2, onfloor, P2, H) ).		% monkey and box move from P1 to P2

move( state( P1, onfloor, B, H),
	walk(P1, P2),				% monkey moves from P1 to P2
	state(P2, onfloor, B, H) ).

% canget(State): monkey can get banana in state

canget(state(_,_,_,has)).			% monkey has banana

canget(State1) :- 				% No banana?
	move(State1, Move, State2),		% Move to banana and get that banana
	canget(State2).

