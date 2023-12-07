import 'package:flutter/material.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
        actions: [Icon(Icons.arrow_back)],
      ),
      body: Column(
        children: [
        //  ListView.separated(
              // itemBuilder: ,
              // separatorBuilder: ,
              // itemCount:),
        ],
      ),
    );
  }
}
