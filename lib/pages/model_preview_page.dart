import 'package:flutter/material.dart';
import 'package:harry/db.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class ModelPreviewPage extends StatefulWidget {
  final Widget modelWidget; // Widget du modèle sélectionné

  const ModelPreviewPage({
    Key? key,
    required this.modelWidget, // Récupère le modèle comme argument
    required Map<String, String> userData,
  }) : super(key: key);

  @override
  State<ModelPreviewPage> createState() => _ModelPreviewPageState();
}

class _ModelPreviewPageState extends State<ModelPreviewPage> {
  Map<String, String>? userData; // Stocke les données de l'utilisateur

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Charge les données utilisateur lors de l'initialisation
  }

  // Méthode pour récupérer les données utilisateur depuis la base de données
  Future<void> _loadUserData() async {
    final data = await Db.instance.getUserData(); // Appelle la méthode de la DB pour récupérer les données
    setState(() {
      userData = data; // Met à jour l'état avec les données chargées
    });
  }

  // Génère et ouvre un PDF contenant les informations de l'utilisateur
  Future<void> generateAndOpenPDF(Map<String, String> userData) async {
    try {
      final pdf = pw.Document(); // Crée une instance de document PDF

      // Ajoute une page avec le contenu de la carte
      pdf.addPage(
        pw.Page(
          build: (context) => pw.Center(
            child: pw.Container(
              width: 300,
              height: 150,
              decoration: pw.BoxDecoration(
                color: PdfColors.white,
                border: pw.Border.all(color: PdfColors.black, width: 2),
              ),
              child: pw.Padding(
                padding: const pw.EdgeInsets.all(10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Nom : ${userData['name'] ?? ''}", style: pw.TextStyle(fontSize: 18)),
                    pw.SizedBox(height: 5),
                    pw.Text("Profession : ${userData['profession'] ?? ''}", style: pw.TextStyle(fontSize: 16)),
                    pw.SizedBox(height: 5),
                    pw.Text("Téléphone : ${userData['phone'] ?? ''}", style: pw.TextStyle(fontSize: 16)),
                    pw.SizedBox(height: 5),
                    pw.Text("Email : ${userData['email'] ?? ''}", style: pw.TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Enregistre le PDF dans le répertoire temporaire
      final directory = await getTemporaryDirectory(); // Récupère le répertoire temporaire
      final file = File('${directory.path}/carte_de_visite.pdf'); // Définit le chemin du fichier PDF
      await file.writeAsBytes(await pdf.save()); // Sauvegarde le document PDF

      // Ouvre le fichier PDF
      await OpenFile.open(file.path);
    } catch (e) {
      print('Erreur lors de la génération du PDF : $e'); // Affiche l'erreur en cas d'échec
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Visualisez et Téléchargez !!!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: userData == null // Affiche un indicateur de chargement si les données sont encore nulles
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            Expanded(
              child: widget.modelWidget, // Affiche le modèle sélectionné
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: userData == null // Désactive le bouton si les données ne sont pas prêtes
                  ? null
                  : () async {
                await generateAndOpenPDF(userData!); // Génère et ouvre le PDF
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('PDF généré et ouvert avec succès !')), // Affiche un message de confirmation
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
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
