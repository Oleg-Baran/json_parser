import 'package:flutter/material.dart';

import '../lessons_screen_view_model.dart';

class SaveBtn extends StatelessWidget {
  const SaveBtn({super.key, required this.vm});
  final LessonsScreenViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: SizedBox(
          width: 90,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              vm.editMode(mode: false);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
