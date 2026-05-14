class TopicContent {
  final String title;
  final String emergencyImagePath;
  final List<String> identifyList;
  final String techniqueImagePath;
  final List<String> whatToDoList;
  final List<String> dontDoList;
  final String solutionImagePath;
  final String alertText;

  TopicContent({
    required this.title,
    required this.emergencyImagePath,
    required this.identifyList,
    required this.techniqueImagePath,
    required this.whatToDoList,
    required this.dontDoList,
    required this.solutionImagePath,
    required this.alertText,
  });
}

// Dicionário que contém todos os conteúdo
final Map<String, TopicContent> allTopics = {
  "Engasgo": TopicContent(
    title: "Engasgo",
    emergencyImagePath: "assets/aprender/engasgoemergency.png",
    identifyList: [
      "Tosse forte ou silenciosa",
      "Dificuldade para respirar",
      "Criança não consegue falar ou chorar",
      "Lábios arroxeados",
      "Mãos no pescoço",
      "Perda de consciência",
    ],
    techniqueImagePath: "assets/aprender/engasgotechnique.png",
    whatToDoList: [
      "Se a criança estiver tossindo, incentive a tossir",
      "Se não consegue respirar, chame ajuda imediatamente",
      "Em criança maior, faça a manobra de desengasgo local",
      "Em bebês, faça 5 tapas nas costas e 5 compressões no peito",
      "Se desmaiar, deite no chão e chame o SAMU 192",

    ],
    dontDoList: [
      "Não ofereça água ou comida",
      "Não coloque o dedo na boca sem ver o objeto",
      "Não sacuda a criança",
      "Não vire a criança de cabeça para baixo",
    ],
    solutionImagePath: "assets/aprender/engasgosolution.png",
    alertText: "Chame o SAMU 192 se a criança não respirar, ficar roxa, perder a consciência ou não conseguir tossir, falar ou chorar.",
  ),

  // Lorena, copie esse bloco e reescreva para cada conteúdo
  "Ferimentos": TopicContent(
    title: "Ferimentos",
    emergencyImagePath: "assets/aprender/ferimentosemergency.png",
    identifyList: [
      "Cortes",
      "Arranhões",
      "Sangramento",
      "Objeto preso na pele",
      "Ferida suja ou profunda",
    ],
    techniqueImagePath: "assets/aprender/ferimentostechnique.png",
    whatToDoList: [
      "Lave as mãos ou use luvas",
      "Lave ferimentos leves com água corrente",
      "Cubra com gaze ou pano limpo",
      "Se houver sangramento, pressione o local",
      "Procure atendimento se o corte for profundo ou sujo",
    ],
    dontDoList: [
      "Não sopre o ferimento",
      "Não use pó de café, pasta de dente ou receitas caseiras",
      "Não retire objeto preso",
      "Não toque diretamente no sangue sem proteção",
    ],
    solutionImagePath: "assets/aprender/ferimentossolution.png",
    alertText:
    "Chame ajuda se o sangramento for intenso, se houver objeto preso, ferimento profundo, mordida, pancada forte ou sinais de desmaio.",
  ),

  "Reações Alérgicas": TopicContent(
    title: "Reações Alérgicas",
    emergencyImagePath: "assets/aprender/reacoesalergicasemergency.png",
    identifyList: [
      "Manchas vermelhas na pele",
      "Coceira",
      "Inchaço no rosto, boca ou olhos",
      "Falta de ar ou chiado",
      "Tontura, vômito ou desmaio",
    ],
    techniqueImagePath: "assets/aprender/reacoesalergicastechnique.png",
    whatToDoList: [
      "Afaste a criança do possível causador da alergia",
      "Mantenha a criança calma e observada",
      "Verifique se há orientação médica ou medicamento prescrito",
      "Chame o SAMU 192 se houver falta de ar, inchaço no rosto ou piora rápida",
    ],
    dontDoList: [
      "Não dê remédio sem autorização",
      "Não deixe a criança sozinha",
      "Não espere os sintomas graves passarem sozinhos",
      "Não ofereça comida ou bebida se houver falta de ar",
    ],
    solutionImagePath: "assets/aprender/reacoesalergicassolution.png",
    alertText:
    "Chame o SAMU 192 imediatamente se houver falta de ar, inchaço na boca ou língua, desmaio, palidez ou piora rápida.",
  ),

  "Parada Cardíaca": TopicContent(
    title: "Parada Cardíaca",
    emergencyImagePath: "assets/aprender/paradacardiacaemergency.png",
    identifyList: [
      "A criança não responde",
      "Não respira normalmente",
      "Está muito pálida ou arroxeada",
      "Está caída e sem reação",
    ],
    techniqueImagePath: "assets/aprender/paradacardiacatechnique.png",
    whatToDoList: [
      "Chame a criança e toque nos ombros",
      "Peça para alguém ligar para o SAMU 192",
      "Peça para buscar um DEA, se houver",
      "Coloque as mãos no centro do peito",
      "Faça compressões fortes e rápidas",
    ],
    dontDoList: [
      "Não sacuda a criança",
      "Não jogue água no rosto",
      "Não ofereça comida ou bebida",
      "Não pare as compressões sem orientação",
    ],
    solutionImagePath: "assets/aprender/paradacardiacasolution.png",
    alertText:
    "Chame o SAMU 192 imediatamente se a criança não responder ou não respirar normalmente.",
  ),

  "Hemorragia Nasais": TopicContent(
    title: "Hemorragia Nasais",
    emergencyImagePath: "assets/aprender/hemorragianasaisemergency.png",
    identifyList: [
      "Sangramento pelo nariz",
      "Sangue escorrendo pela frente do nariz",
      "Pode acontecer após pancada, calor, ressecamento ou alergia",
    ],
    techniqueImagePath: "assets/aprender/hemorragianasaistechnique.png",
    whatToDoList: [
      "Sente a criança",
      "Incline a cabeça levemente para frente",
      "Peça para buscar um DEA, se houver",
      "Peça para respirar pela boca",
      "Use compressa fria sobre o nariz",
      "Observe se o sangramento para",
    ],
    dontDoList: [
      "Não sacuda a criança",
      "Não jogue água no rosto",
      "Não ofereça comida ou bebida",
      "Não pare as compressões sem orientação",
    ],
    solutionImagePath: "assets/aprender/hemorragianasaissolution.png",
    alertText:
    "Chame o SAMU 192 imediatamente se a criança não responder ou não respirar normalmente.",
  ),

  "Queimaduras": TopicContent(
    title: "Queimaduras",
    emergencyImagePath: "assets/aprender/queimaduraemergency.png",
    identifyList: [
      "Vermelhidão na pele",
      "Dor ou ardência",
      "Bolhas",
      "Pele muito clara, escura ou machucada",
    ],
    techniqueImagePath: "assets/aprender/queimaduratechnique.png",
    whatToDoList: [
      "Afaste a criança da fonte de calor",
      "Lave o local com água corrente em temperatura ambiente",
      "Retire acessórios próximos, se não estiverem grudados",
      "Chame ajuda se a queimadura for grande ou grave",
    ],
    dontDoList: [
      "Não use gelo",
      "Não estoure bolhas",
      "Não passe pasta de dente, óleo, manteiga ou pomadas caseiras",
      "Não retire roupa grudada na pele",
    ],
    solutionImagePath: "assets/aprender/queimadurasolution.png",
    alertText:
    "Chame o SAMU 192 ou Bombeiros 193 se a queimadura for no rosto, mãos, pés, genitais, articulações, ou se for causada por eletricidade, produto químico ou fogo.",
  )
};