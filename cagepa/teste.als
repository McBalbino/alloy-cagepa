module uberUFCG









-----------------------------------------
--definindo contabilidade
abstract sig Contabilidade {}
one sig DEBITO, CREDITO extends Contabilidade {}

-----------------------------------------
--Definindo usuário 
abstract sig Usuario {
	contabilidade: lone Contabilidade
}
sig Passageiro in Usuario {}
sig Motorista in Usuario {}

-----------------------------------------
--Definindo corrida 
abstract sig Corrida {
	passageiros: some Passageiro,
	motorista: one Motorista
}

sig Ida extends Corrida {
	origem: one Regiao,
	horario: one HorarioDeIda
}

sig Volta extends Corrida {
	destino: one Regiao,
	horario: one HorarioDeVolta
}

-----------------------------------------
--Definindo regições
abstract sig Regiao {}
one sig CENTRO, NORTE, SUL, LESTE, OESTE extends Regiao {}

-----------------------------------------
--Definindo os Horarios
abstract sig HorarioDeIda{}
one sig _7h30, _9h30, _13h30, _15h30 extends HorarioDeIda{}

abstract sig HorarioDeVolta{}
one sig _10h00, _12h00, _16h00, _18h00 extends HorarioDeVolta{}


-----------------------------------------
--Entidades para motorista ou passageiro
sig ALUNO, PROFESSOR, SERVIDOR in Passageiro + Motorista {}


-----------------------------------------
--Definindo regras
fact Regras {

    -- O tipo de usuário só pode ser professor ou aluno ou servidor
       usuarioSoPodeSerAlunoProfessorOuServidor[]
   
    -- O usuário não pode ser um motorista e um passageiro da mesma corrida
        all c: Corrida | motoristaNaoPodeSerPassageiro[c]
   
    --Toda corrida tem, no máximo, três passageiros
        all c: Corrida | #c.passageiros <= 3 

    -- Todo usuário deve está alguma corrida
        all u: Usuario | #u.~passageiros >= 1 or #u.~motorista >= 1

    --Uma corrida só tem um motorista
        all m: Motorista | one motorista.m

    --Todo passageiro só pode  estar, no máximo, em uma ida
        all p: Passageiro | #((p.~passageiros) & Ida) <= 1

    --Todo possageiro só pode estar, no máximo, em uma volta
        all p: Passageiro | #((p.~passageiros) & Volta) <= 1
     
    --Um passageiro não pode ser um motorista em uma mesma corrida
        all c: Corrida | #(c.motorista & c.passageiros) = 0
 
    --Não pode existir os mesmos passageiros para corridas distintas de mesmo horário
        all disj d1, d2 : Ida | verificaUsuarioIda[d1,d2]
        all disj o1, o2 : Volta | verificaUsuarioVolta[o1,o2]

    -- Todo usuário possui um crédito ou um débito na contabilidade
        all u: Usuario | efetuaContabilidade[u]

}

-----------------------------------------
--Funções
fun usuariosDaCorrida[c: Corrida]: set Usuario {
	c.motorista + c.passageiros
}

-----------------------------------------
-- Predicados
pred motoristaNaoPodeSerPassageiro[c: Corrida] {
    #(c.motorista & c.passageiros) = 0
}

pred verificaUsuarioIda[i1, i2: Ida] {
	 (i1.horario = i2.horario) implies #(usuariosDaCorrida[i1] & usuariosDaCorrida[i2]) = 0
}

pred verificaUsuarioVolta[v1, v2: Volta] {
	 (v1.horario = v2.horario) implies #(usuariosDaCorrida[v1] & usuariosDaCorrida[v2]) = 0
}
pred usuarioSoPodeSerAlunoProfessorOuServidor[] {
    Usuario = ALUNO + SERVIDOR + PROFESSOR
    no ALUNO & SERVIDOR
    no ALUNO & PROFESSOR
    no SERVIDOR & PROFESSOR
}

pred efetuaContabilidade[u: Usuario] {
	(#u.~passageiros = #u.~motorista) implies no u.contabilidade
	(#u.~passageiros > #u.~motorista) implies u.contabilidade = DEBITO
	(#u.~passageiros < #u.~motorista) implies u.contabilidade = CREDITO
	
}

-----------------------------------------
--Main

pred show []{}
run show for 5