import 'package:flutter/material.dart';
import 'package:harry/model/model3.dart';
import '../model/model1.dart';
import '../model/model2.dart';
import '../model/model4.dart';
import '../model/model5.dart';
import 'package:harry/db.dart';

class ModelPage extends StatefulWidget {
  const ModelPage({super.key});

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  Map<String, String>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await Db.instance.getUserData();
    setState(() {
      userData = data;
    });
  }

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
              Model1(userData: userData!),
              Model2(userData: userData!),
              Model3(userData: userData!),
              Model4(userData: userData!),
              Model5(userData: userData!),
            ],
          ),
        ),
      ),
    );
  }
}
