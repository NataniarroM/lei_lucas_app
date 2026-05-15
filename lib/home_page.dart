import 'package:flutter/material.dart';
import 'credits_page.dart';
import 'selection_menu_page.dart';
import 'navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'quiz.dart';
import 'lucas_law.dart';

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
                ),
              ),

              const SizedBox(height: 10),

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

  Widget _buildMainButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 320,
      height: 75,

      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),

        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),

            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF005C66),
                Color(0xFF001E2B),
              ],
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),

          child: Container(
            alignment: Alignment.center,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Icon(
                  icon,
                  color: Colors.white,
                  size: 34,
                ),

                const SizedBox(width: 15),

                Text(
                  text,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
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

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),

                      borderRadius: BorderRadius.circular(35),

                      border: Border.all(
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Text(
                                  "Lei Lucas",

                                  style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFB300),
                                  ),
                                ),

                                SizedBox(height: 10),

                                Text(
                                  "Primeiros socorros",

                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LucasLawPage(),
                                  ),
                                );
                              },

                              child: Container(
                                width: 85,
                                height: 85,

                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(4),

                                  child: Image.asset(
                                    'assets/logo_grande.png',
                                    width: 85,
                                    height: 85,
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        Container(
                          width: double.infinity,
                          height: 4,

                          decoration: BoxDecoration(
                            color: const Color(0xFFFFB300),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),

                        const Spacer(),

                        Center(
                          child: Column(
                            children: [

                              _buildMainButton(
                                icon: Icons.psychology_alt_rounded,
                                text: "QUIZ DE TREINO",

                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const QuizPage(),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 25),

                              _buildMainButton(
                                icon: Icons.menu_book_rounded,
                                text: "APRENDER",

                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const SelectionMenuPage(),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 25),

                              _buildMainButton(
                                icon: Icons.info_outline_rounded,
                                text: "INFORMAÇÕES",

                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const CreditsPage(),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 50),

                              SizedBox(
                                width: 180,
                                height: 75,

                                child: ElevatedButton(
                                  onPressed: () => _openSOS(context),

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE00000),

                                    elevation: 12,

                                    shadowColor: Colors.redAccent,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                  ),

                                  child: const Text(
                                    "SOS",

                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),
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
    );
  }
}