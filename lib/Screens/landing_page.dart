import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/Home.dart';
import 'package:untitled/Screens/LogIn.dart';
import 'package:untitled/Screens/constants.dart';


class LandingPage extends StatelessWidget {


  final Future<FirebaseApp> _intialization = Firebase.initializeApp();

  @override

  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _intialization,
      builder: (context, snapshot){
        //if_SnapShot_Has_Error
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text("Error :${snapshot.error}"

              ),
            ),


          );
        }

        //Connection Initialized .... FireBase App Is Running
        if(snapshot.connectionState== ConnectionState.done){

          //streamBuilder can check on login state life
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamsnapshot){
                if(snapshot.hasError){
                  return Scaffold(
                    body: Center(
                      child: Text("Error :${streamsnapshot.error}"

                      ),
                    ),
                  );
                }

                // Connection State active - Do the user login check inside the
                //if statement
                if(streamsnapshot.connectionState ==ConnectionState.active){

                  // Get The user
                   User? _user= streamsnapshot.data as User?;
                  // if the user is null, we're not logged in
                  if(_user == null)
                  {
                    // user not logged in , head to login Page
                    return LogInPage();
                  }
                  else
                    {
                      // the user is logged in , head to homepage
                     return HomePage();
                    }

                }


                //checking auth state - loading
                return Scaffold(
                  body: Center(
                    child: Text("checking authentication....",
                        style: Constants.regularHeading
                    ),
                  ),
                );

              }
          );
        }

        //Connecting To FireBase .... Loading
        return Scaffold(
          body: Center(
            child: Text("Initialization App....",
            style: Constants.regularHeading
            ),
          ),
        );

      },
    );
  }
}

