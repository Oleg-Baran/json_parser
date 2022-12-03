import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/data/dictionary.dart';
import 'package:todo_app/util/common.dart';

import '../data/models/lessons.dart';
import '../screens/detail_screen.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key, required this.lessonsItem});
  final LessonsItem lessonsItem;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  void changeBgColor() {
    setState(() {
      widget.lessonsItem.complete = false;
    });
  }

  // InkWell(
  @override
  Widget build(BuildContext context) {
    // --- Card
    return InkWell(
      onDoubleTap: () {
        changeBgColor();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        // --- Container
        child: Container(
          decoration: BoxDecoration(
              color: widget.lessonsItem.complete!
                  ? itemColor
                  : unCompleteItemColor),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            // -- Item Icon (start)
            leading: Container(
              padding: const EdgeInsets.only(right: 12),
              decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Colors.white24))),
              child: Common.getIconsForItem(
                  widget.lessonsItem.level ?? Dictionary.lvlBeginner),
            ),
            // --- ToDo Title
            title: Text(
              widget.lessonsItem.title ?? Dictionary.newTask,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // --- Progress & Level
            subtitle: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: LinearProgressIndicator(
                        value: widget.lessonsItem.indicatorValue ?? 0.0,
                        backgroundColor: progressLineBackgroundColor,
                        valueColor:
                            const AlwaysStoppedAnimation(secondaryColor))),
                Expanded(
                  flex: 4,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(widget.lessonsItem.level ?? Dictionary.lvl,
                          style: const TextStyle(color: Colors.white))),
                )
              ],
            ),
            // --- Arrow Right Icon
            trailing: const Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0),
            // --- Open DetailPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(lesson: widget.lessonsItem)));
            },
          ),
        ),
      ),
    );
  }
}
