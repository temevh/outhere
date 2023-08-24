import 'package:flutter/material.dart';
import 'package:outhere/widgets/mainView/main_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:outhere/data/context.dart';

class Outhere extends StatefulWidget {
  const Outhere({super.key});

  @override
  State<Outhere> createState() => _OuthereState();
}

class _OuthereState extends State<Outhere> {
  late String message;

  @override
  Widget build(BuildContext context) {
    final appContext = Provider.of<AppContext>(context);

    Color bgColor = appContext.completed
        ? Colors.green
        : const Color.fromARGB(255, 43, 40, 40);
    message = appContext.completed ? "Congratulations!" : "Maybe next time!";

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 1,
        title: Center(
          child: Text(
            'OUTHERE',
            style: GoogleFonts.comfortaa(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
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
