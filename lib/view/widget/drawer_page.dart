// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/view/settings/appinfo.dart';
import 'package:stockapp/view/settings/terms.dart';
import 'package:stockapp/view/screen/login_screen.dart';

class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text(
              'App Info',
              style: TextStyle(color: Color.fromARGB(255, 43, 90, 152)),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Appinfopage()));
            },
            leading: const Icon(
              Icons.info,
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 167, 173, 181),
          ),
          ListTile(
            title: const Text(
              'Terms&Condition',
              style: TextStyle(color: Color.fromARGB(255, 43, 90, 152)),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Termsprivacy()));
            },
            leading: const Icon(
              Icons.rule,
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 167, 173, 181),
          ),
          ListTile(
            title: const Text(
              'Clear Data',
              style: TextStyle(color: Color.fromARGB(255, 43, 90, 152)),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Clear Data'),
                    content:
                        const Text('Are you sure you want to clear all data ?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<DbProvider>(context, listen: false)
                              .deleteAllitems();

                          Navigator.pop(context);
                        },
                        child: const Text(
                          'CLEAR',
                          style: TextStyle(
                              color: Color.fromARGB(255, 43, 90, 152)),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            leading: const Icon(
              Icons.delete,
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 167, 173, 181),
          ),
          ListTile(
            title: const Text(
              'Log Out',
              style: TextStyle(color: Color.fromARGB(255, 43, 90, 152)),
            ),
            leading: const Icon(
              Icons.exit_to_app,
            ),
            onTap: () {
              signout(context);
            },
          ),
          Divider(
            color: Color.fromARGB(255, 167, 173, 181),
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: Text(
              "version : 1.0.1",
              style: TextStyle(
                  color: Color.fromARGB(255, 43, 90, 152),
                  fontWeight: FontWeight.bold),
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
