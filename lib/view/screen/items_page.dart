// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stockapp/model/itemsmodel.dart';
import 'package:stockapp/view/cateqory/equipments.dart';
import 'package:stockapp/view/cateqory/medicine.dart';
import 'package:stockapp/view/cateqory/others.dart';
import 'package:stockapp/view/cateqory/saniters.dart';

class Itemspage extends StatefulWidget {
  const Itemspage({Key? key}) : super(key: key);

  @override
  _ItemspageState createState() => _ItemspageState();
}

class _ItemspageState extends State<Itemspage> {
  List<CategoryData> categories = [
    const CategoryData('Medicine', Icons.medical_services_outlined,
        Color.fromARGB(255, 230, 229, 228), Medicinepage()),
    const CategoryData('Equipments', Icons.electrical_services,
        Color.fromARGB(255, 237, 236, 234), Equipmentspage()),
    const CategoryData('Saniters', Icons.equalizer_sharp,
        Color.fromARGB(255, 233, 235, 233), Saniterspage()),
    const CategoryData(
        'others', Icons.abc, Color.fromARGB(255, 245, 247, 248), Otherspag())
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
      appBar: AppBar(),
      body: SingleChildScrollView(
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
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'MedDeaL',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Lottie.asset(
                  'assets/dctrrrr.json',
                  height: 350,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 252, 251, 250)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

   _showBottomSheet(BuildContext context) {
   return showModalBottomSheet(
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
                  color:  Color.fromARGB(255, 50, 82, 137),
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
      color: Colors.blueAccent,
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
                color: const Color.fromARGB(255, 248, 248, 245),
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
