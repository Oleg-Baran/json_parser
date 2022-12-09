import 'package:flutter/material.dart';
import 'package:todo_app/screens/lessons_screen/cubit/lessons_screen_cubit.dart';

class SaveBtn extends StatelessWidget {
  const SaveBtn({super.key, required this.cubit});
  final LessonsPageCubit cubit;

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
              cubit.editMode(mode: false);
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
