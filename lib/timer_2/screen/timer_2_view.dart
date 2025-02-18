import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/timer_bloc.dart';

class Timer2View extends StatelessWidget {
     Timer2View({super.key});
  Stream<int> counterStream = Stream.periodic(Duration(seconds: 1), (count) => count);

  @override
  Widget build(BuildContext context) {
    // Future.microtask(() => context.read<TimerBloc>().add(TimerStarted2(duration: 60)));
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        int a=100;
        int b=60;
        print(a%b);
      },),

      // floatingActionButton: FloatingActionButton(
      //    heroTag: "oo",
      //   onPressed: () {
      //
      //   // counterStream.listen((event) {
      //   //   print(event);
      //   // },);
      //   // // counterStream.pause();
      //     StreamSubscription? streamSubscription;
      //     streamSubscription=counterStream.listen((event) async {
      //      if(event==2){
      //        // i want to stop the stream
      //        streamSubscription!.pause();  // Stop the stream
      //        print("Stream Paused ij");
      //        await Future.delayed(Duration(seconds: 2),(){
      //          streamSubscription!.resume();
      //          print("Stream Resumed");
      //        });
      //
      //      } print(event);
      //   });
      //   //
      //   // streamSubscription.cancel();
      //
      // },),
        body: BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        final duration = context.select((TimerBloc bloc) => bloc.state.duration);
        final sec = (duration % 60).floor().toString().padLeft(2, '0');
        final min=( (duration/60)% 60).floor().toString().padLeft(2, '0');
        final hours=( (duration/3600)% 60).floor().toString().padLeft(2, '0');
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 25,
            children: [
              Text(
                "$hours:$min:$sec",
                style: TextStyle(fontSize: 30),
              ),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is TimerInitial) ...[
                    FloatingActionButton(
                      heroTag: "ok",
                      onPressed: () {
                        context
                            .read<TimerBloc>()
                            .add(StartTheTimer(state.duration));
                        //start Timer
                      },
                      child: Icon(Icons.stop_circle_rounded),
                    )
                  ] else if (state is RunningState) ...[
                    //timer is Running and have to show the stop button and the reste button
                    FloatingActionButton(
                      onPressed: () {
                        context.read<TimerBloc>().add(PauseTheTimer(state.duration));
                      },
                      child: Icon(Icons.pause),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<TimerBloc>().add(ResetTimer(state.duration));
                      },
                      child: Icon(Icons.restart_alt_sharp),
                    )
                  ]else if(state is TimerStatePaused)...[
                    FloatingActionButton(
                      onPressed: () {
                        //resume The Timer
                        context.read<TimerBloc>().add(ResumeTheTimer(state.duration));
                      },
                      child: Icon(Icons.play_arrow),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<TimerBloc>().add(ResetTimer(state.duration));
                      },
                      child: Icon(Icons.restart_alt_sharp),
                    )
                  ]
                ],
              )
            ],
          ),
        );
      }
    ));
  }
}
