import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stockapp/db/model/datamodel.dart';
import 'package:stockapp/screens/bottomtabs/bottombar.dart';
import 'package:stockapp/screens/viewpage/Splash.dart';


const savekeyname = 'UserLogin';

Future<void> main() async{
  await Hive.initFlutter();
 if ( !Hive.isAdapterRegistered(ItemsModelAdapter().typeId)) {
   Hive.registerAdapter(ItemsModelAdapter());
 }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottombar(),
    );
  }
}