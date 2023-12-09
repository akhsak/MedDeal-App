
import 'package:flutter/material.dart';

class Itemspage extends StatelessWidget {
  const Itemspage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Items',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2, 
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        padding: EdgeInsets.all(8.0),
        children: [
          _buildCategoryCard('firs aid', Icons.medical_services_outlined),
          _buildCategoryCard('Electrical', Icons.electrical_services),
          _buildCategoryCard('Machine', Icons.equalizer_sharp),
          _buildCategoryCard('', Icons.book),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          // Add your navigation logic here
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.blue, // You can change the color
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

