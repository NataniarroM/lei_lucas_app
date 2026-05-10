import 'package:flutter/material.dart';
import 'credits_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.transparent, // No colors girls and boy
      ),
      child: Column(
        children: [
          const Divider(color: Color(0xFF1D4C50), thickness: 1, indent: 30, endIndent: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Ícone do Unisagrado
              // Acho que ficou meio serrilhado, mas imagino que foi a melhor imagem que tinha
              IconButton(
                icon: Image.asset('assets/logo_unisagrado.png', height: 24),
                onPressed: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => const CreditsPage()
                  )
                ),
              ),
              // Home
              // Como pedido, sempre volta para a home
              IconButton(
                icon: const Icon(Icons.home, color: Color(0xFF1D4C50)),
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              ),
              // Perfil, vai mostrar o progresso
              // Vou verificar como faremos gatilhos nas páginas
              IconButton(
                icon: const Icon(Icons.account_circle, color: Color(0xFF1D4C50)),
                onPressed: () => _showProgressDialog(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Progresso"),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Não sei bem como por esse progresso
          ],
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
      ),
    );
  }
}