part of 'sql_data_base_bloc.dart';


final class SqlDataBaseInitial {
  final List<User> users;
  final bool isSelected;
  final bool searchReQuest;
  final bool delereUser;
  SqlDataBaseInitial({required this.users,this.searchReQuest=false, this.isSelected=false,this.delereUser=false});
}
