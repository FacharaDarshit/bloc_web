import 'package:flutter_bloc/flutter_bloc.dart';
abstract class AppState{
  void add(AppFetchData appFetchData) {}
}
class AppInitial extends AppState{}
class AppLoading extends AppState{}
class AppSuccess extends AppState{}
class AppError extends AppState{}

abstract class AppEvent{}
class AppFetchData extends AppEvent{}
class NavigationBloc extends Bloc<AppEvent, AppState> {
  NavigationBloc() : super(AppInitial()); // Initialize with the default state (AppInitial)

  Stream<AppState> mapEventToState(AppEvent event) async*{
    if(event is AppFetchData){
      yield* navigat();
    }
  }
  Stream<AppState> navigat()async*{
    yield AppLoading();
  }

}