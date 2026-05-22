import 'package:flutter/material.dart';
import 'navigation_bar.dart';

class LucasLawPage extends StatelessWidget {
  const LucasLawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo premium sólido combinando com a identidade visual do app
      backgroundColor: const Color(0xFF0D5C63),
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho refinado
            _buildHeader(context),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner Principal com cantos bem arredondados e sombra sutil
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/lei_lucas_banner.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Título Principal da Lei fora do bloco de texto para dar destaque
                    const Center(
                      child: Text(
                        "LEI Nº 13.722, DE 4 DE OUTUBRO DE 2018",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFFB300),
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Introdução com destaque visual
                    _buildLawCard(
                      "Resumo da Lei",
                      "A Lei Lucas torna obrigatória a capacitação em noções básicas de primeiros socorros de professores e funcionários de estabelecimentos de ensino públicos e privados de educação básica e de estabelecimentos de recreação infantil.",
                      isHighlight: true,
                    ),

                    // Divisão dos artigos em blocos limpos para facilitar a leitura
                    _buildLawCard(
                      "Artigo 1º — Da Obrigatoriedade",
                      "Os estabelecimentos de ensino de educação básica da rede pública, por meio dos respectivos sistemas de ensino, e os estabelecimentos de ensino de educação básica e de recreação infantil da rede privada deverão capacitar professores e funcionários em noções de primeiros socorros.\n\n"
                          "§ 1º O curso deverá ser ofertado anualmente e destinar-se-á à capacitação e/ou à reciclagem de parte dos professores e funcionários dos estabelecimentos de ensino e recreação a que se refere o caput deste artigo, sem prejuízo de suas atividades ordinárias.\n\n"
                          "§ 2º A quantidade de profissionais capacitados em cada estabelecimento de ensino ou de recreação será definida em regulamento, guardada a proporção com o tamanho do corpo de professores e funcionários ou com o fluxo de atendimento de crianças e adolescentes no estabelecimento.\n\n"
                          "§ 3º A responsabilidade pela capacitação dos professores e funcionários dos estabelecimentos públicos caberá aos respectivos sistemas ou redes de ensino.",
                    ),

                    _buildLawCard(
                      "Artigo 2º — Ministração dos Cursos",
                      "Os cursos de primeiros socorros serão ministrados por entidades municipais ou estaduais especializadas em práticas de auxílio imediato e emergencial à população, no caso dos estabelecimentos públicos, e por profissionais habilitados, no caso dos estabelecimentos privados, e têm por objetivo capacitar os professores e funcionários para identificar e agir preventivamente em situações de emergência e urgência médicas, até que o suporte médico especializado, local ou remoto, se torne possível.\n\n"
                          "§ 1º O conteúdo dos cursos de primeiros socorros básicos ministrados deverá ser condizente com a natureza e a faixa etária do público atendido nos estabelecimentos de ensino ou de recreação.\n\n"
                          "§ 2º Os estabelecimentos de ensino ou de recreação das redes pública e particular deverão dispor de kits de primeiros socorros, conforme orientação das entidades especializadas em atendimento emergencial à população.",
                    ),

                    _buildLawCard(
                      "Artigo 3º ao 5º — Certificação e Penalidades",
                      "Art. 3º Os estabelecimentos de ensino são obrigados a afixar em local visível a certificação que comprove a capacitação.\n\n"
                          "Art. 4º O não cumprimento das disposições desta Lei implicará a imposição das seguintes penalidades pela autoridade administrativa, no âmbito de sua competência:\n"
                          "I - notificação de descumprimento da Lei;\n"
                          "II - multa, aplicada em dobro em caso de reincidência; ou\n"
                          "III - em caso de nova reincidência, a cassação do alvará de funcionamento ou da autorização concedida pelo órgão de educação, quando se tratar de creche ou estabelecimento particular de ensino ou de recreação, ou a responsabilização patrimonial do agente público, quando se tratar de creche ou estabelecimento público.\n\n"
                          "Art. 5º Os estabelecimentos de ensino de que trata esta Lei deverão estar integrados à rede de atenção de urgência e emergência de sua região e estabelecer fluxo de encaminhamento para uma unidade de saúde de referência.",
                    ),

                    _buildLawCard(
                      "Disposições Finais",
                      "Art. 6º O Poder Executivo definirá em regulamento os critérios para a implementação dos cursos de primeiros socorros previstos nesta Lei.\n\n"
                          "Art. 7º As despesas para a execução desta Lei correrão por conta de dotações orçamentárias próprias, incluídas pelo Poder Executivo nas propostas orçamentárias anuais e em seu plano plurianual.\n\n"
                          "Art. 8º Esta Lei entra em vigor após decorridos 180 (cento e oitenta) dias de sua publicação oficial.\n\n"
                          "Brasília, 4 de outubro de 2018; 197º da Independência e 130º da República.\n\n"
                          "MICHEL TEMER\n"
                          "Gustavo do Vale Rocha",
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }

  // Widget estruturado para criar os blocos de leitura da Lei
  Widget _buildLawCard(String title, String content, {bool isHighlight = false}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isHighlight
            ? Colors.white.withOpacity(0.12)
            : Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isHighlight
              ? const Color(0xFFFFB300).withOpacity(0.3)
              : Colors.white.withOpacity(0.1),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isHighlight ? const Color(0xFFFFB300) : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 15,
              height: 1.5,
            ),
            textAlign: TextAlign.start, // Alinhamento fluido que evita espaços bizarros entre palavras
          ),
        ],
      ),
    );
  }

  // Cabeçalho Limpo e Alinhado
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
                onPressed: () => Navigator.pop(context),
              ),
              const Text(
                "Lei Lucas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Logo com tamanho ajustado para não quebrar a simetria da barra superior
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/logo_app.png',
                  height: 45,
                  width: 45,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.menu_book_rounded, color: Colors.white70);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFFFFB300),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}