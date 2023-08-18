import 'package:flutter/material.dart';

class ReviewForms extends StatefulWidget {
  const ReviewForms({super.key});

  @override
  State<ReviewForms> createState() => _ReviewFormsState();
}

class _ReviewFormsState extends State<ReviewForms> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            value: _currentSliderValue,
            max: 10,
            divisions: 2,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            })
      ],
    );
  }
}
