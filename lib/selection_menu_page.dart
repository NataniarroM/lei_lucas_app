import 'package:flutter/material.dart';

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

final List<TopicCategory> categories = [
  TopicCategory(name: "Engasgo", iconPath: "assets/ic_engasgo.png", color: Colors.yellow),
  TopicCategory(name: "Parada", iconPath: "assets/ic_parada.png", color: Colors.redAccent),
  TopicCategory(name: "Queimaduras", iconPath: "assets/ic_fogo.png", color: Colors.orange),
  TopicCategory(name: "Ferimentos", iconPath: "assets/ic_maleta.png", color: Colors.blue),
  TopicCategory(name: "Reações Alérgicas", iconPath: "assets/ic_bebe.png", color: Colors.purpleAccent),
  TopicCategory(name: "Hemorragias Nasais", iconPath: "assets/ic_nariz.png", color: Colors.greenAccent),
];

// --- 2. PÁGINA DE SELEÇÃO ---
class SelectionMenuPage extends StatelessWidget {
  const SelectionMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fundo com o gradiente padrão do projeto
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
              _buildHeader(),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,       // 2 colunas como no rascunho
                    crossAxisSpacing: 20,    // Espaço lateral entre cards
                    mainAxisSpacing: 20,     // Espaço vertical entre cards
                    childAspectRatio: 0.85,  // Ajusta a proporção altura/largura
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return _buildTopicCard(context, categories[index]);
                  },
                ),
              ),
              // Simulação da NavBar (Caso não queira importar o arquivo agora)
              _buildSimpleNavBar(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget dos Cards Individuais
  Widget _buildTopicCard(BuildContext context, TopicCategory item) {
    return InkWell(
      onTap: () => debugPrint("Navegação: ${item.name}"),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Barra de cor no topo do card
            Container(
              height: 12,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  item.iconPath,
                  height: 65,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF2D6A6A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cabeçalho da Tela
  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.only(top: 30, bottom: 10),
      child: Column(
        children: [
          Text(
            "Primeiros socorros",
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 5),
          Divider(
              color: Colors.orange,
              thickness: 2,
              indent: 80,
              endIndent: 80
          ),
        ],
      ),
    );
  }

  // NavBar básica integrada para visualização
  Widget _buildSimpleNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.volunteer_activism, color: Colors.white70),
          Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.account_circle, color: Colors.white70),
        ],
      ),
    );
  }
}