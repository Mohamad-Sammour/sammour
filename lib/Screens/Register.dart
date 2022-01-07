

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
  late int PhoneNumber;
  String Sex="";
  late int Date;

  //Focus Node For Input Field
  late FocusNode _passwordFoucsNode;
  @override
  void initState() {
    _passwordFoucsNode= FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFoucsNode.dispose();
    super.dispose();
  }

  //Email Focus Node
   late FocusNode _emailFocusNode;
  @override
  noSuchMethod(Invocation invocation) {
    _emailFocusNode=FocusNode();
    return super.noSuchMethod(invocation);
  }
  @override
  void deactivate() {
    _emailFocusNode.dispose();
    super.deactivate();
  }




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
                    onChanged: (Value){
                      FullName;
                    },
                    onSubmitted: (Value){
                      _emailFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,


                  ),

                  CustomInput(
                    hintText: "Email..",
                    onChanged: (Value){
                      email;
                    },
                    focusnode: _emailFocusNode ,
                    onSubmitted: (Value){
                      _passwordFoucsNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),

                  CustomInput(
                    hintText: "Password..",
                    onChanged: (Value){
                      password;
                    },
                    focusnode: _passwordFoucsNode,
                      isPassword: true,
                    textInputAction: TextInputAction.next
                  ),

                  CustomInput(
                    hintText: "Phone Number..",
                    onChanged: (Value) {
                      PhoneNumber;
                    },
                    textInputAction: TextInputAction.next,
                  ),

                  CustomInput(
                    hintText: "Sex..",
                    onChanged: (Value){
                      Sex;

                    }

                  ),

                  CustomInput(
                    hintText: "Birth-Date..",
                    onChanged: (Value){
                      Date;
                    },
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
