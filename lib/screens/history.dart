import 'package:flutter/material.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('history',style:TextStyle(color: Colors.white),),),
      ),
          body: Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(255, 251, 251, 252), // Set card color
                    child: ListTile(
                      title: Text('Item $index', style: TextStyle(color: Color.fromARGB(255, 7, 7, 7))),
                      subtitle: Text('Description of Item $index', style: TextStyle(color: Color.fromARGB(255, 13, 13, 13))),
                      leading: Icon(Icons.shopping_cart, color: const Color.fromARGB(255, 9, 8, 8)),
                      // Add more properties or customize ListTile as needed
                    ),
                  );
                },
              ),
            ),
    );
  }
}