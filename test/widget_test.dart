import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry/main.dart';
import 'package:harry/pages/home_page.dart';
import 'package:harry/pages/onboarding_page.dart';

void main() {
  testWidgets('Affiche la page d\'accueil si showHome est true', (WidgetTester tester) async {
    // Montre l'application avec showHome = true
    await tester.pumpWidget(MyApp(showHome: true));

    // Vérifie si la page d'accueil est présente
    expect(find.byType(HomePage), findsOneWidget); // Vérifie la présence de HomePage
    expect(find.byType(Onboarding), findsNothing); // Vérifie l'absence d'Onboarding
  });

  testWidgets('Affiche la page d\'onboarding si showHome est false', (WidgetTester tester) async {
    // Montre l'application avec showHome = false
    await tester.pumpWidget(MyApp(showHome: false));

    // Vérifie si la page d'onboarding est présente
    expect(find.byType(Onboarding), findsOneWidget); // Vérifie la présence d'Onboarding
    expect(find.byType(HomePage), findsNothing); // Vérifie l'absence de HomePage
  });
 

}
