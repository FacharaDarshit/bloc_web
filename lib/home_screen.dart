import 'package:block_demo/counter/view/counter_page.dart';
import 'package:block_demo/timer/view/timer_page.dart';
import 'package:block_demo/timer_2/screen/timer_2_page.dart';
import 'package:flutter/material.dart';

import 'counter/app.dart';
import 'data_base/view/data_base_view.dart';
import 'make_apicall/screen/data_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(

              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CounterPage(),
                    ));
              },
              child: Text(
                "data",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(

              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TimerPage(),
                    ));
              },
              child: Text(
                "Timer",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(

              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPage(),
                    ));
              },
              child: Text(
                "Api Call",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(

              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataBaseView(),
                    ));
              },
              child: Text(
                "DataBase",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(

              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Timer2Page(),
                    ));
              },
              child: Text(
                "Timer 2",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
