// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessForm extends StatefulWidget {
  const SuccessForm({Key? key}) : super(key: key);

  @override
  State<SuccessForm> createState() => _SuccessFormState();
}

class _SuccessFormState extends State<SuccessForm> {
  double _currentDoSliderValue = 5;
  double _currentFeelSliderValue = 5;
  String? _writtenPart = "";
  bool _likedTask = false;

  Map<double, String> sliderLabels = {
    0: "Could have been better",
    2: "I Can Overcome This!",
    4: "I'm Making Progress!",
    6: "I did OK",
    8: "I did great",
    10: "I did amazing!",
  };

  Map<double, String> sliderLabels2 = {
    0: "Not so good",
    2: "A bit anxious",
    4: "It was alright",
    6: "Mildly positive",
    8: "Happy and engaged",
    10: "Energized and enthusiastic!",
  };

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // * Editing Controller
    final TextEditingController firstNameController = TextEditingController();

    return Center(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 40, 14, 0),
              child: Center(
                child: Text(
                  "How did you do in your opinion?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Slider(
              value: _currentDoSliderValue,
              min: 0,
              max: 10,
              divisions: 5,
              activeColor: const Color.fromARGB(255, 51, 103, 151),
              label: sliderLabels[_currentDoSliderValue] ??
                  _currentDoSliderValue.toString(),
              onChanged: (double value) {
                setState(() {
                  _currentDoSliderValue = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 30, 14, 0),
              child: Center(
                child: Text(
                  "How did you feel when doing the task?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Slider(
              value: _currentFeelSliderValue,
              min: 0,
              max: 10,
              divisions: 5,
              activeColor: const Color.fromARGB(255, 51, 103, 151),
              label: sliderLabels2[_currentFeelSliderValue] ??
                  _currentFeelSliderValue.toString(),
              onChanged: (double value) {
                setState(() {
                  _currentFeelSliderValue = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Write a few words about the task",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.comfortaa(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    TextFormField(
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        firstNameController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Did you like the task?",
                      style: GoogleFonts.comfortaa(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Checkbox(
                      value: _likedTask,
                      onChanged: (bool? value) {
                        setState(() {
                          _likedTask = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 100, 14, 0),
              child: TextButton(
                onPressed: () {
                  _writtenPart = firstNameController.text;
                  print(_currentDoSliderValue);
                  print(_currentFeelSliderValue);
                  print(_writtenPart);
                  print(_likedTask);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 51, 103, 151)),
                child: Text(
                  "Submit",
                  style: GoogleFonts.comfortaa(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
