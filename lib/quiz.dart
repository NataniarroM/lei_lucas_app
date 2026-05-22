import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> allQuestions = [
    {
      'question': 'Ao chegar em uma cena de emergência, qual deve ser a primeira atitude do socorrista?',
      'options': [
        'Iniciar compressões torácicas imediatamente',
        'Verificar se o local é seguro',
        'Oferecer água para a vítima',
        'Retirar a vítima do local rapidamente'
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Qual informação é essencial ao ligar para o serviço de emergência?',
      'options': [
        'Nome completo de todos os presentes',
        'Marca do veículo mais próximo',
        'Local exato e condição da vítima',
        'Quanto tempo o socorrista estudou primeiros socorros'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Uma vítima inconsciente e sem respiração normal pode estar em:',
      'options': [
        'Convulsão leve',
        'Estado de ansiedade',
        'Parada cardiorrespiratória',
        'Hipoglicemia simples'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Durante a RCP em adultos, as compressões devem ser realizadas:',
      'options': [
        'Na lateral do tórax',
        'No centro do peito',
        'Sobre o abdome',
        'Apenas no lado esquerdo'
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Qual é a frequência recomendada para compressões torácicas em adultos?',
      'options': [
        '40 a 60 por minuto',
        '60 a 80 por minuto',
        '80 a 90 por minuto',
        '100 a 120 por minuto'
      ],
      'correctAnswer': 3,
    },
    {
      'question': 'Em uma hemorragia externa intensa, a conduta correta é:',
      'options': [
        'Aplicar pressão direta no local',
        'Retirar o sangue continuamente',
        'Lavar o ferimento com álcool',
        'Deixar o sangramento parar sozinho'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Caso o pano utilizado em uma hemorragia fique encharcado de sangue:',
      'options': [
        'Deve ser removido imediatamente',
        'Deve ser trocado por outro seco',
        'Deve-se colocar outro pano por cima',
        'O sangramento deve ficar exposto'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Em queimaduras leves, o recomendado é:',
      'options': [
        'Aplicar manteiga',
        'Passar pasta de dente',
        'Utilizar gelo diretamente',
        'Resfriar com água corrente'
      ],
      'correctAnswer': 3,
    },
    {
      'question': 'Em queimaduras elétricas, antes de tocar na vítima é necessário:',
      'options': [
        'Cobrir a vítima com pano úmido',
        'Desligar a fonte de energia',
        'Aplicar compressas frias',
        'Fazer massagem cardíaca'
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Qual destes sinais pode indicar fratura?',
      'options': [
        'Coceira leve',
        'Vermelhidão nos olhos',
        'Dor intensa e deformidade',
        'Tosse seca'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Em casos de suspeita de fratura, deve-se:',
      'options': [
        'Tentar recolocar o osso no lugar',
        'Movimentar a região lesionada',
        'Imobilizar o local na posição encontrada',
        'Fazer alongamentos leves'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Na obstrução parcial das vias aéreas por engasgo, a vítima:',
      'options': [
        'Deve ser estimulada a tossir',
        'Deve receber água imediatamente',
        'Deve ser deitada no chão',
        'Precisa da manobra de Heimlich imediatamente'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'A manobra de Heimlich em adultos é realizada:',
      'options': [
        'Na região do peito',
        'Nos ombros',
        'Acima do umbigo e abaixo das costelas',
        'Na lateral do abdome'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Qual destes é um sinal típico de choque?',
      'options': [
        'Pele fria e pálida',
        'Febre alta isolada',
        'Sono tranquilo',
        'Espirros frequentes'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Em uma situação de choque, a vítima deve:',
      'options': [
        'Caminhar lentamente',
        'Receber alimentos leves',
        'Permanecer em repouso e aquecida',
        'Tomar bastante água'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Verdadeiro ou falso: durante uma convulsão, não se deve colocar objetos na boca da vítima.',
      'options': [
        'Falso',
        'Somente em crianças',
        'Verdadeiro',
        'Apenas em crises longas'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Verdadeiro ou falso: objetos cravados no corpo devem ser removidos imediatamente.',
      'options': [
        'Verdadeiro',
        'Apenas em pequenos ferimentos',
        'Somente por familiares',
        'Falso'
      ],
      'correctAnswer': 3,
    },
    {
      'question': 'Verdadeiro ou falso: medicamentos podem ser distribuídos livremente em kits escolares de primeiros socorros.',
      'options': [
        'Verdadeiro',
        'Apenas com autorização verbal',
        'Falso',
        'Somente em emergências leves'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Em casos de intoxicação, uma atitude correta é:',
      'options': [
        'Provocar vômito rapidamente',
        'Guardar a embalagem do produto ingerido',
        'Fazer a vítima correr',
        'Oferecer refrigerante'
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'O principal objetivo dos primeiros socorros é:',
      'options': [
        'Substituir o atendimento hospitalar',
        'Realizar tratamentos definitivos',
        'Proteger a vida até a chegada do socorro especializado',
        'Liberar rapidamente a vítima para casa'
      ],
      'correctAnswer': 2,
    },
  ];

  late List<Map<String, dynamic>> selectedQuestions;
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;
  bool quizFinished = false;
  bool quizStarted = false;

  void startQuiz() {
    allQuestions.shuffle(Random());
    selectedQuestions = allQuestions.take(10).toList();
    currentQuestionIndex = 0;
    score = 0;
    selectedAnswer = null;
    answered = false;
    quizFinished = false;
    quizStarted = true;
    setState(() {});
  }

  void answerQuestion(int index) {
    if (answered) return;
    setState(() {
      selectedAnswer = index;
      answered = true;
      if (index == selectedQuestions[currentQuestionIndex]['correctAnswer']) {
        score++;
      }
    });
  }

  Future<void> _saveQuizProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quiz_score', score);
    await prefs.setInt('quiz_total', 10);
  }

  void nextQuestion() {
    if (currentQuestionIndex < selectedQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      setState(() {
        quizFinished = true;
      });
      _saveQuizProgress();
    }
  }

  String getResultMessage() {
    if (score >= 9) {
      return 'Excelente! Você está preparado para agir em situações de emergência.';
    } else if (score >= 7) {
      return 'Muito bom! Você possui um bom conhecimento sobre primeiros socorros.';
    } else if (score >= 5) {
      return 'Bom trabalho! Mas ainda é importante revisar alguns conteúdos.';
    } else {
      return 'É recomendado revisar os conteúdos e realizar o treinamento novamente.';
    }
  }

  Color getOptionColor(int index) {
    if (!answered) {
      return const Color(0xFFF1B16D);
    }
    int correctAnswer = selectedQuestions[currentQuestionIndex]['correctAnswer'];
    if (index == correctAnswer) {
      return Colors.green.shade400;
    }
    if (index == selectedAnswer) {
      return Colors.red.shade400;
    }
    return const Color(0xFFF1B16D);
  }

  @override
  Widget build(BuildContext context) {
    // --- TELA INICIAL ---
    if (!quizStarted) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFCF76), Color(0xFFEE832B)],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset('assets/logo_app.png', fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Quiz Lei Lucas',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white.withOpacity(0.25), width: 1),
                      ),
                      child: const Text(
                        'Esse quiz tem como objetivo verificar sua evolução com os conhecimentos adquiridos sobre primeiros socorros e situações de emergência abordadas pela Lei Lucas.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.white, height: 1.6, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: startQuiz,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F4C81),
                          elevation: 3,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text(
                          'INICIAR QUIZ',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2),
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

    // --- TELA DE RESULTADO ---
    if (quizFinished) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFCF76), Color(0xFFEE832B)],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1B16D),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.emoji_events, color: Colors.white, size: 90),
                    const SizedBox(height: 20),
                    const Text(
                      'Sua pontuação',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '$score / 10',
                      style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      getResultMessage(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, color: Colors.white, height: 1.4),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: startQuiz,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F4C81),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text('REFAZER QUIZ', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // ALTERAÇÃO DA OPÇÃO 2 AQUI: Reseta a navegação atualizando a Home e o Perfil!
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const HomePage()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text('VOLTAR PARA HOME', style: TextStyle(color: Color(0xFF0F4C81), fontSize: 16, fontWeight: FontWeight.bold)),
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

    // --- TELA DE PERGUNTAS ATIVAS ---
    final question = selectedQuestions[currentQuestionIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFCF76), Color(0xFFEE832B)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    children: [
                      // TOPO
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lei Lucas',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFF9800)),
                              ),
                              Text(
                                'QUIZ',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6, offset: const Offset(0, 3))
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset('assets/logo_app.png', fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(width: 140, height: 3, color: const Color(0xFF0F4C81)),
                      ),
                      const SizedBox(height: 25),

                      // CARD DA PERGUNTA
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1B16D),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))
                          ],
                          border: Border.all(color: const Color(0xFFFFD59E), width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pergunta ${currentQuestionIndex + 1} de 10',
                              style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              question['question'],
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, height: 1.4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),

                      // ALTERNATIVAS
                      ...List.generate(
                        question['options'].length,
                            (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: GestureDetector(
                              onTap: () => answerQuestion(index),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                decoration: BoxDecoration(
                                  color: getOptionColor(index),
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 5, offset: const Offset(0, 2))
                                  ],
                                  border: Border.all(color: const Color(0xFFFFD59E), width: 1.2),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        question['options'][index],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          height: 1.3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      if (answered && selectedAnswer != question['correctAnswer'])
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Gabarito: ${question['options'][question['correctAnswer']]}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // BOTÃO FIXO INFERIOR
              if (answered)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F4C81),
                        elevation: 2,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        currentQuestionIndex == 9 ? 'FINALIZAR QUIZ' : 'PRÓXIMA PERGUNTA',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}