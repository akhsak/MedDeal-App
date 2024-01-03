// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockapp/function/functions/db_function.dart';
import 'package:stockapp/screens/viewpage/loginscreen.dart';
import 'package:stockapp/screens/settings/Appinfo.dart';
import 'package:stockapp/screens/settings/Terms.dart';
import 'package:stockapp/widget/drawer.dart';

class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Appinfopage(),
              ));
            },
            child: DrawerItem(text: "App info", icon: Icons.info),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Termsprivacy(),
              ));
            },
            child: DrawerItem(
              text: "Terms and Conditions",
              icon: Icons.document_scanner_rounded,
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              deleteAllitems();
            },
            child: DrawerItem(
              text: "Reset App",
              icon: Icons.restore_from_trash_outlined,
            
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              signout(context);
            },
            child: DrawerItem(text: "Logout", icon: Icons.exit_to_app),
          ),
          Divider(),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: Text(
              "version : 1.0.1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void signout(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context1) => ScreenLogin()),
      (route) => false,
    );
  }
}
