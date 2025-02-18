import 'package:bloc/bloc.dart';
import 'package:block_demo/feature/bloc/splash_block.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'api_call_event.dart';
part 'api_call_state.dart';

class ApiCallBloc extends Bloc<ApiCallEvent, DataState> {
  ApiCallBloc() : super(DataState()) {
    // add(ApiCallInProgress());
    on<ApiCallInProgress>(makeApiCall);
    on<ApiCallSuccess>((event, emit) {
      emit(state.copyWith(isLoading: false,data: ["THE API CALLED BUT THE ERROR FACED"],));
      print("object");
    },);
    on<ApiCallFailure>(makeApiCall);
  }

  Future<void> makeApiCall(event, Emitter<DataState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      await http.post(Uri.parse("https://reqres.in/api/register"),headers: {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka"
      },
        body: {
          "email": "eve.holtreqres.in",
          "password": "cityslicka"
        }
      ).then((value) {
        if(value.statusCode==200){
          print(value.body);
          emit(DataState().copyWith(isLoading: false,data: [value.body]));
        }else if(value.statusCode==400){
          add(ApiCallSuccess(data: "data"));

        }

      },);

    } catch (e) {
      emit(state.copyWith(isLoading: true, error: e.toString())); // Handle error
    }
  }


}
