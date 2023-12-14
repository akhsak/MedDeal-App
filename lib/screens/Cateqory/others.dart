 
    // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Otherspage extends StatefulWidget {
  const Otherspage({Key? key}) : super(key: key);

  @override
  State<Otherspage> createState() => _OtherspageState();
}

class _OtherspageState extends State<Otherspage> {
  final List Speciality = ['', ''];
  final List doctorsname = [
    'book ',
    ' box',
  ];
  final List doctersimage = ['', ''];
  String searchedList = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchedList = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                focusColor: Color.fromARGB(255, 16, 105, 140),
                hintText: 'Search doctors...',
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 16, 105, 140),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctorsname.length,
              itemBuilder: (context, index) {
                if (doctorsname[index].toLowerCase().contains(searchedList) ||
                    Speciality[index]
                        .toLowerCase()
                        .contains(searchedList)) {
                  return DoctorCard(
                    index: index,
                    imagepath: doctersimage[index],
                    name: doctorsname[index],
                    speciality: Speciality[index],
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget DoctorCard({
    required int index,
    required String name,
    required String speciality,
    required String imagepath,
  }) {
    var screenSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagepath),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(screenSize.width * 0.02)),
                color: const Color.fromARGB(255, 19, 19, 19),
              ),
              height: screenSize.width * 0.2,
              width: screenSize.width * 0.15,
            ),
            title: Text(
              name,
              style: TextStyle(
                fontSize: screenSize.width * .05,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  speciality,
                  style: TextStyle(fontSize: screenSize.width * .03),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: screenSize.width * 0.05,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          
          ),
          SizedBox(
            width: double.infinity,
            height: screenSize.width * .18,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text(
                  'Make Appointment ',
                  style: TextStyle(
                    fontSize: screenSize.width * .05,
                    color: Color.fromARGB(255, 16, 105, 140),
                  ),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenSize.width * .03),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 223, 246, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
    
      
    
  
