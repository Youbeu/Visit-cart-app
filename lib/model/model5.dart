import 'package:flutter/material.dart';

class Model5 extends StatelessWidget {
  const Model5({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Yo le YAC!!");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade800,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.deepPurpleAccent, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.white,
              child: const Icon(Icons.image, size: 40, color: Colors.deepPurpleAccent),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Nom :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Colors.white)),
                SizedBox(height: 5),
                Text("Profession :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Colors.white)),
                SizedBox(height: 5),
                Text("Téléphone :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Colors.white)),
                SizedBox(height: 5),
                Text("Email :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

