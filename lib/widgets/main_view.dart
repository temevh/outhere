import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:outhere/widgets/mainView/mainImage.dart';
import 'package:outhere/widgets/mainView/mainText.dart';
import 'package:outhere/widgets/mainView/mainButtons.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const MainImage(),
          const SizedBox(height: 40),
          const MainText(),
          const SizedBox(height: 20),
          Text(
            'Did you succeed?',
            style: GoogleFonts.comfortaa(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          const SizedBox(height: 20),
          const MainButtons(),
        ],
      ),
    );
  }
}
