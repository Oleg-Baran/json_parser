import 'package:flutter/material.dart';
import 'package:todo_app/screens/lessons_screen/lessons_screen_view_model.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/data/dictionary.dart';
import 'package:todo_app/util/common.dart';
import 'package:todo_app/widgets/item_progress_indicatod.dart';

import '../data/models/lessons.dart';
import '../screens/detail_screen/detail_screen.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.lessonsItem, required this.vm});
  final LessonsItem lessonsItem;
  final LessonsScreenViewModel vm;

  // InkWell(
  @override
  Widget build(BuildContext context) {
    bool editMode = lessonsItem.isEdit!;
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
          vm.remove(lessonsItem);
        //-- Show a snackbar.
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Task deleted')));
      },
      //-- Set logic for useractions
      child: InkWell(
        onDoubleTap: () {
          vm.setCompleteItem(lessonsItem);
        },
        onLongPress: () {
          if (editMode == false) {
            editMode = !editMode;
            vm.editMode(mode: editMode, lessonsItem: lessonsItem);
          } else {
            vm.setCheckItem(lessonsItem);
            vm.isAllCheckedFalse();
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
                color: lessonsItem.complete! ? itemColor : unCompleteItemColor),
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
                child: lessonsItem.isEdit!
                    ? Checkbox(
                        activeColor: mainColor,
                        value: lessonsItem.isChecked,
                        onChanged: (_) {},
                      )
                    : Common.getIconsForItem(
                        lessonsItem.level ?? Dictionary.lvlBeginner),
              ),
              // --- ToDo Title
              title: Text(
                lessonsItem.title ?? Dictionary.newTask,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              // --- Progress & Level
              subtitle: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: AppProgressIndicator(
                          indicatorValue: lessonsItem.indicatorValue)),
                  Expanded(
                    flex: 4,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(lessonsItem.level ?? Dictionary.lvl,
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
                    builder: (context) => DetailPage(lesson: lessonsItem),
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
