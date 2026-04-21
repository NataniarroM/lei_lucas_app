import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // canPop retorna se há ou não telas para voltar
    bool mayComeback = Navigator.of(context).canPop();

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: mayComeback ? Colors.blue : Colors.grey,
              //Se o retorno é verdadeira, o botão fica azul
              //Do contrário fica cinza
              //A sintaxe condicional é bem bonita, gostei do Dart
            ),
            onPressed: mayComeback
                ? () => Navigator.of(context).popUntil((route) => route.isFirst)
                : null, //Simples, se tem telas volta, senão o botão nada faz
          ),
        ],
      ),
    );
  }
}