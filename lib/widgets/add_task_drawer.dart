// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/dictionary.dart';

import '../screens/lessons_screen/lessons_screen_view_model.dart';
import '../util/constants.dart';
import '../util/common.dart';
import 'app_button.dart';

class CastDrawer extends StatefulWidget {
  const CastDrawer({super.key});

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  State<CastDrawer> createState() => _CastDrawerState();
}

class _CastDrawerState extends State<CastDrawer> {
  final titleController = TextEditingController();
  bool _isTitleEditedAfterSubmit = false;
  final _formKey = GlobalKey<FormState>();

  void readCtx(BuildContext context, LessonsScreenViewModel lessons) {
    if (titleController.text.trim() == '') {
      titleController.text = Dictionary.newTask;
    }
    // todo: add item to list
    lessons.addItem(Common.getRandomItem(titleController.text));
    titleController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final LessonsScreenViewModel lessons = Provider.of<LessonsScreenViewModel>(context);
    return InkWell(
      onTap: () => Common.hideKeyboard(context),
      child: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: mainColor,
              ),
              child: Center(
                child: Text(
                  Dictionary.addTask,
                  textAlign: TextAlign.center,
                  style: CastDrawer.optionStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: titleController,
                  validator: ((value) => _isTitleEditedAfterSubmit
                      ? null
                      : Dictionary.fieldInfoForUser),
                  onChanged: (v) => {
                    if (v == '' && v.trim().isEmpty)
                      {setState(() => _isTitleEditedAfterSubmit = false)}
                    else
                      {setState(() => _isTitleEditedAfterSubmit = true)}
                  },
                  onEditingComplete: () => _formKey.currentState!.validate()
                      ? readCtx(context, lessons)
                      : null,
                  maxLength: 30,
                  decoration:
                      Common.getInputDecoration(Dictionary.enterTitleTask),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: CastButton(
                text: Dictionary.saveTask,
                buttonAction: () =>
                    _formKey.currentState!.validate() ? readCtx(context, lessons) : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}