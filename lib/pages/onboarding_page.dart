import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:harry/onboarding.dart'; // Assurez-vous que ce fichier existe et est correctement importé.
import 'home_page.dart'; // Import de la page d'accueil.

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController(); // Contrôleur pour gérer le défilement des pages.
  bool isLastPage = false; // Indique si l'utilisateur est à la dernière page.

  @override
  void dispose() {
    controller.dispose(); // Libère les ressources du contrôleur lors de la destruction de l'état.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80), // Espace en bas pour le bouton de navigation.
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            // Met à jour l'état pour savoir si l'utilisateur est sur la dernière page.
            setState(() => isLastPage = index == 2);
          },
          children: [
            OnboardingPage(
              image: 'assets/images/page1.png',
              titre: "Bienvenue chez VisiGen: The Card Ops",
              description: "Notre Mission ?\n Vous transformé en professionnel ultra stylé grace une carte de visite unique.",
              backgroundColor: Colors.red,
            ),
            OnboardingPage(
              image: 'assets/images/page2.png',
              titre: "Personnalisez !",
              description: "Choisissez un design qui vous correspond.",
              backgroundColor: Colors.red,
            ),
            OnboardingPage(
              image: 'assets/images/page3.png',
              titre: "Exportez en PDF !",
              description: "Partagez votre carte de manière professionnelle.",
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Coins arrondis pour le bouton.
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            minimumSize: Size.fromHeight(80), // Taille minimale du bouton.
          ),
          onPressed: () async {
            // Stocke une préférence indiquant que l'onboarding a été vu.
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showHome', true);

            // Remplace la page actuelle par la page d'accueil.
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text(
            "Allons Y !",
            style: TextStyle(fontSize: 24),
          ),
        ),
      )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 20), // Espacement horizontal pour le bas du conteneur.
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.jumpToPage(2), // Passe directement à la dernière page.
              child: Text(
                "Passer",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller, // PageController
                count: 3, // Nombre total de pages.
                effect: WormEffect(
                  dotColor: Colors.grey, // Couleur des dots inactifs.
                  activeDotColor: Colors.red, // Couleur du dot actif.
                  dotHeight: 12.0, // Hauteur des dots.
                  dotWidth: 12.0, // Largeur des dots.
                  spacing: 8.0, // Espacement entre les dots.
                ),
              ),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                duration: Duration(milliseconds: 500), // Durée de la transition.
                curve: Curves.easeInOutCirc, // Courbe de transition.
              ),
              child: Text(
                "Suivant",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
