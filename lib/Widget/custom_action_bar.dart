import 'package:flutter/material.dart';
import 'package:untitled/Screens/constants.dart';

class CustomActionBar extends StatelessWidget {
final String? title;
final bool? HasBackArrow;
final bool? hasTitle;
CustomActionBar({this.title, this.HasBackArrow, this.hasTitle});

  @override
  Widget build(BuildContext context) {
    bool _HasBackarrow= HasBackArrow ?? false;
   bool _hasTitle = hasTitle ?? true;
    return Container(
      padding: EdgeInsets.only(
        top: 56.0,
        left: 24.0,
        right: 24.0,
        bottom: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(_HasBackarrow)
            Container(
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(
              color:Colors.black,
              borderRadius: BorderRadius.circular(8.0)
                 ),
              alignment: Alignment.center,

              child: Image(
                image: AssetImage(
                  "assest/images/back-arrow.png"
                ),
                color: Colors.white,
                width: 16.0,
                height: 16.0,
              ),
            ),

          if(_hasTitle)
          Text(
            title ?? "Action bar",
            style: Constants.boldHeading,
          ),
          Container(
            width: 42.0,
            height: 42.0,
            decoration: BoxDecoration(
              color:Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
            alignment: Alignment.center,
            child: Text(
              "0",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
