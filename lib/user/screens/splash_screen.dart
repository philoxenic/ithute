import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../home/screens/home_screen.dart';
import '../../style/style.dart';
import 'onboarding_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen.withScreenFunction(
        backgroundColor: colorAccent,
        splash: 'assets/images/logo.png',
        screenFunction: () async{
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return OnboardingScreen();
              }
            },
          );
        },
        splashTransition: SplashTransition.scaleTransition,
        //pageTransitionType: PageTransitionType.scale,
      ),
      bottomSheet: bottomSheetWidget(),
    );
  }

  Widget bottomSheetWidget() {
    return Container(
      width: double.infinity,
      color: colorPrimary,
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Designed by Philoxenic',
              textAlign: TextAlign.center,
              style: TextStyle(color: colorAccent)
          )
      ),
    );
  }


}

