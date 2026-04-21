import 'package:flutter/material.dart';
import 'navigation_bar.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quem Somos")),
      body: const Center(
        child: Text("Unisagrado - Desenvolvimento de Sistemas"),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

//Tela sem nada, se divirtam depois