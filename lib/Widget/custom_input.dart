import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final Function? onChange;
  final Function? submit;
  CustomInput({this.hintText, this.onChange, this.submit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? "hint text..",
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0,
          )
        ),

      ),
    );
  }
}
