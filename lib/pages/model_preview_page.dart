import 'package:flutter/material.dart';

class ModelPreviewPage extends StatelessWidget {
  final int modelIndex;

  const ModelPreviewPage({Key? key, required this.modelIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Visualisation du Modèle ${modelIndex + 1}",
          style: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          "Affichage du modèle ${modelIndex + 1}",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
