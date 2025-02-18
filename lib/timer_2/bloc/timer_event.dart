part of 'timer_bloc.dart';

 sealed class TimerEvent {
  int duration;
  TimerEvent(this.duration);
}
class StartTheTimer extends TimerEvent {
   StartTheTimer(super.duration);
}
class TimerStarted extends TimerEvent {
   TimerStarted(super.duration);
}
class ResetTimer extends TimerEvent {
   ResetTimer(super.duration);
}
class PauseTheTimer extends TimerEvent{
   PauseTheTimer(super.duration);
}
class ResumeTheTimer extends TimerEvent{
  ResumeTheTimer(super.duration);
}