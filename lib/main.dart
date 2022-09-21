import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:notes/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '笔记',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                systemOverlayStyle: SystemUiOverlayStyle.light
                    .copyWith(statusBarColor: Colors.transparent),
              )),
      home: const HomePage(),
    );
  }
}
