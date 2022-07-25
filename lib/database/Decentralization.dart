import 'package:firebase_database/firebase_database.dart';
import 'Connection.dart';
class Decentralization {
  Decentralization({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory Decentralization.fromJson(DataSnapshot snapshot, int id) => Decentralization(
    id: id,
    name: snapshot.child('name').value.toString(),
    description: snapshot.child('description').value.toString(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
  };
  //Function write record database
  Future<void> write() async {
    DatabaseReference ref=Connection.database.ref("decentralization/"+id.toString());
    await ref.set(toJson());
  }
  //Function update record database
  Future<void> update() async {
    DatabaseReference ref=Connection.database.ref("decentralization/"+id.toString());
    await ref.update(toJson());
  }
  //Function delete record on database
  Future<void> delete() async {
    DatabaseReference ref=Connection.database.ref("decentralization/"+id.toString());
    await ref.remove();
  }
}
