import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app__/cubits/app_cupit.dart';
import 'package:note_app__/cubits/cupit_states.dart';
import 'package:note_app__/views/detailPage.dart';
import 'package:note_app__/views/navpages/main_page.dart';
import 'package:note_app__/views/welcomPage.dart';
import 'package:note_app__/widgets/Dots.dart';
import 'package:note_app__/widgets/Mybutton.dart';
import 'package:note_app__/widgets/mytext.dart';

class cubitRouting extends StatefulWidget {
  cubitRouting({super.key});

  @override
  State<cubitRouting> createState() => _welcomPageState();
}

class _welcomPageState extends State<cubitRouting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<app_cupit, cupit_states>(
      builder: (context, state) {
        if (state is welcomeState) {
          return welcompage();
        } else if (state is mainpageState) {
          return mainpage();
        } else if (state is detailedpageState) {
          return detailPage();
        } else
          return Scaffold(
            body: Center(child: Text('un known state')),
          );
      },
    ));
  }
}

