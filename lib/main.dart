import 'package:flutter/material.dart';
import 'package:outhere/widgets/outhere.dart';
import 'package:provider/provider.dart';

import 'package:outhere/data/context.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: AppContext(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Your App',
      home: Outhere(),
    );
  }
}
