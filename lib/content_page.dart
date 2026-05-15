import 'package:flutter/material.dart';
import 'content_data.dart';
import 'navigation_bar.dart';

class ContentPage extends StatelessWidget {
  final String title;
  const ContentPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final content = allTopics[title];

    return Scaffold(
      body: Container(
        // Famoso gradiente que a Laisa pediu
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1B4D4D), Color(0xFF4FA9A9)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Seta para voltar, coisa linda
              _buildHeader(context, title),

              Expanded(
                //Temos uma condição
                child: content == null
                    // Se não tiver o tópico dado pela outra página retorna isso
                    ? const Center(child: Text("Conteúdo não encontrado"))

                    // Se tiver, faz a construção do scroll
                    : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [

                      // Imagem da emergência
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(content.emergencyImagePath),
                      ),
                      const SizedBox(height: 20),

                      // Card de identificação
                      _buildInfoCard("Identifique", Icons.search, content.identifyList),

                      // Imagem do que fazer
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(content.techniqueImagePath),
                      ),
                      const SizedBox(height: 20),

                      // Mantenha os dois em sequência, fica mais fácil
                      _buildInfoCard("O que fazer", Icons.info_outline, content.whatToDoList),
                      _buildInfoCard("Não faça", Icons.warning_amber_rounded, content.dontDoList),

                      //Imagem da criança salva
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(content.solutionImagePath),
                      ),
                      const SizedBox(height: 20),

                      // Lorena, pode mexer o quanto quiser no card de alerta
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF5350).withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          content.alertText,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
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

  // Cada card passa por essa criação, bem mais fácil
  Widget _buildInfoCard(String title, IconData icon, List<String> items) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.orange, size: 20),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          const SizedBox(height: 10),
          // Nunca vi esse operador, mas ficou muito bom
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text("• $item", style: const TextStyle(color: Colors.white, fontSize: 15)),
          )),
        ],
      ),
    );
  }

  // Isso pode ser útil para as outras telas
  Widget _buildHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white70),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 48), // Espaçamento para centralizar o título
            ],
          ),
          const Divider(color: Colors.orange, thickness: 2, indent: 60, endIndent: 60),
        ],
      ),
    );
  }
}