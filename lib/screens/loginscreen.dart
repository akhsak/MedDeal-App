// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stockapp/screens/homepage.dart';

class Userlogin extends StatelessWidget {
  Userlogin({super.key});

  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernamecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'User Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter username';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (contex) => Homepage()));
                  },
                  icon: Icon(Icons.check),
                  label: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
