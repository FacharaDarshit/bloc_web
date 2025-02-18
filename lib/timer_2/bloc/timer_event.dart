part of 'timer_bloc.dart';

 sealed class TimerEvent {
  int duration;
  TimerEvent(this.duration);
}
class StartTheTimer extends TimerEvent {
   StartTheTimer(super.duration);
}
class ResetTimer extends TimerEvent {
   ResetTimer(super.duration);
}