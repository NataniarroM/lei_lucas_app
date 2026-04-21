import 'package:flutter/material.dart';
import 'credits_page.dart';
import 'selection_menu_page.dart';
import 'navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openSOS(BuildContext context) { //É um pop-up simples, bem vagabundo
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [TextButton(onPressed: () => Navigator.pop(context),
            child: const Text("X"))],
        title: const Text("EMERGÊNCIA"),
        content: const Text("190 - 192 - 193"),
      ),
    );
  }
  /*Podemos aplicar rows aqui, creio que ficará mais elegante
  * Fiz como quebra galho*/

  void _openShutUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [TextButton(onPressed: () => Navigator.pop(context),
            child: const Text("X"))],
        title: const Text("Laisa SHIU!"),
        content: const Text("A tela vai ser feita depois"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lei Lucas")),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //Botões e suas separações
              ElevatedButton(
                  onPressed: () => _openSOS(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red
                  ),
                  child: const Text("SOS")
              ),

              SizedBox(height: 15), //Separação

              ElevatedButton(onPressed: () => _openShutUp(context),
                  child: const Text("QUIZ DE TREINO")
              ),

              SizedBox(height: 15),

              ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(
                      builder: (context) => const SelectionMenuPage()
                      )
                  ),
                  child: const Text("APRENDER")
              ),

              SizedBox(height: 15),

              ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const CreditsPage()
                      )
                  ),
                  child: const Text("INFORMAÇÕES")
              ),
            ],
          ),
        ),
      ),
    bottomNavigationBar: const NavBar(), //Essa barra é constante nas telas
      // Ela sempre leva para a tela home, contanto que já não esteja nela.
      // Vejam o navigation_bar.dart depois
    );
  }
}