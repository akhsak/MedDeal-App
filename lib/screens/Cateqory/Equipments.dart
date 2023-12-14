
import 'package:flutter/material.dart';

class Equipmentspage extends StatefulWidget {
  const Equipmentspage({Key? key}) : super(key: key);

  @override
  State<Equipmentspage> createState() => _EquipmentspageState();
}

class _EquipmentspageState extends State<Equipmentspage> {
  final List<String> doctorsSpeciality = ['paracetamol', 'Allergic'];
  final List<String> doctorsname = [
    'Dr. Emily Mitchell - MBBS, ',
    'Dr. Ethan Reynolds - MBChB,',
  ];
  final List<String> doctersimage = [' ', ' '];
  String searchedList = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine List'),
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
                hintText: 'Search Equipments...',
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
                    doctorsSpeciality[index]
                        .toLowerCase()
                        .contains(searchedList)) {
                  return DoctorCard(
                    index: index,
                    imagepath: doctersimage[index],
                    name: doctorsname[index],
                    speciality: doctorsSpeciality[index],
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
            // trailing: IconButton(
            //   icon: IsDoctorInFvrt(name)
            //       ? Icon(
            //           Icons.favorite,
            //           color: Colors.red,
            //         )
            //       : Icon(Icons.favorite_border),
            //   onPressed: () {
            //     setState(() {
            //       if (IsDoctorInFvrt(name)) {
            //         final snackBar = SnackBar(
            //           content: Text("Doctor is already in the favorite list."),
            //           backgroundColor: const Color.fromARGB(255, 116, 10, 2),
            //         );
            //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //       } else {
            //         onAddToFvrt(name, imagepath, speciality);
            //         final snackBar = SnackBar(
            //           content:
            //               Text("Doctor has been added to the favorite list."),
            //           backgroundColor: Color.fromARGB(255, 19, 19, 19),
            //         );
            //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //       }
            //     });
            //   },
            // ),
          ),
          SizedBox(
            width: double.infinity,
            height: screenSize.width * .18,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  // Implement your action for the appointment button
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

  bool IsDoctorInFvrt(String doctorName) {
    // Implement your logic to check if the doctor is in the favorite list
    return false;
  }

  void onAddToFvrt(String doctorName, String imagePath, String speciality) {
    // Implement your logic to add the doctor to the favorite list
  }
}


