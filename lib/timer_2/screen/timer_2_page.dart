import 'package:block_demo/timer_2/bloc/timer_bloc.dart';
import 'package:block_demo/timer_2/screen/timer_2_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Timer2Page extends StatelessWidget {
  const Timer2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context) => TimerBloc(),
      child:Timer2View(
        key: UniqueKey(),
      ) ,
    );
  }
}
