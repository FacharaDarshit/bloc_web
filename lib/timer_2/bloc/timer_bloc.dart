import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial(0)) {
    on<StartTheTimer>(_timerEvent);
    on<ResetTimer>(_resetTimer);
  }
  Stream<int> counterStream = Stream.periodic(Duration(seconds: 1), (count) => count);
  StreamSubscription<int>? streamSubscription;

   void _timerEvent(StartTheTimer event, Emitter<TimerState> emit) async{
    //i have to start the timer
     print("object");
     await callingTheStream();

     // yield "Stream.value(null)";

  }
  callingTheStream()async*{
    print("object");
    streamSubscription =  counterStream.listen((event) {
      print(event);
      // emit(RunningState(event));
    },);
  }
  Future<void> _resetTimer(ResetTimer event, Emitter<TimerState> emit) async{
    emit(TimerInitial(0));

    // i have to pause the timer
  }
}
