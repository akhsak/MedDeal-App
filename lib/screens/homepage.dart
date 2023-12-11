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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
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
            decoration: BoxDecoration(color: Color.fromARGB(255, 13, 186, 56)),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Color.fromARGB(255, 66, 203, 139),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(child: Text('welcome to MedDeal')),
                      ),
                      SizedBox(height: 25,
                      ),
                      TextField()
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        
      ),
     

    );
  }
}

