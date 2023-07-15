
import 'package:flutter/material.dart';

import '../../style/style.dart';
import '../../widgets/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  PageController controller = PageController(initialPage: 0);

  var noOfScreens = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OnboardingPage(
            image: Image.asset("assets/images/3.png"),
            title: "Welcome to iThute",
            description:
            "A doctor's appointment booking app. Find the best doctors in your area.",
            noOfScreen: noOfScreens,
            onNextPressed: changeScreen,
            currentScreenNo: 0,
          ),
          OnboardingPage(
            image: Image.asset("assets/images/4.png"),
            title: "CHOOSE THE BEST",
            description:
                "Easy way to make an appointment with top doctor. ",
            noOfScreen: noOfScreens,
            onNextPressed: changeScreen,
            currentScreenNo: 1,
          ),
          //lets add 3rd screen
          OnboardingPage(
            image: Image.asset("assets/images/optometrist.png"),
            title: "INSTANT NOTIFICATIONS",
            description:
                "Get constant updates on appointments."
                ,
            noOfScreen: noOfScreens,
            onNextPressed: changeScreen,
            currentScreenNo: 2,
          ),
          //lets add 4th screen
          OnboardingPage(
            image: Image.asset("assets/images/logo.png"),
            title: "JOIN A HOMECELL",
            description:"",
            noOfScreen: noOfScreens,
            onNextPressed: changeScreen,
            currentScreenNo: 4,
          ),
        ],
      ),
    );
  }

  //Lets write function to change next onboarding screen
  void changeScreen(int nextScreenNo) {
    controller.animateToPage(nextScreenNo,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}