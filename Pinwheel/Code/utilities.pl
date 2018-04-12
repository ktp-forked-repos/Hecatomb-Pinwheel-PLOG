firstUserChoice(Option) :-	
	nl, write('Escolha por favor o que deseja fazer:'), nl, nl,
	write('1 - Encontrar uma solucao para o problema.'), nl,
	write('2 - Gerar uma nova versao do problema.'), nl,
	write('3 - Voltar ao menu inicial.'), nl, nl,
	repeat,
	write('Opcao (entre 1 e 3) = '),
	read(Option), checkFirstUserChoice(Option).
	
checkFirstUserChoice(1).
checkFirstUserChoice(2).
checkFirstUserChoice(3) :- start.
checkFirstUserChoice(_)
	:- nl, write('!!! ERRO !!! Opcao invalida, deve ser um numero entre 1 e 3. Por favor escolha novamente!'), nl, nl, false.
	
secondUserChoice :-	
	nl, write('Esta solucao agrada-lhe?:'), nl, nl,
	write('1 - Sim!'), nl,
	write('2 - Nao, desejo outra solucao.'), nl, nl,
	repeat,
	write('Opcao (entre 1 e 2) = '),
	read(Option), !, checkSecondUserChoice(Option).
	
checkSecondUserChoice(1) :- niceExit.
checkSecondUserChoice(2) :- reset_timer, fail.
checkSecondUserChoice(A)
	:- A \= 1, A \= 2, nl, write('!!! ERRO !!! Opcao invalida, deve ser um numero entre 1 e 2. Por favor escolha novamente!'), nl, nl, secondUserChoice.
	
% Predicado para sair do programa, imprimindo a respetiva mensagem no ecrã.
abruptExit :- 
	nl, write('--------------------------------------------------------------------'), nl,
	write('O programa vai agora fechar. Para abri-lo novamente escreva ''start.'''),
	nl, write('--------------------------------------------------------------------'),nl, nl, abort.
	
niceExit :- 
	nl, write('---------------------------------------------------------------------------'), nl,
	write('Obrigado por usar o nosso programa! Para abri-lo novamente escreva ''start.'''),
	nl, write('---------------------------------------------------------------------------'),nl, nl, abort.
	
initializeRandomSeed:-
	now(Usec), Seed is Usec mod 30269,
	getrand(random(X, Y, Z, _)),
	setrand(random(Seed, X, Y, Z)), !.
	
reset_timer :- statistics(walltime,_).	
print_time :-
	statistics(walltime,[_,T]),
	TS is ((T//10)*10)/1000,
	nl, write('Solution Time: '), write(TS), write('s'), nl, nl.