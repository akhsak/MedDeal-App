import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: .0,
          color: Colors.black, // Set text color to black
          fontFamily: 'YourCustomFont', // Set your custom font
          // You can also customize other properties like fontWeight, letterSpacing, etc.
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('Login', speed: const Duration(milliseconds: 300)),
          ],
        ),
      ),
    );
  }
}
