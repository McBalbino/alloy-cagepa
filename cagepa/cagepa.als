module cagepa

sig Cagepa {
    pontos: set Pontos
}

abstract sig Pontos {
    norte: set Norte,
    sul: set Sul,
    leste: set Leste,
    oeste: set Oeste
}

sig Norte, Sul, Leste, Oeste extends Pontos {
    prioridade: set Prioridade
}

fact pontosSet {
    all c: Cagepa | (#c.pontos = 4 )
    all p: Pontos | one p.~pontos
    all n: Norte | (#n.prioridade = 4)
    all s: Sul | (#s.prioridade = 4)
    all l: Leste | (#l.prioridade = 4)
    all o: Oeste | (#o.prioridade = 4)
    one Norte
    one Sul
    one Leste
    one Oeste
}


sig Bairros extends Pontos {
    hoteis: set Hoteis,
    centro: set Centro,
    hospitais: set Hospitais,
    escolas: set Escolas,
    creches: set Creches,
    casas: set Casas
}

sig Hoteis, Centro, Hospitais, Escolas, Creches, Casas extends Bairros {}


fact bairrosSet {
    --all b: Bairros | (#b.hoteis = 4)
}


abstract sig Prioridade {
    alta: set Alta,
    media: set Media,
    baixa: set Baixa,
    muitoBaixa: set MuitoBaixa
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

sig MuitoBaixa extends Prioridade {
    casas: set Casas
}

fact prioridade {
    --all a: Alta | (#a.centro = 1)
    one Alta
    one Media
    one Baixa
    one MuitoBaixa
}



--

pred show(){}

run show for 5