import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app__/cubits/app_cupit.dart';
import 'package:note_app__/cubits/cupit_states.dart';
import 'package:note_app__/views/detailPage.dart';
import 'package:note_app__/views/navpages/main_page.dart';
import 'package:note_app__/widgets/Dots.dart';
import 'package:note_app__/widgets/Mybutton.dart';
import 'package:note_app__/widgets/mytext.dart';


class welcompage extends StatefulWidget {
  welcompage({super.key});

  @override
  State<welcompage> createState() => _welcomState();
}

class _welcomState extends State<welcompage> {
  String img = 'img/';

  List Images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
          itemCount: 3,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(img + Images[index]))),
              child: Container(
                padding: EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mylargetext("Trips"),
                        mytext(
                          "Mountain",
                          size: 30,
                        ),
                        Container(
                          width: 250,
                          child: mytext(
                              'Mountain hikes give you an incredible sesne of freedom along with endurance test '),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Mybutton(
                          onPressed: () {
                            BlocProvider.of<app_cupit>(context).mainpage();
                          },
                          img: img + 'button-one.png',
                        ),
                      ],
                    ),
                    Dots(Pageindex: index),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
