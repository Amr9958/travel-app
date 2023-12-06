import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app__/cubits/app_cupit.dart';
import 'package:note_app__/views/cubitRouting.dart';
import 'package:note_app__/views/detailPage.dart';
import 'package:note_app__/views/navpages/HomePage.dart';
import 'package:note_app__/views/navpages/main_page.dart';
import 'package:note_app__/views/welcomPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<app_cupit>(
      create: (context) {
        return app_cupit();
      },
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  elevation: 0,
                  backgroundColor: Colors.white)),
          home: cubitRouting()),
    );
  }
}
