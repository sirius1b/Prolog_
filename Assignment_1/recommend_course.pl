% initstatement
:- write('welcome to course recommeder').
	

% course fields ---------------------------------------
% courses
course(ff).
course(ff1).
course(ml).
course(dl).


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



suggest_course(DC,KK,HS,DES_C,SUG):-
	course(SUG),
	can_do(SUG,KK,HS,DC),
	should_do(SUG,KK,HS,DC,DES_C).

can_do(SUG,KK,HS,DC):-
	\+(
		required_skill(SUG,S),
		\+has_skill(S,HS,DC)
		),
	\+(
		required_knowledge(SUG,K),
		\+know_knowledge(K,KK,DC)
		).


should_do(SUG,KK,HS,DC,DES_C):-
	will_help(SUG,DES_C),
	\+already_know(SUG,KK,HS,DC).

will_help(SUG,DES_C):-
	(	
		career_skill(DES_C,S),
		develop_skill(SUG,S)
		);
	(	
		career_knowledge(DES_C,K),
		develop_knowledge(SUG,K)
		).

already_know(SUG,KK,HS,DC):-
	\+(
		develop_skill(SUG,S),
		\+has_skill(S,HS,DC)
		),
	\+(
		develop_knowledge(SUG,K),
		\+know_knowledge(K,KK,DC)
		).



has_skill(S,HS,DC):-
	member(S,HS) ;
	member(C,DC) , develop_knowledge(C,S).

know_knowledge(K,KK,DC):-
	member(K,KK);
	member(C,DC) , develop_knowledge(C,K).
