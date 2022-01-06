

import 'package:flutter/material.dart';
import 'package:untitled/Screens/Widget/custom_btn.dart';
import 'package:untitled/Screens/constants.dart';
import 'package:untitled/Widget/custom_btn.dart';
import 'package:untitled/Widget/custom_input.dart';

class Register extends StatefulWidget {


  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

// (---- Build alert Dialog to display some error ----)

  Future<void> _alertDialogBuilder() async{

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text("Just For random text"),
            ),
            actions: [
              FlatButton(
                child: Text("Close Dialog"),
                onPressed: (){
                  Navigator.pop(context);
                },


              )
            ],
          );

        }
    );
  }

// Default from loading state
  bool _RegisterFormLoading = false;

// form input fields values
  String FullName="";
  String email="";
  var password= " ";
  String Sex="";
  late int Date;



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
                  " Create A New Account",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,

                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "FullName..",
                  ),

                  CustomInput(
                    hintText: "Email..",
                  ),
                  CustomInput(
                    hintText: "Password..",
                  ),
                  CustomInput(
                    hintText: "Phone Number..",
                  ),
                  CustomInput(
                    hintText: "Sex..",
                  ),
                  CustomInput(
                    hintText: "Birth-Date..",
                  ),

                  CustomBtn(
                    text: "Create New Account ",
                    onPressed:() {
                      setState(() {
                        _RegisterFormLoading=true;
                      });
                      },
                    isloading: _RegisterFormLoading,
                  ),

                ],
              ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 17,
                ),
                child: CustomBtn(
                  text: "Back To Login",
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
