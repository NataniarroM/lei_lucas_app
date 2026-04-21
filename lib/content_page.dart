import 'package:flutter/material.dart';
import 'navigation_bar.dart';

class ContentPage extends StatelessWidget {
  final String title;
  const ContentPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("Conteúdo sobre $title")),
      bottomNavigationBar: const NavBar(),
    );
  }
}

//A ideia é montar uma tela padrão que será preenchida pelo conteúdo de título selecionado