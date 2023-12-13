
import 'package:flutter/material.dart';

class Saniterspage extends StatefulWidget {
  const Saniterspage({Key? key}) : super(key: key);

  @override
  State<Saniterspage> createState() => _SaniterspageState();
}

class _SaniterspageState extends State<Saniterspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('saniters'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('saniters'),
      ),
    );
  }
}
