import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FailureForm extends StatefulWidget {
  const FailureForm({super.key});

  @override
  State<FailureForm> createState() => _FailureFormState();
}

class _FailureFormState extends State<FailureForm> {
  String? _selectedReason = "";
  String? _writtenPart = "";
  bool _likedTask = false;

  List<String> reasons = <String>[
    "Was too hard",
    "Didn't have time",
    "Felt uncomfortable",
  ];

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController firstNameController = TextEditingController();
    String dropdownValue = reasons.first;

    return Center(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(14, 30, 14, 0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: reasons.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 100, 14, 0),
              child: TextButton(
                onPressed: () {
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
