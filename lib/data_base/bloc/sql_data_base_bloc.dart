import 'package:bloc/bloc.dart';
import 'package:block_demo/data_base/bloc/data_base_helper.dart';
import 'package:block_demo/data_base/bloc/model.dart';
import 'package:meta/meta.dart';

part 'sql_data_base_event.dart';
part 'sql_data_base_state.dart';
class SqlDataBaseBloc extends Bloc<SqlDataBaseEvent, SqlDataBaseInitial> {
  SqlDataBaseBloc({required this.tt}) : super(SqlDataBaseInitial(users: [])) {
    on<GetTheAllData>(getIngTheData);
    on<SelectedId>(getUserId);
    on<AddUser>(addUser);
    on<DeleteUser>(deleteUser);
    on<UpdateTheUser>(updateTheUser);
    on<SearchUser>(searchUser);
    on<LongTapDelete>(longTapForDeleteMod);
    on<SelectUser>(selectMad);
  }
  int tt;

  List<int?> id=[];
  int? userId;
  List<User> userList=[];
  DatabaseHelper dataBaseHelper=DatabaseHelper.instance;


  //for getting the all user
  Future<void> getIngTheData(GetTheAllData event, Emitter<SqlDataBaseInitial> emit) async{
     userList= await dataBaseHelper.getAllUser();
     if(userList.isEmpty){
       emit(SqlDataBaseInitial(users: userList,searchReQuest: true));
       return;
     }

     emit(SqlDataBaseInitial(users: userList));
  }
  //for adding the user
  Future<void> addUser(AddUser event, Emitter<SqlDataBaseInitial> emit) async{
    await dataBaseHelper.insertUser(User(username:event.username , email:event.email , timestamp:event.timestamp ));
    add(GetTheAllData());
  }
  //for Deleting the user
  Future<void> deleteUser(DeleteUser event, Emitter<SqlDataBaseInitial> emit)async{
    // await id.map((e) async{
    // },);
    print("THIS IS THE ID>>>>>$id");

    for(int i=0;i<id.length;i++){
      await dataBaseHelper.deleteUserBuID(id[i]!);
    }
    id=[];
    print("THIS IS THE ID>>>>>$id");

    // await dataBaseHelper.deleteUserBuID(userId!);
    add(GetTheAllData());
  }


 //for select user
  void getUserId(SelectedId event, Emitter<SqlDataBaseInitial> emit){

    emit(SqlDataBaseInitial(users: state.users,isSelected: true));
    id=[event.id];
  }
  //For updating THe User
  Future<void> updateTheUser(UpdateTheUser event, Emitter<SqlDataBaseInitial> emit)async{
     User updateUser=User(username: event.username, email:event.email, timestamp:event.timestamp,id: id.last);
    await dataBaseHelper.updateUserById(updateUser);
     add(GetTheAllData());
  }
  //for Search the User
  Future<void> searchUser(SearchUser event, Emitter<SqlDataBaseInitial> emit)async{
    List<User> tampUser=userList;
    if(event.searchQueary.length>1){
      tampUser= userList.where((e) {
        return e.username.contains(event.searchQueary)||e.email.contains(event.searchQueary);
      },).toList();
    }
    emit(SqlDataBaseInitial(users: tampUser,isSelected: false,searchReQuest: true));
  }
  //
  Future<void> selectMad(SelectUser event, Emitter<SqlDataBaseInitial> emit)async{
    emit(SqlDataBaseInitial(users: state.users,isSelected: false,searchReQuest: state.isSelected,delereUser: !state.delereUser));

  }
  //select the user
  Future<void> longTapForDeleteMod(LongTapDelete event, Emitter<SqlDataBaseInitial> emit)async{
    List<User> tampUser=userList;
    tampUser=tampUser.map((element) {
      if(element.id==event.id){
        id.add(event.id);
        return User(username: element.username,timestamp: element.timestamp,email: element.email,id: element.id,forDelete: event.shoSelected);
      }
      return element;
    },).toList();
    emit(SqlDataBaseInitial(users: tampUser,isSelected: false,searchReQuest: state.isSelected,delereUser: state.delereUser));
  }
  


}
