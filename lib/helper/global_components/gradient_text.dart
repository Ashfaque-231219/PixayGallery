import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final LinearGradient gradient;

  const GradientText({super.key, 
    required this.text,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Set the initial text color
        ),
      ),
    );
  }
}