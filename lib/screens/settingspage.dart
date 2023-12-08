
import 'package:flutter/material.dart';

class Settingpage extends StatelessWidget {
  Settingpage({Key? key});
  final list = [
    'Account Details',
    'Reset App Data',
    'Send Feedback',
    'Rate App',
    'Category',
  ];
  final screens = [
  ];

  final listicons=[
    Icon(Icons.person),
    Icon(Icons.restart_alt),
    Icon(Icons.feedback),
    Icon(Icons.star_border),
    Icon(Icons.file_copy)

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: (IconButton(onPressed: (){
        }, icon:Icon(Icons.arrow_back))),
        
      ),
      body: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return screens[index];
                }));
              },
              leading: listicons[index],
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
              title: Text(
                list[index],
                style: TextStyle(fontSize: 15),
              ),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: list.length,
          ),
        ],
      ),
    );
  }
}


