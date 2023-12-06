// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:note_app__/misc/colors.dart';
import 'package:note_app__/views/navpages/BarItemPage.dart';
import 'package:note_app__/views/navpages/HomePage.dart';
import 'package:note_app__/views/navpages/Mypage.dart';
import 'package:note_app__/views/navpages/searshPage.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  ////////
  int Currindx = 0;
  List pages = [HomePage(), BarItempage(), searshPage(), Mypage()];
  void Function(int)? ontap(indx) {
    setState(() {
      Currindx = indx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: AppColors.mainColor,
            unselectedItemColor: AppColors.mainColor.withOpacity(.3),
            currentIndex: Currindx,
            onTap: (e) => ontap(e),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'hiking'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_sharp), label: 'kayaking'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'mountain'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'snorkling'),
            ]),
        body: pages[Currindx]);
  }
}
