import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FailureForm extends StatefulWidget {
  const FailureForm({super.key});

  @override
  State<FailureForm> createState() => _FailureFormState();
}

List<String> list = <String>[
  "Was too hard",
  "Didn't have time",
  "Felt uncomfortable",
  "Lacked motivation",
  "Unforeseen circumstances",
  "Other"
];

class _FailureFormState extends State<FailureForm> {
  final String _selectedReason = "";
  final String _writtenPart = "";
  bool _likedTask = false;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController firstNameController = TextEditingController();
    String dropdownValue = list.first;

    return Center(
      child: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 30, 14, 20),
            child: Column(
              children: [
                Text(
                  "Why do you think todays tasks didn't go as planned?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 14),
                const ReasonDropDown(),
                TextButton(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        "Would you like to try this task again?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReasonDropDown extends StatefulWidget {
  const ReasonDropDown({super.key});

  @override
  State<ReasonDropDown> createState() => _ReasonDropDownState();
}

class _ReasonDropDownState extends State<ReasonDropDown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      child: DropdownMenu<String>(
        initialSelection: list.first,
        onSelected: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}
