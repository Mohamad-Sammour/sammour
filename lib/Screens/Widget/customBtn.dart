import 'package:flutter/material.dart';


class CustomBtn extends StatelessWidget {
  String text;
  Function onPressed;
  bool outlineBtn;
  int number;

CustomBtn({this.text,this.onPressed,this.outlineBtn,this.number});

  @override
  Widget build(BuildContext context) {

    bool _outlineBtn=outlineBtn ?? false;

    return GestureDetector(
      onTap: onPressed(),
      child: Container(
        height: 60.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius:BorderRadius.circular(
            12.0
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
        child: Text(
          text ?? "Text",
              style: TextStyle(
            fontSize: 16,
          color: _outlineBtn ? Colors.black : Colors.white,
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
    );
  }
}
