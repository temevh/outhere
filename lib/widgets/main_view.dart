import 'package:flutter/material.dart';
import 'package:outhere/widgets/mainView/mainImage.dart';
import 'package:outhere/widgets/mainView/mainText.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 70),
          MainImage(),
          SizedBox(height: 40),
          MainText(),
        ],
      ),
    );
  }
}
