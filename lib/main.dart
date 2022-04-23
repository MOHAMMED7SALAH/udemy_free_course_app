import 'package:flutter/material.dart';
import 'package:udemyfreecourse/views/get_started.dart';

main (){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: "udemy free corse app",
      home: GetStartedPage(),
    );
  }
}



