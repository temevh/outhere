import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/talking.png',
      height: 320,
    );
  }
}
