import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:harry/onboarding.dart';
import 'home_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}
class _OnboardingState extends State<Onboarding> {

  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(()=> isLastPage = index == 2);
          },
          children: [
            OnboardingPage(
                image:'assets/images/page1.png',
                titre: "Bienvenue chez VisiGen: The Card Ops",
                description: "Notre Mission ?\n Vous transformé en professionnel ultra stylé grace une carte de visite unique.",
                backgroundColor: Colors.red,
            ),
            OnboardingPage(
              image:'assets/images/page2.png',
              titre: "Personnalisez !",
              description: "Choisissez un design qui vous correspond.",
              backgroundColor: Colors.red,
            ),
            OnboardingPage(
              image:'assets/images/page3.png',
              titre: "Exportez en PDF !",
              description: "Partagez votre carte de manière professionnelle.",
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage? Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              foregroundColor:Colors.white,
              backgroundColor: Colors.red,
              minimumSize: Size.fromHeight(80)
            ),
            onPressed: ()async{
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', true);

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=>HomePage()));
            },
            child: Text(
              "Allons Y !",
              style: TextStyle(fontSize: 24),
            )),
      ) : Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: ()=>controller.jumpToPage(2),
                child: Text("Passer",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18
                  ),
                )
            ),
            Center(
              child: SmoothPageIndicator(
                  controller: controller,  // PageController
                  count:  3,
                  effect:  WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.red,
                    dotHeight: 12.0, // Hauteur des dots
                    dotWidth: 12.0, // Largeur des dots
                    spacing: 8.0, // Espacement entre les dots
                  ),

              )
            ),
            TextButton(
                onPressed: ()=>controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutCirc
                ),
                child: Text("Suivant",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
