module cagepa

sig Cagepa {
    pontos: set Pontos
}

abstract sig Pontos {
    
}

sig Norte extends Pontos {
    norte: set Norte
}

sig Sul extends Pontos {
    sul: set Sul
}

sig Leste extends Pontos {
    leste: set Leste
}

sig Oeste extends Pontos {
    oeste: set Oeste
}

fact pontos {
    all c: Cagepa | (#c.pontos = 4 )
    all p: Pontos | one p.~pontos
    one Norte
    one Sul
    one Leste
    one Oeste
}

sig Hoteis, Centro, Hospitais, Escolas, Creches, Casas {}

sig Bairros extends Pontos {
    hoteis: set Hoteis,
    centro: set Centro,
    hospitais: set Hospitais,
    escolas: set Escolas,
    Creches: set Creches,
    casas: set Casas
}



fact bairros {
    
}


abstract sig Prioridade {

}

sig Alta extends Prioridade {
    centro: set Centro,
    hoteis: set Hoteis
}

sig Media extends Prioridade {
    hospitais: set Hospitais
}

sig Baixa extends Prioridade {
    escolas: set Escolas,
    creches: set Creches
}

sig MuitaBaixa extends Prioridade {
    casas: set Casas
}





--

pred show(){}

run show for 5