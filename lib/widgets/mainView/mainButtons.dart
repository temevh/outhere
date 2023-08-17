import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButtons extends StatefulWidget {
  const MainButtons({super.key});

  @override
  State<MainButtons> createState() => _MainButtonsState();
}

class _MainButtonsState extends State<MainButtons> {
  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Text(
            "Yes I did!",
            style: GoogleFonts.comfortaa(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 38,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: Text(
            "Not yet...",
            style: GoogleFonts.comfortaa(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 38,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
      ],
    ));
  }
}
