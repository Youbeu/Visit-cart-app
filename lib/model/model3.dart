import 'package:flutter/material.dart';

class Model3 extends StatelessWidget {
  const Model3({super.key});

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
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.grey.shade800,
              child: const Icon(Icons.image, size: 40, color: Colors.white),
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

