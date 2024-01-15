parent(pam, bob).	% Pam is a parent of Bob
parent(tom, bob).	
parent(tom, liz).	
parent(bob, ann).
parent(bob, pat).
parent(bob, jim).	
female(pam).		% pam is a female
male(tom).		% Tom is a male
male(bob).
female(liz).
female(ann).
female(pat).
male(jim).


mother(X, Y) :-		% X is the mother of Y if
	parent(X, Y),	% X is a parent of Y and
	female(X).	% X is female


predecessor(X, Y) :-	% Rule pr1: X is a predecessor of Y if
	parent(X, Y).	% X is a parent of Y


predecessor(X,Y) :-	% Rule pr2: X is a predecessor of Y if
	parent(X, Z),	% X is a parent of Z and
	predecessor(Z, Y).	% Z is a predecessor of Y	


grandchild(Grandchild, Grandparent) :- % Question 1
	parent(Grandparent, Child), 
	parent(Child, Grandchild).

offspring(Y, X) :- % Question 4
	parent(X, Y).

grandparent(Grandparent, Grandchild) :- % Question 5
	parent(Grandparent, Parent),
	parent(Parent, Grandchild).


sister(Sister, Person) :- % Question 6
    	female(Sister),           
    	parent(Parent, Sister),   
    	parent(Parent, Person),   
    	Sister \= Person.         


happy(Person) :- % Question 7
    	parent(Person, _).


has_two_children(Person) :- % Question 7
    	parent(Person, Child1),
    	parent(Person, Child2),
    	sister(Sister, Child1),
    	Child1 \= Child2.


grandchild(Grandchild, Grandparent) :- % Question 8
    	parent(Parent, Grandchild),
    	parent(Grandparent, Parent).


aunt(X, Y) :- % Question 9
    parent(Parent, Y),
    sister(X, Parent).
