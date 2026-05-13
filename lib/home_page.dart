import 'package:flutter/material.dart';
import 'credits_page.dart';
import 'selection_menu_page.dart';
import 'navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openSOS(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,

        child: Container(
          padding: const EdgeInsets.all(25),

          decoration: BoxDecoration(
            color: const Color(0xFFE53935),

            borderRadius: BorderRadius.circular(30),

            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 3,
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              const Icon(
                Icons.warning_amber_rounded,
                size: 80,
                color: Colors.white,
              ),

              const SizedBox(height: 20),

              const Text(
                "EMERGÊNCIA",

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Números importantes",

                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 25),

              _buildEmergencyNumber(
                "🚓 Polícia",
                "190",
                    () => _callNumber("190"),
              ),
              _buildEmergencyNumber(
                "🚑 SAMU",
                "192",
                    () => _callNumber("192"),
              ),

              _buildEmergencyNumber(
                "🚒 Bombeiros",
                "193",
                    () => _callNumber("193"),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,

                    foregroundColor: const Color(0xFFE53935),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: const Text(
                    "FECHAR",

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _callNumber(String number) async {

    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: number,
    );

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }


  Widget _buildEmergencyNumber(
      String title,
      String number,
      VoidCallback onTap,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

        child: InkWell(
          onTap: onTap,

          borderRadius: BorderRadius.circular(18),

          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),

          borderRadius: BorderRadius.circular(18),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Text(
              title,

              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              number,

              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
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

                          const Icon(
                            Icons.health_and_safety,
                            size: 90,
                            color: Colors.white,
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Lei Lucas",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Primeiros socorros nas escolas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),

                          SizedBox(
                            width: 230,
                            height: 55,

                            child: ElevatedButton(
                              onPressed: () => _openShutUp(context),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.85),

                                foregroundColor: const Color(0xFF5E4FA2),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),

                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              child: const Text("QUIZ DE TREINO"),
                            ),
                          ),

                          const SizedBox(height: 18),

                          SizedBox(
                            width: 230,
                            height: 55,

                            child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const SelectionMenuPage(),
                                ),
                              ),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.85),

                                foregroundColor: const Color(0xFF5E4FA2),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),

                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              child: const Text("APRENDER"),
                            ),
                          ),

                          const SizedBox(height: 18),

                          SizedBox(
                            width: 230,
                            height: 55,

                            child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const CreditsPage(),
                                ),
                              ),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.85),

                                foregroundColor: const Color(0xFF5E4FA2),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),

                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              child: const Text("INFORMAÇÕES"),
                            ),
                          ),

                          const SizedBox(height: 25),

                          SizedBox(
                            width: 160,
                            height: 60,

                            child: ElevatedButton.icon(
                              onPressed: () => _openSOS(context),

                              icon: const Icon(
                                Icons.warning_rounded,
                                color: Colors.white,
                                size: 28,
                              ),

                              label: const Text(
                                "S.O.S",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE53935),

                                elevation: 10,

                                shadowColor: Colors.redAccent,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
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