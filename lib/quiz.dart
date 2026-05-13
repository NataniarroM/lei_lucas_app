// funções de aleatoriedade
import 'dart:math';

// componentes visuais do Flutter
import 'package:flutter/material.dart';

// tela inicial do aplicativo
import 'home_page.dart';

// TELA PRINCIPAL DO QUIZ

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  // LISTA DE PERGUNTAS

  // Lista com todas as perguntas do quiz
  final List<Map<String, dynamic>> allQuestions = [

    {
      'question':
      'Ao chegar em uma emergência, qual deve ser a primeira atitude?',
      'options': [
        'Oferecer água para a vítima',
        'Garantir a segurança do local',
        'Movimentar a vítima',
        'Filmar a situação'
      ],
      'correctAnswer': 1,
    },

    {
      'question':
      'Qual telefone deve ser acionado para urgências médicas?',
      'options': ['190', '192', '193', '188'],
      'correctAnswer': 1,
    },

    {
      'question':
      'Em caso de hemorragia externa intensa, o correto é:',
      'options': [
        'Aplicar pressão direta',
        'Passar álcool',
        'Retirar o sangue',
        'Esperar parar sozinho'
      ],
      'correctAnswer': 0,
    },

    // =========================
    // ADICIONE AS OUTRAS
    // PERGUNTAS AQUI
    // =========================
  ];

  // VARIÁVEIS DE CONTROLE

  // Lista das 10 perguntas sorteadas
  late List<Map<String, dynamic>> selectedQuestions;

  int currentQuestionIndex = 0;

  // Pontuação do usuário
  int score = 0;

  // Resposta escolhida pelo usuário
  int? selectedAnswer;

  bool answered = false;

  bool quizFinished = false;

  // INICIALIZAÇÃO DO QUIZ

  @override
  void initState() {
    super.initState();

    // Inicia o quiz
    startQuiz();
  }


  // METODO PARA INICIAR O QUIZ

  void startQuiz() {

    // Embaralha aleatoriamente as perguntas
    allQuestions.shuffle(Random());

    selectedQuestions = allQuestions.take(10).toList();

    // Reinicia os dados do quiz
    currentQuestionIndex = 0;
    score = 0;
    selectedAnswer = null;
    answered = false;
    quizFinished = false;

    // Atualiza a interface
    setState(() {});
  }

  // METODO DE RESPOSTA

  void answerQuestion(int index) {

    // Impede responder novamente
    if (answered) return;

    setState(() {

      // Armazena a resposta selecionada
      selectedAnswer = index;

      // Marca a pergunta como respondida
      answered = true;

      // Verifica se a resposta está correta
      if (index ==
          selectedQuestions[currentQuestionIndex]['correctAnswer']) {

        // Soma 1 ponto ao usuário
        score++;
      }
    });
  }

  // PRÓXIMA PERGUNTA

  void nextQuestion() {

    // Verifica se ainda existem perguntas
    if (currentQuestionIndex < selectedQuestions.length - 1) {

      setState(() {

        // Avança para a próxima pergunta
        currentQuestionIndex++;

        // Reinicia os dados da pergunta atual
        selectedAnswer = null;
        answered = false;
      });

    } else {

      // Finaliza o quiz
      setState(() {
        quizFinished = true;
      });
    }
  }

  // =========================
  // MENSAGEM FINAL
  // =========================

  // Define a mensagem com base na pontuação
  String getResultMessage() {

    if (score >= 9) {

      return
        'Excelente! Você está preparado para agir em situações de emergência.';

    } else if (score >= 7) {

      return
        'Muito bom! Você possui um bom conhecimento sobre primeiros socorros.';

    } else if (score >= 5) {

      return
        'Bom trabalho! Mas ainda é importante revisar alguns conteúdos.';

    } else {

      return
        'É recomendado revisar os conteúdos e realizar o treinamento novamente.';
    }
  }

  // =========================
  // CORES DAS RESPOSTAS
  // =========================

  // Define as cores das alternativas
  Color getOptionColor(int index) {

    // Antes de responder, todas ficam brancas
    if (!answered) {
      return Colors.white;
    }

    // Armazena a resposta correta
    int correctAnswer =
    selectedQuestions[currentQuestionIndex]['correctAnswer'];

    // Resposta correta fica verde
    if (index == correctAnswer) {
      return Colors.green.shade300;
    }

    // Resposta errada selecionada fica vermelha
    if (index == selectedAnswer) {
      return Colors.red.shade300;
    }

    // Outras respostas permanecem brancas
    return Colors.white;
  }

  // =========================
  // INTERFACE DO APP
  // =========================

  @override
  Widget build(BuildContext context) {

    // Exibe carregamento enquanto as perguntas são preparadas
    if (selectedQuestions.isEmpty) {

      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // =========================
    // TELA FINAL DO QUIZ
    // =========================

    if (quizFinished) {

      return Scaffold(

        backgroundColor: const Color(0xFFF2F7FF),

        appBar: AppBar(

          // Remove botão de voltar
          automaticallyImplyLeading: false,

          title: const Text('Resultado'),

          centerTitle: true,

          backgroundColor: Colors.blue,
        ),

        body: Center(

          child: Padding(

            padding: const EdgeInsets.all(24),

            child: Card(

              elevation: 8,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(

                padding: const EdgeInsets.all(24),

                child: Column(

                  mainAxisSize: MainAxisSize.min,

                  children: [

                    // Ícone de troféu
                    const Icon(
                      Icons.emoji_events,
                      color: Colors.amber,
                      size: 90,
                    ),

                    const SizedBox(height: 20),

                    // Texto da pontuação
                    Text(
                      'Sua pontuação',

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Resultado final
                    Text(
                      '$score / 10',

                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Mensagem personalizada
                    Text(
                      getResultMessage(),

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Botão de refazer quiz
                    ElevatedButton.icon(

                      onPressed: () {

                        // Reinicia o quiz
                        startQuiz();
                      },

                      icon: const Icon(Icons.refresh),

                      label: const Text('Refazer Quiz'),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,

                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Botão de voltar para home
                    ElevatedButton.icon(

                      onPressed: () {

                        // Navega para tela inicial
                        Navigator.pushReplacement(

                          context,

                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },

                      icon: const Icon(Icons.home),

                      label: const Text('Voltar para Home'),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,

                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Armazena a pergunta atual
    final question = selectedQuestions[currentQuestionIndex];

    // =========================
    // TELA PRINCIPAL DO QUIZ
    // =========================

    return Scaffold(

      backgroundColor: const Color(0xFFF2F7FF),

      appBar: AppBar(

        // Remove botão de voltar durante o quiz
        automaticallyImplyLeading: false,

        title: const Text('Quiz Lei Lucas'),

        centerTitle: true,

        backgroundColor: Colors.blue,
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // =========================
            // BARRA DE PROGRESSO
            // =========================

            LinearProgressIndicator(

              // Calcula progresso do quiz
              value: (currentQuestionIndex + 1) / 10,

              backgroundColor: Colors.grey.shade300,

              color: Colors.green,

              minHeight: 10,

              borderRadius: BorderRadius.circular(20),
            ),

            const SizedBox(height: 20),

            // Número da pergunta atual
            Text(
              'Pergunta ${currentQuestionIndex + 1} de 10',

              style: TextStyle(
                fontSize: 18,
                color: Colors.blue.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // CARD DA PERGUNTA
            // =========================

            Card(

              elevation: 6,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(

                padding: const EdgeInsets.all(24),

                child: Text(

                  question['question'],

                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // BOTÕES DAS RESPOSTAS
            // =========================

            ...List.generate(

              question['options'].length,

                  (index) {

                return Container(

                  width: double.infinity,

                  margin: const EdgeInsets.only(bottom: 15),

                  child: ElevatedButton(

                    // Método ao clicar na resposta
                    onPressed: () => answerQuestion(index),

                    style: ElevatedButton.styleFrom(

                      // Cor dinâmica da resposta
                      backgroundColor: getOptionColor(index),

                      foregroundColor: Colors.black,

                      padding: const EdgeInsets.all(18),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    child: Align(

                      alignment: Alignment.centerLeft,

                      child: Text(

                        question['options'][index],

                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // =========================
            // RESPOSTA CORRETA
            // =========================

            // Exibe resposta correta caso o usuário erre
            if (answered &&
                selectedAnswer != question['correctAnswer'])

              Padding(

                padding: const EdgeInsets.only(top: 10),

                child: Text(

                  'Resposta correta: ${question['options'][question['correctAnswer']]}',

                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            const Spacer(),

            // =========================
            // BOTÃO PRÓXIMA PERGUNTA
            // =========================

            if (answered)

              SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  // Avança para próxima pergunta
                  onPressed: nextQuestion,

                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.blue,

                    padding: const EdgeInsets.symmetric(vertical: 18),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: Text(

                    // Altera texto do botão na última pergunta
                    currentQuestionIndex == 9
                        ? 'Finalizar Quiz'
                        : 'Próxima Pergunta',

                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}