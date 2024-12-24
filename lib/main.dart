import 'package:flutter/material.dart';
import 'package:harry/pages/home_page.dart';
import 'package:harry/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db.dart';

Future<void> main() async {
  // Pour s'assurez que le widget de l'arbre de widgets est correctement lié avant d'exécuter l'application.
  WidgetsFlutterBinding.ensureInitialized();

  // Récupére une instance des SharedPreferences.
  final prefs = await SharedPreferences.getInstance();
  // Vérifie si l'utilisateur a déjà vu la page d'accueil.
  final showHome = prefs.getBool('showHome') ?? false;
  // Initialise la base de données.
  final db = await Db.instance.database;

  // Lance l'application en passant la variable showHome.
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: showHome ? HomePage() : Onboarding(), // Affiche la HomePage ou Onboarding en fonction de showHome.
    );
  }
}
