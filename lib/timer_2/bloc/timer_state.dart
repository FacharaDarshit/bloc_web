part of 'timer_bloc.dart';

 sealed class TimerState {
  int duration;
  TimerState(this.duration);
}
//show 1 button foe start timer and start timer change state to resumed or running
final class TimerInitial extends TimerState {
  TimerInitial(super.duration);
}
final class RunningState extends TimerState {
  RunningState(super.duration);
}
final class TimerStatePaused extends TimerState {
    TimerStatePaused(super.duration);
}
final class TimerStateResumed extends TimerState {
   TimerStateResumed(super.duration);
}

