import 'package:flutter/material.dart';
import 'package:outhere/data/tasks.dart';

class MainImage extends StatelessWidget {
  final int indexNumber;
  const MainImage({super.key, required this.indexNumber});

  @override
  Widget build(BuildContext context) {
    var path = tasks[indexNumber].path;
    return Image.asset(
      path,
      height: 320,
    );
  }
}
