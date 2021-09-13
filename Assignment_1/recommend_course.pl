% initstatement
:- write('welcome to course recommeder').

run :- generate_advice.


%% generate_advice:- course_list.


generate_advice:- 
	write('Please enter your academic program(bTECH,mTECH,pHD)'), nl,
	read(PROGRAM), nl,
	course_list, nl,
	write('Input the list of courses you have done from the above options'), nl,
	read(DC), nl,
	skill_list, nl,
	write('Input the list of skills you possess from the above options'), nl,
	read(HS), nl,
	knowledge_list, nl,
	write('Input the list of things you have knowledge in from the above options'), nl,
	read(KK), nl, 
	career_list, nl,
	write('Input your desired career option from the given options'), nl,
	read(DES_C), nl,
	suggest_course(PROGRAM,DC,KK,HS,DES_C,SUG).
/*
:- write('Please enter the list of courses you have done yet '), read(DC).
:- write('Anything you know other than courses ')
*/

course_list:-
	(course_name(X,Y),
	write('course: '),
	write(X), write(', course_name: '),
	write(Y),  nl, var(X))
	; true .

knowledge_list:-
	((develop_knowledge(_,K) ; 
	required_knowledge(_,K) ;
	career_knowledge(_,K)),
	write('Knowledge: '), write(K), nl , var(K))
	; true.

skill_list:-
	((develop_skill(_,K) ; 
	required_skill(_,K);
	career_skill(_,K)),
	write('Skill: '), write(K), nl, var(K))
	; true.	

career_list:-
	(career(X),
	write('Career: '), 
	write(X), nl, var(K))
	; true.

% course fields ---------------------------------------
% courses
course(ff).
course(ff1).
course(ml).
course(dl).

%course program
course_program(ff,bTECH).
course_program(ff,mTECH).
course_program(ml,mTECH).
course_program(ml,bTECH).
course_program(dl,mTECH).


% course name
course_name(ff,foundation_of_finance).
course_name(ff1,foundation_of_finance).
course_name(ml,machine_learning).
course_name(dl,deep_learning).

% develop knowledge
develop_knowledge(ff,finance).
develop_knowledge(ff,time_value_of_money).

develop_knowledge(ml,ai).
develop_knowledge(dl,deep_learning).


develop_knowledge(ff1,finance1).
develop_knowledge(ff1,time_value_of_money).

% develop skill
develop_skill(ff,calculator).
develop_skill(ff1,calculator).
develop_skill(ff1,excel).

develop_skill(ml,machine_learning).
develop_skill(dl,ai).


% required skill
required_skill(ff,basic_maths).
required_skill(ff,excel).
% required_skill(ff1,basic_maths).
% required_skill(ff1,excel).

% required knowledge
required_knowledge(ff,interest).

% required_knowledge(ff1,interest).


% course fields ---------------------------------------


% career field  ---------------------------------------
% career name
career(data_scientist).

% career skill
career_skill(data_scientist, python).
career_skill(data_scientist, excel).
career_skill(data_scientist, ai).
career_skill(data_scientist, machine_learning).

% career knowledge
career_knowledge(data_scientist,data_science).
career_knowledge(data_scientist,deep_learning).

% career field  ---------------------------------------


suggest_course(PROGRAM,DC,KK,HS,DES_C,SUG):-
	course(SUG),
	course_program(SUG,PROGRAM),
	can_do(SUG,KK,HS,DC),
	should_do(SUG,KK,HS,DC,DES_C,S,K),
	write('You should take '), 
	write(SUG),  
	(
		\+var(S), nl, write('as it will help you develop skill of  '), write(S)  ;
		\+var(K), nl, write('as it will help you learn about '), write(K)

	).

/*
can_do(SUG,KK,HS,DC):-
	\+(
		required_skill(SUG,S),
		\+has_skill(S,HS,DC)
		),
	\+(
		required_knowledge(SUG,K),
		\+know_knowledge(K,KK,DC)
		).
*/
can_do(SUG,KK,HS,DC):-
	(
		\+required_skill(SUG,S);
		has_skill(S,HS,DC)
		),
	(
		\+required_knowledge(SUG,K);
		know_knowledge(K,KK,DC)
		).	


should_do(SUG,KK,HS,DC,DES_C,S,K):-
	will_help(SUG,DES_C,S,K),
	\+already_know(SUG,KK,HS,DC).

will_help(SUG,DES_C,S,K):-
	(	
		career_skill(DES_C,S),
		develop_skill(SUG,S)
		);
	(	
		career_knowledge(DES_C,K),
		develop_knowledge(SUG,K)
		).

/*
will_help(SUG,DES_C):-
	(	
		career_skill(DES_C,S),
		develop_skill(SUG,S)
		);
	(	
		career_knowledge(DES_C,K),
		develop_knowledge(SUG,K)
		).
*/

/*
already_know(SUG,KK,HS,DC):-
	\+(
		develop_skill(SUG,S),
		\+has_skill(S,HS,DC)
		),
	\+(
		develop_knowledge(SUG,K),
		\+know_knowledge(K,KK,DC)
		).
*/

already_know(SUG,KK,HS,DC):-
	(
		\+develop_skill(SUG,S);
		has_skill(S,HS,DC)
		),
	(
		\+develop_knowledge(SUG,K);
		know_knowledge(K,KK,DC)
		).


has_skill(S,HS,DC):-
	member(S,HS) ;
	member(C,DC) , develop_knowledge(C,S).

know_knowledge(K,KK,DC):-
	member(K,KK);
	member(C,DC) , develop_knowledge(C,K).
