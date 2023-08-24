import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outhere/data/context.dart';

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
  String _selectedReason = "";
  String _writtenPart = "";
  bool _retryTask = false;
  @override
  Widget build(BuildContext context) {
    final appContext = Provider.of<AppContext>(context, listen: false);
    final formKey = GlobalKey<FormState>();
    final TextEditingController firstNameController = TextEditingController();

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
                ReasonDropDown(
                  onReasonSelected: (value) {
                    setState(() {
                      _selectedReason = value;
                    });
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  "How could you ensure that you succeed next time?",
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
                ),
                const SizedBox(height: 60),
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
                      value: _retryTask,
                      onChanged: (bool? value) {
                        setState(() {
                          _retryTask = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 180),
                TextButton(
                  onPressed: () {
                    _writtenPart = firstNameController.text;
                    appContext.completed = false;
                    print(appContext.completed);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReasonDropDown extends StatefulWidget {
  final ValueChanged<String> onReasonSelected;

  const ReasonDropDown({
    Key? key,
    required this.onReasonSelected,
  }) : super(key: key);

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
            widget.onReasonSelected(value!);
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
