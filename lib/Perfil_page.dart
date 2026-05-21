import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigation_bar.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  Future<Map<String, int>> _getQuizData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();

    int score = prefs.getInt('quiz_score') ?? 0;
    int total = prefs.getInt('quiz_total') ?? 0;

    return {
      'score': score,
      'total': total,
    };
  }

  @override
  Widget build(BuildContext context) {
    // Cores premium combinando com a identidade visual do seu app
    const Color topBg = Color(0xFF0F4C81);
    const Color bottomBg = Color(0xFF0D5C63);
    const Color accentYellow = Color(0xFFFFB300);

    return Scaffold(
      body: Container(
        // Gradiente de fundo para acabar com aquele visual liso e vazio
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [topBg, bottomBg],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- CABEÇALHO ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'Meu Desempenho',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: accentYellow, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                      color: accentYellow,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: accentYellow.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 2))
                      ]
                  ),
                ),
              ),

              // --- CONTEÚDO PRINCIPAL ---
              Expanded(
                child: FutureBuilder<Map<String, int>>(
                  future: _getQuizData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(color: accentYellow));
                    }

                    int correctAnswers = snapshot.data?['score'] ?? 0;
                    int totalQuestions = snapshot.data?['total'] ?? 0;

                    double progressPercentage = totalQuestions > 0 ? (correctAnswers / totalQuestions) : 0.0;
                    int percentageInt = (progressPercentage * 100).toInt();

                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          // Ícone grande de conquista no topo para dar identidade à tela
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.05),
                            ),
                            child: const Icon(Icons.analytics_rounded, size: 70, color: Colors.white),
                          ),
                          const SizedBox(height: 35),

                          // --- CARD PRINCIPAL: PROGRESSO ---
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.white.withOpacity(0.12)),
                              boxShadow: [
                                BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 15, offset: const Offset(0, 8))
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.stars_rounded, color: accentYellow, size: 28),
                                    SizedBox(width: 12),
                                    Text(
                                      'Evolução do Quiz',
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 25),

                                // Barra de progresso muito mais robusta e visível
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: LinearProgressIndicator(
                                    value: progressPercentage,
                                    minHeight: 18,
                                    backgroundColor: Colors.white.withOpacity(0.12),
                                    valueColor: const AlwaysStoppedAnimation<Color>(accentYellow),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // --- SEÇÃO DE CARDS DE MÉTRICAS (LADO A LADO) ---
                          Row(
                            children: [
                              // Card 1: Quantidade de Acertos
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.07),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                                  ),
                                  child: Column(
                                    children: [
                                      const Icon(Icons.done_all_rounded, color: Colors.greenAccent, size: 28),
                                      const SizedBox(height: 8),
                                      const Text('Acertos', style: TextStyle(color: Colors.white70, fontSize: 13)),
                                      const SizedBox(height: 4),
                                      Text(
                                        totalQuestions > 0 ? '$correctAnswers / $totalQuestions' : '0 / 0',
                                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Card 2: Porcentagem de Aproveitamento
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.07),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                                  ),
                                  child: Column(
                                    children: [
                                      const Icon(Icons.pie_chart_rounded, color: accentYellow, size: 28),
                                      const SizedBox(height: 8),
                                      const Text('Aproveitamento', style: TextStyle(color: Colors.white70, fontSize: 13)),
                                      const SizedBox(height: 4),
                                      Text(
                                        '$percentageInt%',
                                        style: const TextStyle(color: accentYellow, fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const NavBar(),
            ],
          ),
        ),
      ),
    );
  }
}