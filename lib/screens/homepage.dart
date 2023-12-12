// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(     padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'MedDeaL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ],
                  ),
                  // Container(
                  // child: IconButton(onPressed: (){}, icon:Icon(Icons.search)),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Color.fromARGB(255, 141, 206, 232)),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Color.fromARGB(255, 212, 225, 219),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: Center(child: Text('Welcome to MedDeal')),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(255, 250, 251, 252), // Set card color
                    child: ListTile(
                      title: Text('Item $index', style: TextStyle(color: Color.fromARGB(255, 3, 3, 3))),
                      subtitle: Text('Description of Item $index', style: TextStyle(color: Color.fromARGB(255, 8, 8, 8))),
                      leading: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 6, 6, 6)),
                      // Add more properties or customize ListTile as needed
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Homepage(),
    ),
  );
}
