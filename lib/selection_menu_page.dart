import 'package:flutter/material.dart';
import 'content_page.dart';
import 'navigation_bar.dart';

// --- 1. MODELO DE DADOS ---
// Centralizamos aqui para que sua parceira possa editar as categorias facilmente
class TopicCategory {
  final String name;
  final String iconPath;
  final Color color;

  TopicCategory({
    required this.name,
    required this.iconPath,
    required this.color
  });
}

// --- 2. PÁGINA DE SELEÇÃO ---
class SelectionMenuPage extends StatelessWidget {
  const SelectionMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D5B5E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Primeiros socorros",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                // Linha laranja fixa no topo
                const SizedBox(height: 10),
                Container(
                  width: 250,
                  height: 3,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB000),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                // Spacer flexível para empurrar os botões para baixo
                const Spacer(flex: 2),

                // Grid dos botões
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    shrinkWrap: true, // Garante que não corte o conteúdo
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.0,
                    children: [
                      _subjectButton(context, "Engasgo", "assets/engasgo.png"),
                      _subjectButton(context, "Parada Cardíaca", "assets/parada.png"),
                      _subjectButton(context, "Queimaduras", "assets/queimadura.png"),
                      _subjectButton(context, "Ferimentos", "assets/ferimento.png"),
                      _subjectButton(context, "Reações Alérgicas", "assets/alergia.png"),
                      _subjectButton(context, "Hemorragias Nasais", "assets/nasais.png"),
                    ],
                  ),
                ),

                // Spacer inferior maior para manter o equilíbrio
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }

  // Widget do Botão com Animação
  Widget _subjectButton(BuildContext context, String subject, String imagem) {
    final ValueNotifier<double> scale = ValueNotifier(1.0);

    return GestureDetector(
      onTapDown: (_) => scale.value = 0.94,
      onTapUp: (_) => scale.value = 1.0,
      onTapCancel: () => scale.value = 1.0,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContentPage(title: subject),
          ),
        );
      },
      child: ValueListenableBuilder<double>(
        valueListenable: scale,
        builder: (context, value, child) {
          return AnimatedScale(
            scale: value,
            duration: const Duration(milliseconds: 100),
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              imagem,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}