import 'package:flutter/material.dart';

class Model2 extends StatelessWidget {
  const Model2({super.key});

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
          color: Colors.blue.shade700,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue.shade900, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.white,
              child: const Icon(Icons.image, size: 40, color: Colors.blue),
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

