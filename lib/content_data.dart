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
    emergencyImagePath: "",
    identifyList: [
      "Tosse forte ou silenciosa",
      "Dificuldade para respirar",
      "Criança não consegue falar ou chorar",
    ],
    techniqueImagePath: "",
    whatToDoList: [
      "Se a criança estiver tossindo, incentive a tossir",
      "Em bebês, faça 5 tapas nas costas e 5 compressões no peito",
    ],
    dontDoList: [
      "Não ofereça água ou comida",
      "Não coloque o dedo na boca sem ver o objeto",
    ],
    solutionImagePath: "",
    alertText: "Chame o SAMU 192 se a criança não respirar ou ficar roxa.",
  ),

  // Lorena, copie esse bloco e reescreva para cada conteúdo
  "Ferimentos": TopicContent(
    title: "",
    emergencyImagePath: "",
    identifyList: [
      "",
      "",
      "",
    ],
    techniqueImagePath: "",
    whatToDoList: [
      "",
      "",
    ],
    dontDoList: [
      "",
      "",
    ],
    solutionImagePath: "",
    alertText: "",
  ),
};