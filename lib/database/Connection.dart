import 'package:firebase_database/firebase_database.dart';
import 'package:plantappui/database/Decentralization.dart';
import 'package:plantappui/database/Diary.dart';

import 'Lake.dart';
import 'User.dart';
class Connection{
  Connection();
  //Variable declare database
  static final FirebaseDatabase database=FirebaseDatabase.instance;
  //Function read all database
   Future<void> read() async {
    readUser();
    readLake();
    readDecentralization();
    readDiary();
  }
  //Function used to read list user
  Future<void> readUser() async {
    database.ref('user').onValue.listen((event) {
      List<User> user=List.empty(growable: true);
      for (var element in event.snapshot.children) {
        user.add(User.fromJson(element,int.parse(element.key.toString())));
      }
      for(var element in user){
        print(element.username);
      }
    });
  }
  //Function used to read list diary
  Future<void> readDiary() async {
    database.ref('diary').onValue.listen((event) {
      List<Diary> diary=List.empty(growable: true);
      for (var element in event.snapshot.children) {
        diary.add(Diary.fromJson(element,int.parse(element.key.toString())));
      }
      for(var element in diary){
        print(element.note);
      }
    });
  }
  //Function used to read list lake
  Future<void> readLake() async {
    database.ref('lake').onValue.listen((event) {
      List<Lake> lake=List.empty(growable: true);
      for (var element in event.snapshot.children) {
        lake.add(Lake.fromJson(element,int.parse(element.key.toString())));
      }
      for(var element in lake){
        print(element.lakename);
      }
    });
  }
  //Function used to read list decentralization
  Future<void> readDecentralization() async {
    database.ref('decentralization').onValue.listen((event) {
      List<Decentralization> decentralization=List.empty(growable: true);
      for (var element in event.snapshot.children) {
        decentralization.add(Decentralization.fromJson(element,int.parse(element.key.toString())));
      }
      for(var element in decentralization){
        print(element.name);
      }
    });
  }
}