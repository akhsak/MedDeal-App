// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Termsprivacy extends StatelessWidget {
  const Termsprivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Terms and conditions',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Divider(),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  """
         Welcome to  MedDeaL stock management, your comprehensive solution for efficient medical equipment stock management. Our app is designed to streamline the inventory processes in healthcare facilities, ensuring the availability of essential equipment, reducing wastage, and enhancing overall operational efficiency.

          1. Use Responsibly: The Explorer App is designed to help you organize and arrange your personal files. Use it responsibly and keep your data accordingly!

          2. Your Content: The data you add is your responsibility.          

          3. App Ownership: The Explorer App and its content belong to us. Please don't modify, distribute, or reverse engineer the app without our permission.

          4. App Changes: We might update the app or these terms. Stay tuned for any announcements from us.

          5. App Availability: We aim to provide the app 24/7, but we can't guarantee it. We're not responsible for any inconvenience caused by app unavailability.

          6. Get in Touch: If you have questions, reach out to us at
                  """,
                ),
                Text(
                  'adilrusfeed@gmail.com',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('''
    By using the Explorer App, you agree to these terms.'''),
              ],
            ),
          ),
        ),
      ),
      // appBar: AppBar(
      //  title:  Text('Terms&Privacy'),
      //  centerTitle: true,
      //  backgroundColor: Colors.green,
      //   ),
      //   body: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(80),
      //         child: Center(
      //           child: Text(
      //             'helloo',style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       )
      //     ],
      //    ),
    );
  }
}