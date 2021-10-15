module cagepa

sig Cagepa {
    pontos: set Pontos
}

abstract sig Pontos {
    
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

abstract sig BairrosAlta {
    hoteis: set Hoteis,
    centro: set Centro
    --hospitais: set Hospitais
    --escolas: set Escolas,
    --creches: set Creches,
    --casas: set Casas
}

abstract sig BairrosMedia {
    hospitais: set Hospitais
}

abstract sig BairrosBaixa {
    escolas: set Escolas,
    creches: set Creches
}

abstract sig BairrosMuitoBaixa {
    casas: set Casas
}


sig Hoteis, Centro, Hospitais, Escolas, Creches, Casas {}


fact bairrosSet {
    --all c: Cagepa | (#c.pontos = 4 )
    --all h: BairrosAlta | (#h.hoteis = 1)
}

abstract sig Prioridade {
    alta: set Alta,
    media: set Media,
    baixa: set Baixa,
    muitoBaixa: set MuitoBaixa
}

sig Alta extends Prioridade {
    bairrosAlta: set BairrosAlta
}

sig Media extends Prioridade {
    bairrosMedia: set BairrosMedia
}

sig Baixa extends Prioridade {
    bairrosBaixa: set BairrosBaixa
}

sig MuitoBaixa extends Prioridade {
    bairrosMuitoBaixa: set BairrosMuitoBaixa
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

run show for 4