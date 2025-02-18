part of 'api_call_bloc.dart';

@immutable
sealed class ApiCallEvent {}

final class ApiCallSuccess extends ApiCallEvent {
  final String data;
  ApiCallSuccess({required this.data});
}
final class ApiCallFailure extends ApiCallEvent {
  final String data;
  ApiCallFailure({required this.data});
}
final class ApiCallInProgress extends ApiCallEvent {}
