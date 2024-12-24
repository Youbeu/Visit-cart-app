import 'package:flutter/material.dart';
import 'package:harry/model/model3.dart';
import '../model/model1.dart';
import '../model/model2.dart';
import '../model/model4.dart';
import '../model/model5.dart';
import 'package:harry/db.dart';

class ModelPage extends StatefulWidget {
  const ModelPage({super.key});

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  Map<String, String>? userData; // Stocke les données de l'utilisateur

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Charge les données utilisateur lors de l'initialisation
  }

  // Méthode pour charger les données utilisateur à partir de la base de données
  Future<void> _loadUserData() async {
    final data = await Db.instance.getUserData(); // Récupère les données de la DB
    setState(() {
      userData = data; // Met à jour l'état avec les données chargées
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Choisissez un Modèle",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Affiche les différents modèles en passant les données utilisateur
              Model1(userData: userData!),
              Model2(userData: userData!),
              Model3(userData: userData!),
              Model4(userData: userData!),
              Model5(userData: userData!),
            ],
          ),
        ),
      ),
    );
  }
}
