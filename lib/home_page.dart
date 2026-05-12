import 'package:flutter/material.dart';
import 'credits_page.dart';
import 'selection_menu_page.dart';
import 'navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openSOS(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("X"),
          ),
        ],
        title: const Text("EMERGÊNCIA"),
        content: const Text("190 - 192 - 193"),
      ),
    );
  }

  void _openShutUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("X"),
          ),
        ],
        title: const Text("Laisa SHIU!"),
        content: const Text("A tela vai ser feita depois"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D5C63),
              Color(0xFF78F0F0),
            ],
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [

              // Conteúdo principal
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    // Glass container
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(25),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),

                        borderRadius: BorderRadius.circular(30),

                        border: Border.all(
                          color: Colors.white.withOpacity(0.20),
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                            onPressed: () => _openShutUp(context),
                            child: const Text("QUIZ DE TREINO"),
                          ),

                          const SizedBox(height: 15),

                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const SelectionMenuPage(),
                              ),
                            ),
                            child: const Text("APRENDER"),
                          ),

                          const SizedBox(height: 15),

                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const CreditsPage(),
                              ),
                            ),
                            child: const Text("INFORMAÇÕES"),
                          ),

                          const SizedBox(height: 25),

                          ElevatedButton(
                            onPressed: () => _openSOS(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text("SOS"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Navbar
              const NavBar(),
            ],
          ),
        ),
      ),
    );
  }
}