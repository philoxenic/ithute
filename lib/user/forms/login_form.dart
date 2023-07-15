import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

import '../../style/style.dart';
import '../../widgets/toast_widget.dart';

void showLoginForm(context, role, color) {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String email;
  late String password;

  showDialog(
      context: context,
      builder: (context){

        return ScaffoldMessenger(
            child: Builder(builder: (context) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: AlertDialog(
                  shape: RoundedRectangleBorder( //<-- SEE HERE
                      side: BorderSide(
                        color: color,
                      ),
                    borderRadius: border_radius
                  ),
                  content: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 180,
                                  child: Text('${role} LOGIN'.toUpperCase(),textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24)
                                    ,
                                  ),
                                ),
                                IconButton(onPressed: (){
                                  //Close Dialog
                                  Navigator.pop(context);
                                }, icon: Icon(Icons.close,color: colorSecondary,))
                              ],
                            ),
                            SizedBox(height: 16),

                            TextField(
                              controller: emailController,
                              onChanged: (value) {
                                email = value.trim();
                              },
                              cursorColor: Colors.black,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: border_radius
                                  ),
                                  labelText: 'Email Address',
                                  isDense: true,
                                  // Added this
                                  contentPadding: EdgeInsets.all(8)),
                            ),

                            SizedBox(height: 8),
                            TextField(
                              controller: passwordController,
                              onChanged: (value) {
                                password = value.trim();
                              },
                              cursorColor: Colors.black,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: border_radius
                                  ),
                                  labelText: 'Password',
                                  isDense: true,
                                  // Added this
                                  contentPadding: EdgeInsets.all(8)),
                              obscureText: true,
                            ),
                            SizedBox(height: 8),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: colorAccent
                                ),
                              ),
                            ),
                            SizedBox(height: 8),


                            ElevatedButton(
                                onPressed: () async {
                                  if (emailController.text.isEmpty){
                                    showToastWidget("Please enter email address.", colorError);
                                  } else if (passwordController.text.isEmpty){
                                    showToastWidget( "Please enter password.", colorError);
                                  } else {

                                    try{
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) => const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                    );



                                    } catch(e){
                                      Navigator.pop(context);
                                    }


                                  }

                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(btn_height), // NEW
                                  shape: RoundedRectangleBorder(
                                    borderRadius: border_radius
                                  ),
                                  backgroundColor: color
                                ),
                                child: Text('Login', style: TextStyle(color: Colors.white),)
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },)
        );
      }
  );

}
