import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:outhere/data/tasks.dart';
import 'package:provider/provider.dart';

import 'package:outhere/widgets/mainView/main_image.dart';
import 'package:outhere/widgets/mainView/main_text.dart';
import 'package:outhere/widgets/mainView/main_buttons.dart';
import 'package:outhere/data/context.dart';

var rng = Random();

var completed = false;

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var indexNumber = rng.nextInt(tasks.length);
    var amountNumber = rng.nextInt(4) + 1;

    final appContext = Provider.of<AppContext>(context);

    if (!appContext.completed) {
      return Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            MainImage(indexNumber: indexNumber),
            const SizedBox(height: 40),
            MainText(indexNumber: indexNumber, amountNumber: amountNumber),
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
    } else {
      return Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            MainImage(indexNumber: indexNumber),
            const SizedBox(height: 40),
            MainText(indexNumber: indexNumber, amountNumber: amountNumber),
            const SizedBox(height: 20),
            Text(
              'Task completed!',
              style: GoogleFonts.comfortaa(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(height: 25),
            Text(
              'Come back tomorrow!',
              style: GoogleFonts.comfortaa(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ],
        ),
      );
    }
  }
}
