module cagepa

sig Cagepa {
    pontos: set Pontos
}

abstract sig Pontos {}

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
}

sig Hoteis, Centro extends BairrosAlta {}

abstract sig BairrosMedia {
}

sig Hospitais extends BairrosMedia {}

abstract sig BairrosBaixa {

}

sig Escolas, Creches extends BairrosBaixa {}

abstract sig BairrosMuitoBaixa {
}


sig Casas extends BairrosMuitoBaixa {}


fact bairrosSet {
    one Casas
    one Hoteis
    one Centro
    one Hospitais
    one Escolas
    one Creches
}

abstract sig Prioridade {
    
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
    all l: BairrosAlta | one l.~bairrosAlta
    all y: BairrosMedia | one y.~bairrosMedia
    all x: BairrosBaixa | one x.~bairrosBaixa
    all e: BairrosMuitoBaixa | one e.~bairrosMuitoBaixa
    one Alta
    one Media
    one Baixa
    one MuitoBaixa
}

--

pred show(){}

run show for 4