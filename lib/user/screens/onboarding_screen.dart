
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
            image: Image.asset("assets/images/1.png"),
            title: "Welcome to iThute",
            description:
            "A mobile application that allows you to monitor your child's school progress.",
            noOfScreen: noOfScreens,
            onNextPressed: changeScreen,
            currentScreenNo: 0,
          ),
          OnboardingPage(
            image: Image.asset("assets/images/2.png"),
            title: "CHOOSE THE BEST",
            description:
                "Every child is different, and so each child's needs and learning style are also different. ",
            noOfScreen: noOfScreens,
            onNextPressed: changeScreen,
            currentScreenNo: 1,
          ),
          //lets add 3rd screen
          OnboardingPage(
            image: Image.asset("assets/images/3.png"),
            title: "INSTANT NOTIFICATIONS",
            description:
                "Get constant updates on school assessments set up at the end of each module, and also some sort of final exam or project that will measure the child’s overall progress at the end of the year."
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