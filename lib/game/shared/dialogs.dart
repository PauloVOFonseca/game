class Dialogs {
  Map dialogs = {
    //como jogar
    "greetings":
        'Olá, aqui você irá aprender o básico do jogo e suas informações. Use o Joystick, para se movimentar e pegue as folhas de papel espalhadas no mapa.',
    "howToMove":
        'Para derrotar um inimigo, basta pular sobre eles. Mas cuidado, não encoste na sua lateral ou você perderá e voltará do começo.',
    "energyScore":
        'Toda fase terá diversas folhas, elas possuem informações importante sobre a Obesidade e podem ser revistas no menu do jogo.',
    "boss":
        "Para completar a fase, você precisa derrotar o chefão do estágio, pule sobre ele para finaliza-lo.",
    //Fase 1:
    "firstTip":
        "Ainda bem que você chegou! Precisamos da sua ajuda. Nós estamos no sistema cardiovascular, um dos afetados pela obesidade. Quer saber mais? Colete as informações disponíveis e combata os inimigos para conseguir nos ajudar.",
    "definition":
        "A obesidade é uma doença crônica, definida pela Organização Mundial de Saúde (OMS) como o acúmulo excessivo de gordura no corpo.",
    "imc":
        "Segundo o IMC, uma pessoa é considerada obesa caso seu índice seja igual ou superior a 30. Para calcular basta dividir o peso pelo quadrado da altura.",
    "cause":
        "A obesidade aparece quando a energia ingerida com os alimentos supera muito a quantidade de energia gasta nas atividades diárias. Outros fatores também interferem, como a genética, a situação socioeconômica e o ambiente em que vivemos.",
    "combatThis":
        "A melhor forma de combater a obesidade é manter uma dieta balanceada e praticar exercícios físicos.",
    "unbalancedDiet":
        "Uma dieta desbalanceada pode causar muitos problemas de saúde, interferindo além da obesidade.",
    "sedentary":
        "O sedentarismo é definido com a falta ou a baixa prática de atividades físicas, responsáveis pelo aumento do gasto calórico no dia. Pessoas sedentárias têm mais risco de serem diagnosticadas com doenças cardiovasculares, osteoporose, diabetes, aumento do colesterol, hipertensão arterial.",
    "nutrients":
        "É importante a combinação de diferentes tipos de nutrientes (Carboidratos, Proteínas, Lipídios, Minerais, Vitaminas) numa dieta, onde deve ser mantido o equilíbrio no consumo, não devendo faltar ou haver consumo excessivo.",
    "carbohydrates":
        "Carboidratos: Compostos bioquímicos que fornecem energia ao organismo. Alguns alimentos ricos em carboidratos: macarrão, pães, batata, mandioca, arroz, frutas, mel e geleias.",
    "proteins":
        "Proteínas: Compostos bioquímicos que contêm nitrogênio em sua molécula e que contribuem para a estrutura do organismo. Alguns alimentos ricos em proteínas: Carne vermelha, aves, peixes, feijões, soja, lentilha, ervilha, nozes e amêndoas.",
    "lipids":
        "Lipídios: Denominação científica das gorduras, dos óleos e de outros produtos de propriedades similares. Atuam no organismo como reservas de energia, além da importância na transmissão de impulsos nervosos. Alguns alimentos ricos em lipídios: óleos, manteigas, azeites, castanhas e nozes.",
    "minerals":
        "Minerais: Presença delas favorece o equilíbrio e a manutenção de funções corporais básicas (processos metabólicos, condução de impulsos nervosos, contração dos músculos. Alguns alimentos ricos em minerais: leite, sardinhas, brócolis, couve, agrião e mostarda, feijões, nozes e gergelim.",
    "vitamins":
        "Vitaminas: Atuam nos processos metabólicos de carboidratos, lipídios e proteínas.",
    //Fase 2
    "secondTip":
        "Nós estamos no sistema respiratório, também bastante afetado pela obesidade. Colete mais informações disponíveis e aprenda sobre o combate a obesidade",
    "metabolicSyndrome":
        "A síndrome metabólica é um conjunto de fatores de riscos manisfestados num indivíduo e está associada a obesidade, identificada pela grande quantidade de gordura abdominal, elevação da taxa de triglicerídeos e glicose, além da pressão alta.",
    "whatAffects":
        "A obesidade afeta principalmente: o sistema cardiovascular, o sistema respiratório, sistema digestivo e até mesmo articulações.",
    "cardiovascularSystem":
        "Como o sistema cardiovascular é afetado: aumento da pressão arterial, entupimento de veias. Dificultando o funcionamento do coração e podendo causar Hipertensão.",
    "respiratorySystem":
        "Como o sistema respiratório é afetado: falta de ar, geração da apneia do sono e intensificação de efeitos da asma.",
    "skeletalSystem":
        "Como o sistema esqueletico é afetado: O excesso de peso força as articulações (coluna, bacia, joelhos, calcanhares). Pode gerar hérnia de disco e sensibilidade nas articulações.",
    "moreConsequences":
        "A obesidade também pode causar cânceres de mama, cólon e útero, além de problemas psicológicos",
    "diet":
        "Cada dieta deve ser adaptada para o estilo de vida pessoal, sob supervisão de um profissional especializado.",
    //Fase 3
    "thirdTip":
        "Este é o sistema esquelético: constituído por ossos, cartilagens, tendões e ligamentos. Colete as informações disponíveis.",
    "adultsIBGE":
        "Em 2020, foi anunciado pelo IBGE que 1 em cada 4 adultos estão obesos(cerca de 25% da população).",
    "childrenIBGE":
        "A obesidade infantil afeta pelo menos 3 milhões de crianças menores de 10 anos no Brasil, afetando 13,2% das crianças.",
    "mortality":
        "Segundo a revista Preventing Chronic Disease, aproximadamente 168 mil mortes por ano no Brasil são atribuíveis ao excesso de peso e obesidade em decorrência do risco aumentado para doenças crônicas.",
    "costs":
        "O tratamento de doenças relacionadas à obesidade e sobrepeso custam ao Estado cerca de 3,7 bilhões por ano.",
    "pandemic":
        "Segundo registros do IBGE, a pandemia do COVID-19 influenciou no aumento em consequência a restrição da mobilidade, fechamento de parques e academia.",
    "worldDay":
        "11/10 é o Dia Mundial da Obesidade e Dia Nacional de Prevenção da Obesidade.",
    //Fase 4
    "fourthTip":
        "Este é o sistema digestivo, o sistema completamente responsável pela disgestão dos alimentos consumidos no corpo humano.",
    "mouth":
        "Os problema da obesidade nesse sistema iniciam desde a boca, visto que é comum que a baixa mastigação é comum para pessoas obesas.",
    "craving":
        "A baixa mastigação causa a ingestão de pedaços maiores, dificultando a absorção de nutrientes da refeição.",
    "wrongChewing":
        " Pode provocar doenças como gastrites, azia, náuseas, refluxo e úlceras, auxiliando também no ganho de peso.",
    "digestiveSystem":
        "Este tem relação direta com o estímulo à fome, aumento do apetite e saciedade aliado ao cérebro",
    "recommended":
        "Os especialistas recomendam o consumo de  alimentos naturais como grãos integrais, leguminosas, cereais, raízes, frutas, verdura e carnes com baixo teor de gorduras.",
    "notRecommended":
        "Os especialistas não recomendam o consumo de alimentos industrializados porque são ricos em aditivos químicos, gorduras saturadas, açúcares e pobres em fibras e nutrientes.",
  };
}
