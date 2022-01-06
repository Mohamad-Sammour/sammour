import 'dart:html';

import 'package:flutter/material.dart';
import 'package:untitled/Screens/Widget/customBtn.dart';
import 'package:untitled/Screens/constants.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              //For Heading
              Container(
                padding: EdgeInsets.only(
                  top: 24.0,
                ),
              child: Text(
                  "Welcome User,\nLogin To Your Account ",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,

                ),
              ),
              Text("input Fields"),
              CustomBtn(
                text: "Create New Account",
                onPressed: (){
                  print("Click On Create Account Button");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
