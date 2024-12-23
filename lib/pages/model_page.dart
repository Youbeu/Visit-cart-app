import 'package:flutter/material.dart';

import 'model_preview_page.dart';

class ModelPage extends StatelessWidget {
  const ModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Selectionner Votre Modèle",
          style: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75
          ),
          itemCount: 5,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModelPreviewPage(modelIndex: index),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 100, color: Colors.red), // Remplacer par une image
                    const SizedBox(height: 10),
                    Text(
                      "Modèle ${index + 1}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      )
    );
  }
}
