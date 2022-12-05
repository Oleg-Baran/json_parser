import 'package:flutter/material.dart';
import 'package:todo_app/data/dictionary.dart';
import 'package:todo_app/screens/lessons_screen/component/save_btn.dart';
import 'package:todo_app/screens/lessons_screen/lessons_screen_view_model.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/add_task_drawer.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../../widgets/tasks_appbar.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key, required this.lessons});
  final LessonsScreenViewModel lessons;

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: const CustAppBar(title: Dictionary.titleToDo),
      endDrawer: const CastDrawer(),
      body: listView(widget.lessons),
    );
  }

  ListView listView(LessonsScreenViewModel vm) {
    return ListView.builder(
      padding: const EdgeInsets.all(4),
      itemCount: vm.isEdit ? vm.lessonsList.length + 1 : vm.lessonsList.length,
      itemBuilder: (BuildContext context, int index) {
        return vm.isEdit
            ? index == vm.lessonsList.length
                ? SaveBtn(vm: vm)
                : ToDoItem(lessonsItem: vm.lessonsList[index], vm: vm)
            : ToDoItem(lessonsItem: vm.lessonsList[index], vm: vm);
      },
    );
  }
}
