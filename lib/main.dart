//Deixei comentários para que o código fique mais claro. Laisa, faz shiu.
//Tenho escrito a maioria das coisas em inglês recentemente
//Se não gostarem, me avisem

import 'package:flutter/material.dart';
import 'home_page.dart';


void main(){
  runApp(const MyApp()); //Inicialização
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget { //Tela inicial temporária
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () { //Altera o tempo de espera
      if (!mounted) return;
      //Isso é para encerrar o programa se o usuário sair antes de abrir a home
      //Requisito do Flutter, não tinha muito o que fazer

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage())
          //Em resumo, o Flutter espera 1 segundo e avança para home

      );
    });
  }

  @override
  Widget build(BuildContext context) { // Construtor com a imagem
    return Scaffold(
      body: Center(
          child: Image.asset(
            'assets/logo_app.png',
            width: 200,
            height: 200,
          )
      ),
    );
  }
}