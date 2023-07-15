import 'dart:io';
import 'package:flutter/material.dart';

import '../../database/remote_database.dart';
import '../../style/style.dart';
import '../../user/screens/landing_screen.dart';
import '../../widgets/toast_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState  extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero,() async {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          //CheckUserConnection();
        }
      } on SocketException catch (_){
        print("Disconnected");
      }// pop dialog with use of Dialog context
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: colorAccent,
          foregroundColor: colorPrimary,
          title: Image.asset(
            'assets/images/logo.png',
            scale: 2,
            width: 100,
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  child:Icon(Icons.menu),
                  onTap: () {
                    //showCustomBottomSheet(context);

                  },
                )
            )
          ]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



        ],
      ),
    );
  }

  // Get Learner Details
  fetchLearner() async {
    if (user != null) {
      try {
        var doc = await fireStore.collection('learners').doc(user!.uid).get();
        if (doc.exists){

          String uid = doc.data()!['id'];
          //first_name = doc.data()!['name'];
          //last_name = doc.data()!['last_name'];

          //setCurrentUser(user.uid, user.displayName,user.email,user.phoneNumber, user.displayName);

          return doc.exists;
        } else {
          return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LandingScreen()));
        }

      } catch (e) {
        showToastWidget(e.toString(), colorError);
      }
    }
  }

}







