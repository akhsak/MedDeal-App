// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockapp/controller/functions/db_function.dart';
import 'package:stockapp/view/settings/Appinfo.dart';
import 'package:stockapp/view/settings/Terms.dart';
import 'package:stockapp/view/welcmescreen/loginscreen.dart';
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
              showResetAppAlertDialog(context);
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

  void showResetAppAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure you want to reset the app?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteAllitems();
                Navigator.pop(context);
              },
              child: Text('Reset'),
            ),
          ],
        );
      },
    );
  }
}
