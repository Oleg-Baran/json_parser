// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/data/dictionary.dart';

import '../constants.dart';
import '../data/models/lessons.dart';
import '../util/common.dart';
import 'custButton.dart';

class CastDrawer extends StatefulWidget {
  const CastDrawer(
      {super.key, required this.toDoList, required this.controller});
  final List<LessonsItem> toDoList;
  final StreamController<List<LessonsItem>> controller;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  State<CastDrawer> createState() => _CastDrawerState();
}

class _CastDrawerState extends State<CastDrawer> {
  final titleController = TextEditingController();

  bool _isTitleEditedAfterSubmit = false;
  final _formKey = GlobalKey<FormState>();

  void readCtx(BuildContext context) {
    if (titleController.text.trim() == '') {
      titleController.text = Dictionary.newTask;
    }
    widget.controller.sink
        .add(widget.toDoList..add(Common.getRandomItem(titleController.text)));

    titleController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
                    if (v == '' && v.trim().isEmpty) {
                        setState(() => _isTitleEditedAfterSubmit = false)
                    } else {
                      setState(() => _isTitleEditedAfterSubmit = true)
                    }
                  },
                  onEditingComplete: () => _formKey.currentState!.validate()
                      ? readCtx(context)
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
                buttonAction: () => _formKey.currentState!.validate()
                      ? readCtx(context)
                      : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
