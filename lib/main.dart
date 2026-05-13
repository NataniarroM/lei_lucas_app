//Deixei comentários para que o código fique mais claro. Laisa, faz shiu.
//Tenho escrito a maioria das coisas em inglês recentemente
//Se não gostarem, me avisem

import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp()); //Inicialização
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  //Tela inicial temporária
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      //Altera o tempo de espera

      if (!mounted) return;

      //Isso é para encerrar o programa se o usuário sair antes de abrir a home
      //Requisito do Flutter, não tinha muito o que fazer

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );

      //Em resumo, o Flutter espera 2 segundos e avança para home
    });
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

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Image.asset(
                'assets/logo_app.png',
                width: 180,
                height: 180,
              ),

              const SizedBox(height: 20),

              const Text(
                "Lei Lucas",

                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Primeiros socorros nas escolas",

                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),

              const SizedBox(
                width: 35,
                height: 35,

                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}