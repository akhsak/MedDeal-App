// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CustomTextForm extends StatelessWidget {
//   final String labelText;
//   final TextEditingController controller;
//   final int? maxLength;
//   final TextInputFormatter? inputFormatters;


//   const CustomTextForm(
//       {super.key, required this.labelText, required this.controller, this.maxLength, this.inputFormatters});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: TextInputType.number,
//       inputFormatters: 
//         //FilteringTextInputFormatter.digitsOnly
//         inputFormatters,
      
//       decoration: InputDecoration(
//         labelText: labelText,
//         prefixText: '₹',
//         border: OutlineInputBorder(),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'value is empty';
//         } else {
//           return null;
//         }
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextForm extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final TextInputType? keyboard;
  

  const CustomTextForm({
    Key? key,
    required this.labelText,
    required this.controller,
    this.maxLength,
    this.inputFormatters, this.prefixText, this.keyboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        prefixText: prefixText,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Value is empty';
        } else {
          return null;
        }
      },
    );
  }
}
