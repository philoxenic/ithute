import 'package:flutter/material.dart';
import 'package:ithute/user/forms/login_form.dart';

import '../../style/style.dart';
import '../../widgets/toast_widget.dart';


class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  // Button Colours
  var colors = [
    colorAccent,
    Colors.orange,
    colorSuccess
  ];

  // Multiple Role Buttons
  var button = [
    "Learner",
    "Parent",
    "Teacher"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: colorAccent,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: EdgeInsets.all(48),

          child: Card(
            shape: RoundedRectangleBorder( //<-- SEE HERE
              borderRadius: border_radius
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Wrap(
                children: <Widget>[
                  Column(
                    children: [
                      Image.asset('assets/images/logo_black.png'),
                      SizedBox(height: 4),
                      ElevatedButton(
                          onPressed: () async {
                            showLoginForm(context, button[0], colors[0]);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(btn_height), // NEW
                            shape: RoundedRectangleBorder(
                              borderRadius: border_radius,
                            ),
                          ),
                          child: Text('${button[0]} Login', style: TextStyle(color: Colors.white),)
                      ),

                      SizedBox(height: 4),
                      ElevatedButton(
                          onPressed: () async {
                            showLoginForm(context, button[1], colors[1]);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(btn_height), // NEW
                            shape: RoundedRectangleBorder(
                              borderRadius: border_radius,
                            ),
                            backgroundColor: colors[1]
                          ),
                          child: Text('${button[1]} Login', style: TextStyle(color: Colors.white),)
                      ),
                      SizedBox(height: 4),
                      ElevatedButton(

                          onPressed: () async {
                            showLoginForm(context, button[2], colors[2]);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(btn_height), // NEW
                            shape: RoundedRectangleBorder(
                              borderRadius: border_radius,
                            ),
                            backgroundColor: colors[2]
                          ),
                          child: Text('${button[2]} Login', style: TextStyle(color: Colors.white),)
                      ),




                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}