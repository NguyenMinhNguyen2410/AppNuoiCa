import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plantappui/database/Decentralization.dart';
import 'package:plantappui/database/Diary.dart';
import 'package:plantappui/database/Lake.dart';
import 'package:plantappui/database/User.dart';
import 'database/Connection.dart';
import 'screens/home/home_screen.dart';
import 'package:firebase_database/firebase_database.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Connection connection=Connection();
    connection.read();
    // User user=User(id: 3, phonenumber: 'phonenumber', password: 'password', username: 'username');
    // user.write();
    // Diary diary=Diary(id: 1, date: DateTime.parse('2022-07-25'), changewater: true, quantityfishdie: 3, picture: 'picture', note: 'note', quantityfood:4, medicine: 'medicine', iduser: 1, idlake: 2);
    // diary.write();
    // Lake lake=Lake(id: 1, lakename: 'lakename', pH: 3, fishname: 'fishname', fishtype: 'fishtype', quantity: 2, date: DateTime.parse('2022-07-25'));
    // lake.write();
    // Decentralization decentralization=Decentralization(id: 1, name: 'admin', description: 'description');
    // decentralization.write();
    return MaterialApp(
      title: 'Plant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }

}
