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
  late Color bgColor = const Color.fromARGB(255, 43, 40, 40);
  late String message;

  @override
  void initState() {
    super.initState();

    final appContext = Provider.of<AppContext>(context, listen: false);

    if (appContext.completed) {
      bgColor = Colors.green;
      message = "Congratulations!";
    } else {
      bgColor = const Color.fromARGB(255, 24, 23, 23);
      message = "Maybe next time!";
    }
  }

  @override
  Widget build(BuildContext context) {
    final appContext = Provider.of<AppContext>(context);
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
