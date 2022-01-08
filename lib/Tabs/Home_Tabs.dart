import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:untitled/Widget/custom_action_bar.dart';


class HomeTab extends StatelessWidget {
final CollectionReference _productsRef = FirebaseFirestore.instance.Collection("Products");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
         FutureBuilder<QuerySnapshot>(
           future: _productsRef.get(),
            builder:(context,snapshot){
              if(snapshot.hasError){
                return Scaffold(
                  body: Center(
                    child: Text("Error :${snapshot.error}"
                    ),
                  ),
                );
              }
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                  ),
                );
            },
         ),
          CustomActionBar(
            title: "Home",
            HasBackArrow:false,
          ),

        ],
      ),
    );
  }
}
