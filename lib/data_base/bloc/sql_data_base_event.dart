part of 'sql_data_base_bloc.dart';

 sealed class SqlDataBaseEvent {}
final class GetTheAllData extends SqlDataBaseEvent {}
final class SelectedId extends SqlDataBaseEvent {
  int? id;
  SelectedId(this.id);
}
final class DeleteUser extends SqlDataBaseEvent {}
final class AddUser extends SqlDataBaseEvent {
  final String username;
  final String email;
  final String timestamp;
  AddUser({required this.username,required this.email,required this.timestamp});
}
final class UpdateTheUser extends SqlDataBaseEvent {
  final String username;
  final String email;
  final String timestamp;
  UpdateTheUser({required this.username,required this.email,required this.timestamp});
}
final class SearchUser extends SqlDataBaseEvent {
   String searchQueary;
   SearchUser(this.searchQueary);
}
final class LongTapDelete extends SqlDataBaseEvent {
   int? id;
   bool shoSelected;
   LongTapDelete(this.id,this.shoSelected);
}
final class SelectUser extends SqlDataBaseEvent {
   bool forDelete;
   SelectUser(this.forDelete);
}