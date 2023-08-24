import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outhere/widgets/reviewView/failure_forms.dart';
import 'package:outhere/widgets/reviewView/success_forms.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({
    Key? key,
    required this.success,
  }) : super(key: key);
  final bool success;

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  late Color bgColor;
  late String message;

  @override
  void initState() {
    super.initState();
    bgColor = widget.success ? Colors.green : Colors.redAccent;
    message = widget.success ? "Congratulations!" : "Maybe next time!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: Center(
        child: Column(children: [
          const SizedBox(height: 100),
          Text(
            message,
            textAlign: TextAlign.end,
            style: GoogleFonts.comfortaa(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 38,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          widget.success ? const SuccessForm() : const FailureForm(),
        ]),
      ),
    );
  }
}
