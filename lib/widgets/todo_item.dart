import 'package:flutter/material.dart';

import '../models/lessons.dart';
import '../screens/detail_screen.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.lessonsItem,
  });
  final LessonsItem lessonsItem;

  Icon _getIconsForItem(String itemLvl) {
    switch (itemLvl) {
      case "Beginner":
        return const Icon(
              size: 40, Icons.ac_unit_rounded, color: Colors.white);
      case "Intermediate":
        return const Icon(
              size: 40, Icons.camera, color: Colors.white);
      case "Advanced":
        return const Icon(
              size: 40, Icons.account_balance_sharp, color: Colors.white);
      default:
        return const Icon(
              size: 40, Icons.car_rental, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, 0.9)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: _getIconsForItem(lessonsItem.level ?? "Beginner"),
          ),
          title: Text(
            lessonsItem.title ?? "Title",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: LinearProgressIndicator(
                      value: lessonsItem.indicatorValue ?? 0.0,
                      backgroundColor: const Color.fromRGBO(209, 224, 224, 0.2),
                      valueColor: const AlwaysStoppedAnimation(Colors.amber))),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(lessonsItem.level ?? "Level",
                        style: const TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing: const Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(lesson: lessonsItem)));
          },
        ),
      ),
    );
  }
}
