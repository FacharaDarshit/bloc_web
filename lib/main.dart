import 'package:flutter/material.dart';
import 'data_base/bloc/sql_data_base_bloc.dart';
import 'feature/bloc/splash_block.dart';
import 'home_screen.dart';

void main() {

  var r=SplashBlock.instance;
  r.stream.listen((event) {

  },);
  var t=SqlDataBaseBloc(tt: 5);
  t.stream.listen((event) {
    print(">>>>>>>>>>>$event");
  },);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BLOC",
      home: HomeScreen(),
    );
  }
}
