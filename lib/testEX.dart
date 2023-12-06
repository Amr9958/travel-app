import 'package:flutter/material.dart';
import 'package:note_app__/misc/colors.dart';
import 'package:note_app__/views/detailPage.dart';
import 'package:note_app__/views/navpages/main_page.dart';
import 'package:note_app__/views/welcomPage.dart';

class EXample extends StatefulWidget {
  const EXample({Key? key}) : super(key: key);

  @override
  State<EXample> createState() => _MyAppState();
}

class _MyAppState extends State<EXample> {
  int defaultindex = 1;
  int currentindex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          ...List.generate(
              5,
              (ind) => InkWell(
                    onTap: () {
                      setState(() {
                        currentindex = ind;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: buttons(
                        Textcolor:
                            currentindex == ind ? Colors.white : Colors.black,
                        backgroundcolor: currentindex == ind
                            ? Colors.black
                            : AppColors.buttonBackground,
                        text: '${(ind + 1)}',
                      ),
                    ),
                  ))
        ],
      )),
    );
  }
}
