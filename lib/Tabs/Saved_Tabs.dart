import 'package:flutter/material.dart';
import 'package:untitled/Widget/custom_action_bar.dart';

class SavedTab extends StatelessWidget {
  const SavedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("Saved Tab"),
          ),
          CustomActionBar(
            title: "Saved",
            HasBackArrow:false,
          ),

        ],
      ),
    );
  }
}
