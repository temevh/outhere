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
          Navigator.push(context, _createRoute(true));
        }),
        const SizedBox(width: 20),
        _buildButton(context, "Not yet...", Colors.red, () {
          Navigator.push(context, _createRoute(false));
        }),
      ],
    );
  }

  Route _createRoute(bool successParam) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ReviewView(success: successParam),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
