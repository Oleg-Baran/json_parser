import 'package:flutter/material.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/data/dictionary.dart';
import 'package:todo_app/util/common.dart';
import 'package:todo_app/widgets/item_progress_indicatod.dart';

import '../data/models/lessons.dart';
import '../screens/detail_screen/detail_screen.dart';
import '../screens/lessons_screen/cubit/lessons_screen_cubit.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key, required this.lessonsItem, required this.lessonsScreenCubit});
  final LessonsItem lessonsItem;
  final LessonsScreenCubit lessonsScreenCubit;
  //final LessonsScreenViewModel vm;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  // InkWell(
  @override
  Widget build(BuildContext context) {
    bool editMode = widget.lessonsItem.isEdit!;
    // --- Card
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 25),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete_sweep_outlined,
          size: 40,
          color: redColor,
        ),
      ),
      onDismissed: (direction) {
        // Remove the item from the data source.
          widget.lessonsScreenCubit.remove(widget.lessonsItem);
        //-- Show a snackbar.
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Task deleted')));
      },
      //-- Set logic for useractions
      child: InkWell(
        onDoubleTap: () {
          widget.lessonsScreenCubit.setCompleteItem(widget.lessonsItem);
        },
        onLongPress: () {
          if (editMode == false) {
            editMode = !editMode;
            widget.lessonsScreenCubit.editMode(mode: editMode, lessonsItem: widget.lessonsItem);
          } else {
            widget.lessonsScreenCubit.setCheckItem(widget.lessonsItem);
            widget.lessonsScreenCubit.isAllCheckedFalse();
          }
        },
        // -- Card
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          // --- Container
          child: Container(
            decoration: BoxDecoration(
                color: widget.lessonsItem.complete! ? itemColor : unCompleteItemColor),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              // -- Item Icon (start)
              leading: Container(
                padding: const EdgeInsets.only(right: 12),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24))),
                //-- Edit Mode: CheckBox | Icon
                child: widget.lessonsItem.isEdit!
                    ? Checkbox(
                        activeColor: mainColor,
                        value: widget.lessonsItem.isChecked,
                        onChanged: (_) {},
                      )
                    : Common.getIconsForItem(
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
                      child: AppProgressIndicator(
                          indicatorValue: widget.lessonsItem.indicatorValue)),
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
                    builder: (context) => DetailPage(lesson: widget.lessonsItem),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
