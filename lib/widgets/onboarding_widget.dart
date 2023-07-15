import 'package:flutter/material.dart';

import '../style/style.dart';
import '../user/screens/landing_screen.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage(
      {Key? key,
        required this.image,
        required this.title,
        required this.description,
        required this.noOfScreen,
        required this.onNextPressed,
        required this.currentScreenNo})
      : super(key: key);

  final Image image;

  final String title;

  final String description;

  final int noOfScreen;

  final Function(int) onNextPressed;

  final int currentScreenNo;

  @override
  Widget build(BuildContext context) {

    gotoLandingScreen() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder:(context) => LandingScreen())
      );
    }

    bool isLastScreen = currentScreenNo >= noOfScreen - 1;
    return !isLastScreen?Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  !isLastScreen?image:Container(),
                  const SizedBox(
                    height: 64,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 48, right: 16),
                    child: Text(
                      title, textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 24,
                          color: colorSecondary,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 64, right: 16),
                    child: Text(
                      description, textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                            gotoLandingScreen();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(color: colorAccent, width: 1),
                            //minimumSize: const Size.fromHeight(50), // NEW
                            shape: RoundedRectangleBorder(
                              borderRadius: border_radius,
                            ),
                          ),
                          child: Text('SKIP', style: TextStyle(color: colorAccent),)
                      )
                  ),
                  Row(
                    children: [
                      for (int index = 0; index < noOfScreen; index++)
                        createProgressDots(
                            (index == currentScreenNo) ? true : false)
                    ],
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                            onNextPressed(currentScreenNo + 1);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: colorAccent,
                            //minimumSize: const Size.fromHeight(50), // NEW
                            shape: RoundedRectangleBorder(
                              borderRadius: border_radius,
                            ),
                          ),
                          child: Text('NEXT', style: TextStyle(color: colorPrimary),)
                      )
                  ),
                ],
              ),
            )
          ],
        )):LandingScreen();

  }

  //Create a function to create progress dots
  Widget createProgressDots(bool isActiveScreen) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActiveScreen ? 15 : 10,
      width: isActiveScreen ? 15 : 10,
      decoration: BoxDecoration(
          color: isActiveScreen ? colorAccent : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  //Lets create function to open home screen, same function we will call from skip button too.
  void openHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

}