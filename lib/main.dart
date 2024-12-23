import 'package:flutter/material.dart';
import 'package:harry/pages/home.dart';
import 'package:harry/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();


  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  final db = await Db.instance.database;


  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: showHome ? HomePage() : Onboarding(),
    );
  }
}
