import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/sql_data_base_bloc.dart';

class SqfScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController usermailController = TextEditingController();
  final TextEditingController userTimestampController = TextEditingController();

  SqfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(
        () => context.read<SqlDataBaseBloc>().add(GetTheAllData()));
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        userTimestampController.clear();
        context
            .read<SqlDataBaseBloc>()
            .add(SearchUser(""));
      },
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade200,
        appBar: CupertinoNavigationBar(
          middle: Text(
            "Add Data",
            style: TextStyle(
                fontSize: 23,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple.shade500,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Column(
              spacing: 20,
              children: [
                Container(
                  color: Colors.deepPurple.shade200,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        spacing: 20,
                        children: [
                          SizedBox(),
                          BlocBuilder<SqlDataBaseBloc, SqlDataBaseInitial>(
                            builder: (context, state) =>
                                CupertinoSearchTextField(
                              controller: userTimestampController,
                              backgroundColor: Colors.white,
                              onChanged: (value) {
                                context
                                    .read<SqlDataBaseBloc>()
                                    .add(SearchUser(value));
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Name:-",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                              Expanded(
                                child: CupertinoTextField(
                                  onTapOutside: (event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  controller: usernameController,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Email:-",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                              Expanded(
                                child: CupertinoTextField(
                                  onTapOutside: (event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  controller: usermailController,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          BlocBuilder<SqlDataBaseBloc, SqlDataBaseInitial>(
                              builder: (context, state) {
                            return Row(
                              spacing: 20,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      height: 50,
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple.shade500,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(9))),
                                      child: TextButton(
                                          onPressed: () {
                                            if (usermailController
                                                    .text.isEmpty ||
                                                usernameController
                                                    .text.isEmpty) {
                                              return;
                                            }
                                            String datetime =
                                                "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
                                            context.read<SqlDataBaseBloc>().add(
                                                AddUser(
                                                    username: usernameController
                                                        .text
                                                        .toString(),
                                                    email: usermailController
                                                        .text
                                                        .toString(),
                                                    timestamp: datetime));
                                            clearController();
                                          },
                                          child: Text(
                                            "Add",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ))),
                                ),
                                if (state.isSelected)
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: 50,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurple.shade500,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(9))),
                                        child: TextButton(
                                            onPressed: () async {
                                              if (usermailController
                                                      .text.isEmpty ||
                                                  usernameController
                                                      .text.isEmpty) {
                                                return;
                                              }
                                              String datetime =
                                                  "${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}";
                                              context
                                                  .read<SqlDataBaseBloc>()
                                                  .add(UpdateTheUser(
                                                    email: usermailController
                                                        .text
                                                        .toString(),
                                                    timestamp: datetime,
                                                    username: usernameController
                                                        .text
                                                        .toString(),
                                                  ));
                                              clearController();
                                            },
                                            child: Text(
                                              "Update",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ))),
                                  ),
                                if (state.isSelected||state.delereUser)
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: 50,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurple.shade500,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(9))),
                                        child: TextButton(
                                            onPressed: () {
                                              if ((usermailController.text.isEmpty ||
                                                  usernameController.text.isEmpty)&&state.delereUser==false) {
                                                print("object");
                                                return;
                                              }
                                              context
                                                  .read<SqlDataBaseBloc>()
                                                  .add(DeleteUser());
                                              clearController();
                                            },
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ))),
                                  ),
                              ],
                            );
                          }),
                          SizedBox(
                            height: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SqlDataBaseBloc, SqlDataBaseInitial>(
                    builder: (context, state) {
                      if (state.users.isNotEmpty) {
                        return ListView.builder(
                            itemCount: state.users.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: ListTile(
                                  onTap: () {
                                    if(state.delereUser){
                                      print("object");
                                      state.users[index].forDelete=!state.users[index].forDelete;
                                      print(state.users[index].forDelete);
                                      context.read<SqlDataBaseBloc>().add(LongTapDelete(state.users[index].id,state.users[index].forDelete));
                                      return;
                                    }
                                    usermailController.text =
                                        state.users[index].email;
                                    usernameController.text =
                                        state.users[index].username;
                                    context
                                        .read<SqlDataBaseBloc>()
                                        .add(SelectedId(state.users[index].id));
                                  },
                                  onLongPress: () {
                                    context
                                        .read<SqlDataBaseBloc>()
                                        .add(SelectUser(true));

                                  },
                                  splashColor: Colors.grey,
                                  tileColor: Colors.deepPurple.shade100,
                                  style: ListTileStyle.list,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.deepPurple.shade300,
                                        width: 0,
                                      )),
                                  leading:state.delereUser?
                                      Checkbox(value: state.users[index].forDelete, onChanged:(value) {
                                        print("object");
                                      },)
                                      :Icon(Icons.person),
                                  title: Text(state.users[index].username),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(state.users[index].timestamp),
                                    ],
                                  ),
                                  subtitle: Text(state.users[index].email),
                                ),
                              );
                            });
                      } else if (state.searchReQuest && state.users.isEmpty) {
                        return Center(child: Text("No RESULT FOUNDS",style: TextStyle(fontSize: 20,color: Colors.black),));
                      } else {
                        print(">>>>>>>>>>>>${state.users.length}");
                        print(">>>>>>>>>>>>${state.searchReQuest}");
                        print(">>>>>>>>>>>>${state.users}");
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearController() {
    usernameController.clear();
    usermailController.clear();
  }
}
