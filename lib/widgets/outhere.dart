import 'package:flutter/material.dart';
import 'package:outhere/widgets/calendarView/calendar_view.dart';
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
  @override
  Widget build(BuildContext context) {
    final appContext = Provider.of<AppContext>(context);
    final controller = PageController(initialPage: 0);

    Color bgColor = appContext.completed
        ? const Color.fromARGB(255, 73, 156, 100)
        : const Color.fromARGB(255, 43, 40, 40);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 43, 40, 40),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 43, 40, 40),
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
        body: PageView(
          controller: controller,
          reverse: true,
          children: [
            const MainView(),
            CalendarView(),
          ],
        ));
  }
}
