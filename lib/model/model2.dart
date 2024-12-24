import 'package:flutter/material.dart';
import 'package:harry/pages/model_preview_page.dart';

class Model2 extends StatelessWidget {
  final Map<String, String> userData;

  const Model2({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ModelPreviewPage(
              modelWidget: buildCard(userData), // Passe le widget avec les données
              userData: userData, // Passe également les données utilisateur
            ),
          ),
        );
      },
      child: buildCard(userData), // Affiche la carte avec les données
    );
  }

  Widget buildCard(Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.shade900, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            color: Colors.white,
            child: const Icon(Icons.image, size: 40, color: Colors.blue),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nom : ${data['name'] ?? ''}",
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  "Profession : ${data['profession'] ?? ''}",
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  "Téléphone : ${data['phone'] ?? ''}",
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  "Email : ${data['email'] ?? ''}",
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
