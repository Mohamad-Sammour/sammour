import 'package:flutter/material.dart';


class CustomInput extends StatelessWidget {
  final String? hintText;
  final Function? onChanged;
  final Function? onSubmitted;
  final FocusNode? focusnode;
  final TextInputAction? textInputAction;
  final bool? isPassword;
  CustomInput({this.hintText, this.onChanged, this.onSubmitted, this.focusnode, this.textInputAction, this.isPassword});

  @override

  Widget build(BuildContext context) {
    bool _isPassword=isPassword ?? false;


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
        obscureText: _isPassword,
        focusNode: focusnode,
        onChanged:(vv){

        },
        onSubmitted:(nn){

        },
        textInputAction: textInputAction,

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
