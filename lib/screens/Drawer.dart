
import 'package:flutter/material.dart';
import 'package:stockapp/screens/drawerfun.dart';


class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            // child: Lottie.asset(
            //   'assets/images/setting ltiie.json',
            //   width: 250,
            // ),
          ),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => AboutScreen(),
              // ));
            },
            child: DrawerItem(text: "About", icon: Icons.info),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => TermsScreen(),
              // ));
            },
            child: DrawerItem(
              text: "Terms and Conditions",
              icon: Icons.document_scanner_rounded,
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
            
            },
            child: DrawerItem(
              text: "Reset",
              icon: Icons.restore_from_trash_outlined,
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
             
            },
            child: DrawerItem(text: "Exit", icon: Icons.exit_to_app),
          ),
          Divider(),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: Text(
              "version : 1.0.1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}