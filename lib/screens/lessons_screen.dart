import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../helpers/getDataFromJson.dart';
import '../models/lessons.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  Future<List<LessonsItem>> getDataFromJsonFile =
      DataResponse().getLessonItemsFromJsonFile();
  final List<LessonsItem> lessons = [];

  @override
  void initState() {
    getDataFromJsonFile.then((value) => setState(() {
          lessons.addAll(value);
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(4),
      itemCount: lessons.length,
      itemBuilder: (BuildContext context, int index) {
        return ToDoItem(lessonsItem: lessons[index]);
      },
    );
  }
}
