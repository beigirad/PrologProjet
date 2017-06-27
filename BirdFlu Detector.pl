% 
%	BirdFlu Detector
%
%	Use ?- go. to lunch.
% 

header:-
	write('BirdFlu Detector'),nl,
	write('Answer this questions.'),nl.

disease:-
		symptom(fever),
		symptom(pain_in_muscle),
		symptom(coughing),
		symptom(headache),
		symptom(sneezing).

symptom(S):-asking('Do you have',S).

asking(Que, S):-known(Que, S, true),!.
asking(Que, S):-known(Que, S, false),!, fail.
asking(Que, S):-nl,
	write(Que),write(' '),write(S) , write(' ? (yes/no)'),nl, 
	read(Resp), !,
	(
		(Resp=yes,assert(known(Que, S, true)));(assert(known(Que, S, false)),fail)
	).
			
detect:-
	disease,!,nl,
	write('I believe you have birdflu disease.').

detect:- nl, 
	write('Sorry,You don''t have birdflu disease.').

go:-
	header,
	repeat, 
	abolish(known/3),
	dynamic(known/3),
	retractall(known/3),
	detect,nl,nl,
	write('Try again ? (yes/no)'),nl,
	read(Resp),
	\+ Resp=yes,nl,
	write('Thanks for using this system.'),
	abolish(known,3) .