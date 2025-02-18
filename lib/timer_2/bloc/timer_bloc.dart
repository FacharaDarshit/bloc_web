import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_demo/timer/ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial(0)) {
    on<StartTheTimer>(_timerEvent);
    on<ResetTimer>(_resetTimer);
    on<TimerStarted>(_timerStarted);
    on<PauseTheTimer>(_timerPaused);
    on<ResumeTheTimer>(_resumeTheTime);

  }
 Stream<int> counterStream = Stream.periodic(Duration(seconds: 1), (count) {
   print("object$count From the main");
   return count;
 }).asBroadcastStream();
  StreamSubscription<int>? streamSubscription;
  StreamSubscription<int>? streamSubscription_2;
  Ticker ticker=Ticker();

  void _timerEvent(StartTheTimer event, Emitter<TimerState> emit) {
    streamSubscription?.cancel();
    streamSubscription_2?.cancel();
     emit(RunningState(state.duration));
    streamSubscription=ticker.tick_2(ticks: state.duration).listen((event) {
      add(TimerStarted(event));
    },);
     streamSubscription_2=counterStream.listen((event) {
      },);
  }
  Future<void> _resetTimer(ResetTimer event, Emitter<TimerState> emit) async{
    streamSubscription!.cancel();
    streamSubscription_2!.cancel();
    emit(TimerInitial(0));
    // i have to pause the timer
  }
  Future<void> _timerStarted(TimerStarted event, Emitter<TimerState> emit) async{
    emit(RunningState(event.duration));
  }
  Future<void> _timerPaused(PauseTheTimer event, Emitter<TimerState> emit) async{
    emit(TimerStatePaused(event.duration));
    streamSubscription_2!.pause();
    streamSubscription!.pause();
  }
  Future<void> _resumeTheTime(ResumeTheTimer event, Emitter<TimerState> emit) async{
    emit(RunningState(event.duration));
    streamSubscription!.resume();
    streamSubscription_2!.resume();
}

}
