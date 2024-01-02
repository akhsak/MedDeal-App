// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:stockapp/screens/Cateqory/others.dart';
import 'package:stockapp/screens/Cateqory/Equipments.dart';
import 'package:stockapp/screens/Cateqory/Medicine.dart';
import 'package:stockapp/screens/Cateqory/Saniters.dart';

class Itemspage extends StatefulWidget {
  const Itemspage({Key? key}) : super(key: key);

  @override
  _ItemspageState createState() => _ItemspageState();
}

class _ItemspageState extends State<Itemspage> {
  List<CategoryData> categories = [
    const CategoryData('Medicine', Icons.medical_services_outlined, Colors.red, Medicinepage()),
    const CategoryData('Equipments', Icons.electrical_services, Colors.orange, Equipmentspage()),
    const CategoryData('Saniters', Icons.equalizer_sharp, Colors.green, Saniterspage()),
    const CategoryData('others', Icons.abc, Colors.blue, Otherspag())
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _showBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 2, 85, 1),
        title: Text(
          'Items',
          style: TextStyle(
            color: Color.fromRGBO(243, 243, 245, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:Center(
        child: ElevatedButton(onPressed: () {
          _showBottomSheet(context);
        }, child: Text("dthdgt")),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.55,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => categories[index].route,
                        ),
                      );
                    },
                    child: _buildCategoryCard(categories[index]),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}


  Widget _buildCategoryCard(CategoryData category) {
    return Card(
      //color: Colors.amber,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: category.color,
            ),
            SizedBox(height: 20.0),
            Text(
              category.title,
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

class CategoryData {
  final String title;
  final IconData icon;
  final Color color;
  final Widget route;

  const CategoryData(this.title, this.icon, this.color, this.route);
}
