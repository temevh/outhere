import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outhere/widgets/reviewView/review_view.dart';

class MainButtons extends StatefulWidget {
  const MainButtons({super.key});

  @override
  State<MainButtons> createState() => _MainButtonsState();
}

class _MainButtonsState extends State<MainButtons> {
  Widget _buildButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(
        text,
        style: GoogleFonts.comfortaa(
          textStyle: Theme.of(context).textTheme.displayLarge,
          fontSize: 38,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(context, "Yes I did!", Colors.green, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ReviewView(success: true)));
        }),
        const SizedBox(width: 20),
        _buildButton(context, "Not yet...", Colors.red, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ReviewView(success: false)));
        }),
      ],
    );
  }
}
