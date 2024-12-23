import 'package:flutter/material.dart';
import 'package:harry/db.dart';

class ModelPreviewPage extends StatefulWidget {
  final Widget modelWidget; // Le widget du modèle sélectionné

  const ModelPreviewPage({
    Key? key,
    required this.modelWidget, required Map<String, String> userData,
  }) : super(key: key);

  @override
  State<ModelPreviewPage> createState() => _ModelPreviewPageState();
}

class _ModelPreviewPageState extends State<ModelPreviewPage> {
  Map<String, String>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await Db.instance.getUserData(); // Récupère les données depuis SQLite
    setState(() {
      userData = data; // Met à jour l'état avec les données récupérées
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Prévisualisez et Téléchargez !!!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: userData == null
            ? const Center(child: CircularProgressIndicator()) // Indique le chargement
            : Column(
          children: [
            Expanded(
              // Passe les données au modèle pour les afficher
              child: widget.modelWidget,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implémentation pour le téléchargement plus tard
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                "Télécharger",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
