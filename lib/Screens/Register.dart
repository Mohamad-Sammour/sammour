

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future<void> _alertDialogBuilder(String error) async{

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
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

  //Create a new user account

  Future<String?> _CreateAccount() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password);
      return null;
    }
    on FirebaseAuthException catch(e){
      if(e.code =='weak password'){
        return 'The password provided is too weak';
      }
      else if(e.code == 'email already in use'){
        return 'The Account already Exist for that email';
      }return e.message;
    }catch(e){
      return e.toString();
    }

  }

  void _submitForm() async{
//set the form loading state
    setState(() {
      _registerFormLoading=true;
    });

//run the create account method
   String? _createAccountfeedBack= await _CreateAccount();

   //if string not null we got error whlie create account
   if(_createAccountfeedBack !=null) {
     _alertDialogBuilder(_createAccountfeedBack);

     //set the form to regular state [not loading]
     setState(() {
       _registerFormLoading=false;
     });
   }else{
     Navigator.pop(context);
   }
  }

// Default from loading state
  bool _registerFormLoading = false;

 //form input fields values
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


                  ),

                  CustomInput(
                    hintText: "Email..",

                    onChanged: (Value){
                      email;
                    },
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
                    onSubmitted: (Value){
                      _submitForm();
                    },
                    textInputAction: TextInputAction.next,

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
                      _alertDialogBuilder("error");
                      },

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
