import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/api_call_bloc.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => context.read<ApiCallBloc>().add(ApiCallInProgress()));
    return Scaffold(
      body: BlocBuilder<ApiCallBloc, DataState>(
       builder: (context, state) {
         // context.read<ApiCallBloc>().add(ApiCallInProgress());
         if(state.isLoading){
           return Center(
             child: CircularProgressIndicator(),
           );
         }else{
           return Center(
             child: Text(state.data[0]),
           );
         }

       },
      )
    );
  }
}
