import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importação essencial para abrir links externos
import 'navigation_bar.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  // Função assíncrona responsável por disparar o navegador nativo de forma segura
  Future<void> _abrirPoliticaPrivacidade(BuildContext context) async {
    // Cole aqui a URL exata gerada no seu Microsoft Sway ou Google Sites
    final Uri url = Uri.parse('https://sway.cloud.microsoft/gjobTFcgeaxnedPx?ref=Link');

    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Não foi possível abrir o link.');
      }
    } catch (e) {
      // Fallback de segurança caso ocorra algum erro inesperado no dispositivo
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Não foi possível abrir a Política de Privacidade no momento.'),
            backgroundColor: Color(0xFFEF5350),
          ),
        );
      }
    }
  }

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
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView(
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
                              "Thainara Tentor Mangile de Barros\nLaisa Ariele Alba\nLorena Ishikawa Aranha\nNataniarro Murilo da Silva\nLeonardo Corrêa Gama",
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

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.white12),
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.privacy_tip_rounded, color: Color(0xFFFFA100)),
                              title: const Text(
                                "Política de Privacidade",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white70, size: 16),
                              onTap: () => _abrirPoliticaPrivacidade(context),
                            ),
                          ),
                          const SizedBox(height: 30),

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