import 'package:block_demo/make_apicall/cubit/api_call_bloc.dart';
import 'package:block_demo/make_apicall/screen/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiCallBloc(),
      child: DataScreen(),
    );
  }
}
