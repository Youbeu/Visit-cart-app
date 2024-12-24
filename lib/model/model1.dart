import 'package:flutter/material.dart';
import 'package:harry/pages/model_preview_page.dart';

// ******Ces commentaires sont valides pour mes fichiers model1 à model5.dart******//

// Classe Model1 qui représente un modèle de carte affichant des informations utilisateur
class Model1 extends StatelessWidget {
  // Déclaration d'un Map pour stocker les données utilisateur
  final Map<String, String> userData;

  // Constructeur de la classe Model1 qui nécessite un Map de données utilisateur
  const Model1({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // La méthode build crée l'interface utilisateur pour ce widget
    return GestureDetector(
      // Ajoute un détecteur de gestes pour permettre d'interagir avec la carte
      onTap: () {
        // Lorsque la carte est tapée, on navigue vers la page de prévisualisation du modèle
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ModelPreviewPage(
              modelWidget: buildCard(userData), // Passe le widget de la carte avec les données utilisateur
              userData: userData, // Passe également les données utilisateur pour une utilisation ultérieure
            ),
          ),
        );
      },
      child: buildCard(userData), // Affiche la carte avec les données utilisateur
    );
  }

  // Méthode pour construire la carte avec les informations utilisateur
  Widget buildCard(Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10), // Marge verticale pour espacer les cartes
      padding: const EdgeInsets.all(15), // Padding intérieur pour espacer le contenu
      decoration: BoxDecoration(
        color: Colors.white, // Couleur de fond de la carte
        borderRadius: BorderRadius.circular(10), // Arrondi des coins de la carte
        border: Border.all(color: Colors.black, width: 1), // Bordure noire autour de la carte
      ),
      child: Row(
        children: [
          // Container pour afficher une image ou une icône par défaut
          Container(
            width: 60, // Largeur fixe de l'icône
            height: 60, // Hauteur fixe de l'icône
            color: Colors.grey.shade300, // Couleur de fond grise pour l'espace de l'image
            child: const Icon(Icons.image, size: 40, color: Colors.black), // Icône d'image
          ),
          const SizedBox(width: 15), // Espace horizontal entre l'image et le texte
          Expanded(
            // Permet au texte de s'étendre pour occuper l'espace disponible
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche du texte
              mainAxisAlignment: MainAxisAlignment.center, // Centrage vertical du texte
              children: [
                // Affichage du nom de l'utilisateur, avec une valeur par défaut vide si non disponible
                Text("Nom : ${data['name'] ?? ''}",
                    style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 5), // Espace vertical entre les lignes de texte
                // Affichage de la profession de l'utilisateur
                Text("Profession : ${data['profession'] ?? ''}",
                    style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 5), // Espace vertical
                // Affichage du numéro de téléphone
                Text("Téléphone : ${data['phone'] ?? ''}",
                    style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 5), // Espace vertical
                // Affichage de l'email de l'utilisateur
                Text("Email : ${data['email'] ?? ''}",
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
