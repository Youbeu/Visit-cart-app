import 'package:flutter/material.dart';
import 'package:harry/model/model3.dart';
import '../model/model1.dart';
import '../model/model2.dart';
import '../model/model4.dart';
import '../model/model5.dart';
import 'package:harry/db.dart';

class ModelPage extends StatelessWidget {
  const ModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Choisissez un Modèle",
          style: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Model1(),
              Model2(),
              Model3(),
              Model4(),
              Model5(),
            ],
          ),
        ),
      ),
    );
  }
}
