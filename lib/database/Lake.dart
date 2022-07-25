import 'package:firebase_database/firebase_database.dart';
import 'Connection.dart';

class Lake {
  Lake({
    required this.id,
    required this.lakename,
    required this.pH,
    required this.fishname,
    required this.fishtype,
    required this.quantity,
    required this.date,
  });

  int id;
  String lakename;
  int pH;
  String fishname;
  String fishtype;
  int quantity;
  DateTime date;

  factory Lake.fromJson(DataSnapshot snapshot, int id) => Lake(
    id: id,
    lakename: snapshot.child('lakename').value.toString(),
    pH: int.parse(snapshot.child('pH').value.toString()),
    fishname: snapshot.child('fishname').value.toString(),
    fishtype: snapshot.child('fishtype').value.toString(),
    quantity: int.parse(snapshot.child('quantity').value.toString()),
    date: DateTime.parse(snapshot.child('date').value.toString()),
  );

  Map<String, dynamic> toJson() => {
    "lakename": lakename,
    "pH": pH,
    "fishname": fishname,
    "fishtype": fishtype,
    "quantity": quantity,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
  //Function write record database
  Future<void> write() async {
    DatabaseReference ref=Connection.database.ref("lake/"+id.toString());
    await ref.set(toJson());
  }
  //Function update record database
  Future<void> update() async {
    DatabaseReference ref=Connection.database.ref("lake/"+id.toString());
    await ref.update(toJson());
  }
  //Function delete record on database
  Future<void> delete() async {
    DatabaseReference ref=Connection.database.ref("lake/"+id.toString());
    await ref.remove();
  }
}