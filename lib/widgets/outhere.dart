import 'package:flutter/material.dart';
import 'package:outhere/widgets/mainView/main_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Outhere extends StatefulWidget {
  const Outhere({super.key});

  @override
  State<Outhere> createState() => _OuthereState();
}

class _OuthereState extends State<Outhere> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 23, 23),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
        elevation: 1,
        title: Text(
          'OUTHERE',
          style: GoogleFonts.comfortaa(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
      body: const Column(
        children: [
          MainView(),
        ],
      ),
    );
  }
}
