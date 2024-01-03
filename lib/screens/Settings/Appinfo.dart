// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Appinfopage extends StatelessWidget {
   const Appinfopage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Explorer App',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Welcome to MedDeaL stock management, your comprehensive solution for efficient medical equipment stock management. Our app is designed to streamline the inventory processes in healthcare facilities, ensuring the availability of essential equipment, reducing wastage, and enhancing overall operational efficiency.',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Key Features:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      '📌 File Categorization: Organize your files into distinct categories such as images, videos, audios, and documents for easy access.',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '📌 Secure Data: Your privacy is our priority. We use the powerful Hive database to ensure the security of your data.',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '📌 Search Functionality: Quickly locate your files with our robust search feature.',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '📌 Chart system: Keep track of files added in this app and also view the total count of files in category based and overall files added.',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Terms and Conditions:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TermsScreen(),
                    ));
                  },
                  child: const Text(
                    'Read our Terms and Conditions',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text('Terms and Conditions content goes here.'),
      ),
    );
  }
}
