import 'package:flutter/material.dart';

class Itemspage extends StatelessWidget {
  const Itemspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Items',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        //backgroundColor: Colors.grey,
        actions: [
       IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_rounded)),
       IconButton(onPressed: () {}, icon: Icon(Icons.search)),

          ],
      ),
    );
  }
}
