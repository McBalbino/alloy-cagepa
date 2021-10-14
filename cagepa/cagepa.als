module cagepa

sig Cagepa {
    pontos: set Pontos
}

sig Pontos {

}

sig Bairros extends Pontos {

}

sig Norte, Sul, Leste, Oeste extends Pontos {}

sig Prioridade extends Bairros {

}

sig Alta, Media, Baixa extends Prioridade {}

sig Hoteis, Centro extends Alta {}

sig Hospitais extends Media {}

sig Escolas, Creches, Casas extends Baixa {}

fact formulas {
    
}

--

pred show(){}

run show for 5