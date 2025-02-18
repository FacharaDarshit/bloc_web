// themealdb.com/api/json/v1/1/categories.php


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../model/splash_model.dart';

// Define the states
abstract class ApiState {}

class ApiInitial extends ApiState {}
class ApiLoading extends ApiState {}
class ApiSuccess extends ApiState {
  final String data;
 final BestSelling bestSelling;
  ApiSuccess(this.data,this.bestSelling);
}
class ApiError extends ApiState {
  final String error;
  ApiError(this.error);
}

class SplashBlock extends Cubit<ApiState>{
  static final SplashBlock instance=SplashBlock._internal();
  SplashBlock._internal():super(ApiInitial());


  Future<void> fetchData() async {
    print("object");
    try {
      emit(ApiLoading());
      BestSelling bestSelling;
      var response = await http.get(Uri.parse("https://themealdb.com/api/json/v1/1/categories.php"));
      bestSelling=bestSellingFromJson(response.body);
      final data = "Fetched data from API!";
      emit(ApiSuccess(data,bestSelling));  // Emit success state with data
    } catch (e) {
      emit(ApiError("Failed to fetch data"));  // Emit error state
    }
  }


}