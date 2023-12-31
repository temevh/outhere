import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:outhere/data/context.dart';

import 'package:outhere/data/tasks.dart';

final formatter = DateFormat('dd/MM/yyyy');
final todaysDate = formatter.format(DateTime.now());

class MainText extends StatelessWidget {
  final int indexNumber;
  final int amountNumber;

  const MainText(
      {Key? key, required this.indexNumber, required this.amountNumber})
      : super(key: key);

  Widget _buildHeading(BuildContext context, String text, Color color) {
    return Text(
      text,
      style: GoogleFonts.comfortaa(
        textStyle: Theme.of(context).textTheme.displayLarge,
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }

  Widget _buildSubHeading(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.comfortaa(
        textStyle: Theme.of(context).textTheme.displayLarge,
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appContext = Provider.of<AppContext>(context, listen: false);
    var selectedTask = tasks[indexNumber];

    var dynamicTaskTitle = selectedTask.name.replaceFirst('x', '$amountNumber');
    var categoryString = selectedTask.category;

    Color bgColor = appContext.completed
        ? Colors.green
        : const Color.fromARGB(255, 59, 59, 59);
    return SizedBox(
      width: 350,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            _buildHeading(context, 'Daily task $todaysDate', Colors.white),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                child: _buildSubHeading(context, dynamicTaskTitle),
              ),
            ),
            const SizedBox(height: 30),
            _buildHeading(context, categoryString,
                const Color.fromARGB(255, 119, 115, 115)),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
