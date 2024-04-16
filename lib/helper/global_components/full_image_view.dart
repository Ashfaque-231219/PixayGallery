import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  final String imageUrl;

  const ImageScreen({Key? key, required this.imageUrl,})
      : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  double zoom = 1.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: ExtendedImage.network(
        widget.imageUrl,
          fit: BoxFit.cover,
          initGestureConfigHandler: (state) {
            return GestureConfig(
              minScale: 0.9,
              animationMinScale: 0.7,
              maxScale: 5.0, // Adjust the maximum scale as needed
              animationMaxScale: 5.5,
              speed: 1.0,
              inertialSpeed: 100.0,
              initialScale: 1.0,
              inPageView: false,
              initialAlignment: InitialAlignment.center,
            );
          },
        )),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}