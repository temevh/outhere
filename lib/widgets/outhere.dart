import 'package:flutter/material.dart';
import 'package:outhere/widgets/main_view.dart';

class Outhere extends StatefulWidget {
  const Outhere({super.key});

  @override
  State<Outhere> createState() => _OuthereState();
}

class _OuthereState extends State<Outhere> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 33, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
        elevation: 1,
        title: const Text(
          "OUTHERE",
          style: TextStyle(fontSize: 34),
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
