import 'package:flutter/material.dart';
import 'navigation_bar.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Créditos",
          style: TextStyle(
            color: Color(0xFFFFA100),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF337074), Color(0xFF9ED8DB)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 180,
                  height: 2,
                  color: const Color(0xFFFFA100),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      // Sem 'const' aqui pois usa withOpacity
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView( // Permite scroll se o texto for longo
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Unisagrado",
                            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Desenvolvimento de Software",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 15),
                          // LOGO CC LOGO ABAIXO DO TEXTO
                          SizedBox(
                            height: 70,
                            child: Image.asset("assets/logo_cc.png", fit: BoxFit.contain),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Prof. Dr. Elvio Gilberto da Silva",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 25),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Desenvolvedores:", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Thainara Tentor Mangile de Barros\nLaisa Ariele Alba\nLorena Ishikawa Aranha\nNataniarro Murilo da Silva\nLeonardo Campos",
                              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Colaboradores:", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Silvia Ishikawa", style: TextStyle(color: Colors.white, fontSize: 16)),
                          ),
                          const SizedBox(height: 30),
                          // LOGO FINAL
                          SizedBox(
                            height: 70,
                            child: Image.asset("assets/extensao.png", fit: BoxFit.contain),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const NavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}