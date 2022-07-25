
import 'package:firebase_database/firebase_database.dart';
import 'Connection.dart';
class User {
  //Contructor with annotation required
  User({
    required this.id,
    required this.phonenumber,
    required this.password,
    required this.username,
  });
  //Variable of user
  int id;
  String phonenumber;
  String password;
  String username;
  //Function parse JSON to user
  factory User.fromJson(DataSnapshot snapshot, int id) => User(
    id:id,
    phonenumber:snapshot.child('phonenumber').value.toString(),
    password: snapshot.child('password').value.toString(),
    username: snapshot.child('username').value.toString(),
  );
  // Function convert object to JSON (not have id)
  Map<String, dynamic> toJson() => {
    "phonenumber": phonenumber,
    "password": password,
    "username": username,
  };
  //Function write record database
  Future<void> write() async {
    DatabaseReference ref=Connection.database.ref("user/"+id.toString());
    await ref.set(toJson());
  }
  //Function update record database
  Future<void> update() async {
    DatabaseReference ref=Connection.database.ref("user/"+id.toString());
    await ref.update(toJson());
  }
  //Function delete record on database
  Future<void> delete() async {
    DatabaseReference ref=Connection.database.ref("user/"+id.toString());
    await ref.remove();
  }
}
