import 'package:flutter/material.dart';
import 'content_page.dart';
import 'navigation_bar.dart';

class SelectionMenuPage extends StatelessWidget {
  const SelectionMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Primeiros Socorros"),
      ),

      body: Center(

        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 15),

          child: GridView.count(

            mainAxisSpacing: 15,

            crossAxisCount:
            MediaQuery.of(context).size.width < 600 ? 2 : 3,

            crossAxisSpacing: 15,

            childAspectRatio: 0.95,

            padding: const EdgeInsets.all(15),

            children: [

              _subjectButton(context, "Engasgo"),

              _subjectButton(context, "Ferimentos"),

              _subjectButton(context, "Parada Cardíaca"),

              _subjectButton(context, "Queimaduras"),

              _subjectButton(context, "Reações Alérgicas"),

              _subjectButton(context, "Hemorragia Nasais"),
            ],
          ),
        ),
      ),

      //Um Grid simples, se quiserem mais simetria teremos que usar columns

      bottomNavigationBar: const NavBar(),
    );
  }

  Widget _subjectButton(BuildContext context, String subject) {

    IconData icon;

    switch(subject) {

      case "Engasgo":
        icon = Icons.air;
        break;

      case "Ferimentos":
        icon = Icons.healing;
        break;

      case "Parada Cardíaca":
        icon = Icons.favorite;
        break;

      case "Queimaduras":
        icon = Icons.local_fire_department;
        break;

      case "Reações Alérgicas":
        icon = Icons.coronavirus;
        break;

      case "Hemorragia Nasais":
        icon = Icons.bloodtype;
        break;

      default:
        icon = Icons.medical_services;
    }

    return InkWell(

      borderRadius: BorderRadius.circular(30),

      onTap: () => Navigator.push(
        context,

        MaterialPageRoute(
          builder: (context) => ContentPage(title: subject),
        ),
      ),

      child: Container(

        decoration: BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [
              Colors.white.withOpacity(0.20),
              Colors.white.withOpacity(0.08),
            ],
          ),

          borderRadius: BorderRadius.circular(30),

          border: Border.all(
            color: Colors.white.withOpacity(0.15),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              size: 42,
              color: const Color(0xFF0D5C63),
            ),

            const SizedBox(height: 12),

            Text(
              subject,

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1B1B1B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//As meninas vão gostar do InkWell, ele permite transformar qualquer objeto clicável
//Tem opção de um clique(onTap), dois(onDoubleTap) e continuar presionando(onLongPress)