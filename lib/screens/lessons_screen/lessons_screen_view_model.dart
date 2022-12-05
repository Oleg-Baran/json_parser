import 'package:flutter/material.dart';
import 'package:todo_app/data/models/lessons.dart';
import 'package:todo_app/helpers/getDataFromJson.dart';

class LessonsScreenViewModel with ChangeNotifier {
  bool isEdit = false;
  List<LessonsItem> lessonsList = [];

  Future<void> getLessons() async {
    final response = await DataResponse().getLessonItemsFromJsonFile();
    lessonsList.addAll(response);
    notifyListeners();
  }

  addItem(LessonsItem lessonItem) {
    lessonsList.add(lessonItem);
    notifyListeners();
  }

  remove(LessonsItem item) {
    lessonsList.remove(item);
    notifyListeners();
  }

  setCompleteItem(LessonsItem lessonsItem) {
    lessonsItem.complete = !lessonsItem.complete!;
    notifyListeners();
  }

  setCheckItem(LessonsItem lessonsItem) {
    lessonsItem.isChecked = !lessonsItem.isChecked!;
    notifyListeners();
  }

  isAllCheckedFalse() {
    if (lessonsList.every((element) => element.isChecked == false)) {
      editMode(mode: false);
    }
  }

  void editMode({required bool mode, LessonsItem? lessonsItem}) {
    isEdit = mode;
    modeTrue() {
      lessonsItem?.isChecked = true;
      for (var element in lessonsList) {
        element.isEdit = mode;
      }
    }

    modeFalse() {
      for (var element in lessonsList) {
        element.isEdit = mode;
      }
    }

    mode ? modeTrue() : modeFalse();
    notifyListeners();
  }
}
