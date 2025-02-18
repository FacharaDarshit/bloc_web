part of 'api_call_bloc.dart';

// @immutable
// sealed class ApiCallState {}
//
// final class ApiCallInitial extends ApiCallState {}
// state.dart
class DataState  {
  final bool isLoading;
  final List<String> data;
  final String error;

  const DataState({
    this.isLoading = true,
    this.data = const [],
    this.error = '',
  });

  DataState copyWith({
    bool? isLoading,
    List<String>? data,
    String? error,
  }) {
    return DataState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }


}
