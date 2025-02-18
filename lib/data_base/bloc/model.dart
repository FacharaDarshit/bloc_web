class User {
  final int? id;
  final String username;
  final String email;
  final String timestamp;
  bool forDelete;

  User({this.id, required this.username, required this.email,required this.timestamp,this.forDelete=false});

  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'email': email,'timestamp':timestamp};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      timestamp: map['timestamp'],

    );
  }
}
