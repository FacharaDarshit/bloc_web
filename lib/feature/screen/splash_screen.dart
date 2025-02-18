import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation.dart';
import '../bloc/splash_block.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<NavigationBloc, AppState>(builder: (context, state) => FloatingActionButton(onPressed: () {
            state.add(AppFetchData());
            print(state);

          },),),
          BlocBuilder<SplashBlock,ApiState>(builder: (context, state) {
            return FloatingActionButton(onPressed: () {
              context.read<SplashBlock>().fetchData();
              print(state);
            },);
          },),
        ],
      ),
      body: BlocBuilder<SplashBlock,ApiState>(builder: (context, state) {
        if(state is ApiInitial){
          return Center(child: CircularProgressIndicator());
        }
        else if(state is ApiLoading){
          return Center(child: CircularProgressIndicator());
        }else if(state is ApiSuccess){
          return Container(
            child: Center(
              child: ListView.builder(
                itemCount: state.bestSelling.categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.bestSelling.categories[index].strCategory),
                    leading: Image.network(state.bestSelling.categories[index].strCategoryThumb),
                  );
                },
              )
            ),
          );
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },),
    );
  }
}
