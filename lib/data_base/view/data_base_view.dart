import 'package:block_demo/data_base/bloc/sql_data_base_bloc.dart';
import 'package:block_demo/data_base/view/data_base_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBaseView extends StatelessWidget {
  const DataBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SqlDataBaseBloc(tt: 1),
      child: SqfScreen(),
    );
  }
}
