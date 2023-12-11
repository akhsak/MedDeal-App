
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
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildCategoryCard('Medicine', Icons.medical_services_outlined, Colors.red),
          _buildCategoryCard('Equipments', Icons.electrical_services, Colors.orange),
          _buildCategoryCard('Machines', Icons.equalizer_sharp, Colors.green),
          _buildCategoryCard('others', Icons.abc, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
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
              color: color,
            ),
            SizedBox(height: 12.0),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


