
import 'package:firebase_database/firebase_database.dart';
import 'Connection.dart';

class Diary {
  Diary({
    required this.id,
    required this.date,
    required this.changewater,
    required this.quantityfishdie,
    required this.picture,
    required this.note,
    required this.quantityfood,
    required this.medicine,
    required this.iduser,
    required this.idlake,
  });

  int id;
  DateTime date;
  bool changewater;
  int quantityfishdie;
  String picture;
  String note;
  int quantityfood;
  String medicine;
  int iduser;
  int idlake;

  factory Diary.fromJson(DataSnapshot snapshot, int id) => Diary(
    id: id,
    date: DateTime.parse(snapshot.child('date').value.toString()),
    changewater: snapshot.child('changewater').value.toString().contains('true')?true:false,
    quantityfishdie: int.parse(snapshot.child('quantityfishdie').value.toString()),
    picture: snapshot.child('pỉcture').value.toString(),
    note: snapshot.child('note').value.toString(),
    quantityfood: int.parse(snapshot.child('quantityfood').value.toString()),
    medicine:snapshot.child('medicine').value.toString(),
    iduser: int.parse(snapshot.child('iduser').value.toString()),
    idlake: int.parse(snapshot.child('idlake').value.toString()),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "changewater": changewater,
    "quantityfishdie": quantityfishdie,
    "picture": picture,
    "note": note,
    "quantityfood": quantityfood,
    "medicine": medicine,
    "iduser": iduser,
    "idlake": idlake,
  };
  //Function write record database
  Future<void> write() async {
    DatabaseReference ref=Connection.database.ref("diary/"+id.toString());
    await ref.set(toJson());
  }
  //Function update record database
  Future<void> update() async {
    DatabaseReference ref=Connection.database.ref("diary/"+id.toString());
    await ref.update(toJson());
  }
  //Function delete record on database
  Future<void> delete() async {
    DatabaseReference ref=Connection.database.ref("diary/"+id.toString());
    await ref.remove();
  }
}
