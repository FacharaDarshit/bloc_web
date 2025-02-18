import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/timer_bloc.dart';

class Timer2View extends StatelessWidget {
  const Timer2View({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.microtask(() => context.read<TimerBloc>().add(TimerStarted2(duration: 60)));
    return Scaffold(
        body: BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            Text(
              state.duration.toString(),
              style: TextStyle(fontSize: 30),
            ),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is TimerInitial) ...[
                  FloatingActionButton(
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
                    onPressed: () {},
                    child: Icon(Icons.pause),
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
      ),
    ));
  }
}
