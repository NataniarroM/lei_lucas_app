import 'package:flutter/material.dart';
import 'content_page.dart';
import 'navigation_bar.dart';

class SelectionMenuPage extends StatelessWidget {
  const SelectionMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Primeiros Socorros")),
      body: Center(
        child: Padding(padding: const EdgeInsets.only(left: 100, right: 100),
          child: GridView.count(
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            childAspectRatio: 2,
            padding: const EdgeInsets.all(15),
            children: [
              _subjectButton(context, "Engasgo"),
              _subjectButton(context, "Ferimentos"),
              _subjectButton(context, "Parada"),
              _subjectButton(context, "Queimaduras"),
            ],
          ),
        ),
      ),
//Um Grid simples, se quiserem mais simetria teremos que usar columns
      bottomNavigationBar: const NavBar(),
    );
  }

  Widget _subjectButton(BuildContext context, String subject) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ContentPage(title: subject))
      ),
      child: Card(child: Center(child: Text(subject))),
    );
  }
}

//As meninas vão gostar do InkWell, ele permite transformar qualquer objeto clicável
//Tem opção de um clique(onTap), dois(onDoubleTap) e continuar presionando(onLongPress)