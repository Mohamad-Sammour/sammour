import 'dart:ui';

import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
final int? selectedTab;
final Function (int)? tabPressed;
BottomTabs ({this.selectedTab, this.tabPressed});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTabs=0;


  @override
  Widget build(BuildContext context) {
    _selectedTabs = widget.selectedTab ?? 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1.0,
            blurRadius: 30.0,
          )
        ]
      ),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BottomtabsBtn(
          imagePath:"assest/images/home.png" ,
          selected : _selectedTabs == 0 ? true : false,
          onPressed:() {
              widget.tabPressed!(0);
          },

        ),
        BottomtabsBtn(
            imagePath:"assest/images/search.png",
          selected : _selectedTabs == 1 ? true : false,

          onPressed:() {
            widget.tabPressed!(1);


          },
        ),
        BottomtabsBtn(
            imagePath:"assest/images/saved.png",
          selected : _selectedTabs == 2 ? true : false,
          onPressed:() {
            widget.tabPressed!(2);

          },

        ),
        BottomtabsBtn(
            imagePath:"assest/images/logout.png",
          selected : _selectedTabs == 3 ? true : false,
          onPressed:() {
            setState(){
              _selectedTabs=3;
            }
            },
        ),
      ],
    ),
  );
  }
}


class BottomtabsBtn extends StatelessWidget {

 final String? imagePath;
 final bool? selected;
 final Function? onPressed;
 BottomtabsBtn({this.imagePath,this.selected,this.onPressed});

  @override
  Widget build(BuildContext context) {

    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,

      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 28,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color:_selected ? Theme.of(context).accentColor:Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child:Image(
          image: AssetImage(
              imagePath ??   "assest/images/home.png"
          ),
          width: 22,
          height: 22,
          color: _selected ? Theme.of(context).accentColor:Colors.black ,
        ) ,
      ),
    );
  }
}

