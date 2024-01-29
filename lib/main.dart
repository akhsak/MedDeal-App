// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/add_provider.dart';
import 'package:stockapp/controller/bottom_provider.dart';
import 'package:stockapp/controller/item_provider.dart';
import 'package:stockapp/controller/search_provider.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/view/screen/splash.dart';

const savekeyname = 'UserLogin';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=>AddProvider()),
      ChangeNotifierProvider(create: (context)=>BottomProvider()),
     ChangeNotifierProvider(create: (context)=>SearchProvider())
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Splashpage(),
      ),
    );
  }
}