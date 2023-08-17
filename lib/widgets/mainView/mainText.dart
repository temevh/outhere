import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('dd/MM/yyyy');
final todaysDate = formatter.format(DateTime.now());

class MainText extends StatelessWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 59, 59, 59),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'Daily task $todaysDate',
            style: GoogleFonts.comfortaa(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            'Talk to 3 new people',
            style: GoogleFonts.comfortaa(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 38,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          const SizedBox(height: 30),
          Text(
            'Sociability',
            style: GoogleFonts.comfortaa(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 119, 115, 115)),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
