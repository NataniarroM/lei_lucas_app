import 'package:flutter/material.dart';
import 'navigation_bar.dart';

class LucasLawPage extends StatelessWidget {
  const LucasLawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Esse negócio de gradiente não ajuda
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2F6F73), Color(0xFFFEC370), Color(0xFFFEC370)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Cabeçalho
              _buildHeader(context),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      // Imagem Principal
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/lei_lucas_banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Texto da Lei, os blocos são grandes mas é o que tem para hoje
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white12),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "LEI Nº 13.722, DE 4 DE OUTUBRO DE 2018",
                              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "A Lei Lucas torna obrigatória a capacitação em noções básicas de primeiros socorros de professores e funcionários de estabelecimentos de ensino públicos e privados de educação básica e de estabelecimentos de recreação infantil.\n\n"

                                  "Art. 1º  Os estabelecimentos de ensino de educação básica da rede pública, por meio dos respectivos sistemas de ensino, e os estabelecimentos de ensino de educação básica e de recreação infantil da rede privada deverão capacitar professores e funcionários em noções de primeiros socorros.\n\n"
                                  "§ 1º O curso deverá ser ofertado anualmente e destinar-se-á à capacitação e/ou à reciclagem de parte dos professores e funcionários dos estabelecimentos de ensino e recreação a que se refere o caput deste artigo, sem prejuízo de suas atividades ordinárias.\n\n"
                                  "§ 2º A quantidade de profissionais capacitados em cada estabelecimento de ensino ou de recreação será definida em regulamento, guardada a proporção com o tamanho do corpo de professores e funcionários ou com o fluxo de atendimento de crianças e adolescentes no estabelecimento.\n\n"
                                  "§ 3º A responsabilidade pela capacitação dos professores e funcionários dos estabelecimentos públicos caberá aos respectivos sistemas ou redes de ensino\n\n"

                                  "Art. 2º  Os cursos de primeiros socorros serão ministrados por entidades municipais ou estaduais especializadas em práticas de auxílio imediato e emergencial à população, no caso dos estabelecimentos públicos, e por profissionais habilitados, no caso dos estabelecimentos privados, e têm por objetivo capacitar os professores e funcionários para identificar e agir preventivamente em situações de emergência e urgência médicas, até que o suporte médico especializado, local ou remoto, se torne possível.\n\n"
                                  "§ 1º O conteúdo dos cursos de primeiros socorros básicos ministrados deverá ser condizente com a natureza e a faixa etária do público atendido nos estabelecimentos de ensino ou de recreação.\n\n"
                                  "§ 2º Os estabelecimentos de ensino ou de recreação das redes pública e particular deverão dispor de kits de primeiros socorros, conforme orientação das entidades especializadas em atendimento emergencial à população.\n\n"

                                  "Art. 3º  Os estabelecimentos de ensino são obrigados a afixar em local visível a certificação que comprove a capacitação.\n\n"

                                  "Art. 4º O não cumprimento das disposições desta Lei implicará a imposição das seguintes penalidades pela autoridade administrativa, no âmbito de sua competência:\n\n"
                                  "I - notificação de descumprimento da Lei;\n"
                                  "II - multa, aplicada em dobro em caso de reincidência; ou\n"
                                  "II - em caso de nova reincidência, a cassação do alvará de funcionamento ou da autorização concedida pelo órgão de educação, quando se tratar de creche ou estabelecimento particular de ensino ou de recreação, ou a responsabilização patrimonial do agente público, quando se tratar de creche ou estabelecimento público.\n\n"

                                  "Art. 5º Os estabelecimentos de ensino de que trata esta Lei deverão estar integrados à rede de atenção de urgência e emergência de sua região e estabelecer fluxo de encaminhamento para uma unidade de saúde de referência.\n\n"

                                  "Art. 6º O Poder Executivo definirá em regulamento os critérios para a implementação dos cursos de primeiros socorros previstos nesta Lei\n\n"

                                  "Art. 7º As despesas para a execução desta Lei correrão por conta de dotações orçamentárias próprias, incluídas pelo Poder Executivo nas propostas orçamentárias anuais e em seu plano plurianual.\n\n"

                                  "Art. 8º Esta Lei entra em vigor após decorridos 180 (cento e oitenta) dias de sua publicação oficial\n\n"

                                  "Brasília, 4 de outubro de 2018; 197º da Independência e 130º da República.\n"
                                  "MICHEL TEMER\n"
                                  "Gustavo do Vale Rocha",
                              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.6),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              const NavBar(),
            ],
          ),
        ),
      ),
    );
  }

  // Cabeçalho
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [

          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                //Botão de retorno
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white70),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              //LEI LUCAS - Agora centralizado, por favor
              const Text(
                "Lei Lucas",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              ),

              // Essa imagem não mexe muito, espero que esteja bom assim
              Align(
                alignment: Alignment.topRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/logo_app.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, color: Colors.white24);
                    },
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.orange, thickness: 2, indent: 40, endIndent: 40),
        ],
      ),
    );
  }
}