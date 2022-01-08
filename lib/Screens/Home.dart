import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/constants.dart';
import 'package:untitled/Tabs/Home_Tabs.dart';
import 'package:untitled/Tabs/Saved_Tabs.dart';
import 'package:untitled/Tabs/Search_Tabs.dart';
import 'package:untitled/Widget/bottom_taps.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _tabsPageController;
  int _selectedTab=0;
  @override
  void initState() {
    _tabsPageController=PageController();
    super.initState();
  }
  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: PageView(
                controller: _tabsPageController,
                onPageChanged: (num){
                 setState(() {
                   _selectedTab=num;
                 });
                },
                children: [
                   HomeTab(),
                  SearchTab(),
                 SavedTab(),
                ],
              ),
            ),
           BottomTabs(
             selectedTab: _selectedTab,
             tabPressed: (num){
                 _tabsPageController.animateToPage(num, duration: Duration(milliseconds: 300),
                     curve: Curves.easeOutCubic);
             },
           ),

        ],
      ),
    );
  }
}
