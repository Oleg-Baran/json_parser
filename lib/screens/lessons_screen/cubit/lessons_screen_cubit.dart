// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/lessons.dart';
import '../../../service/getDataFromJson.dart';

part 'lessons_screen_state.dart';

class LessonsScreenCubit extends Cubit<LessonsScreenState> {
  LessonsScreenCubit(this.service) : super(LessonsScreenInitial());
  final DataResponse service;

  bool isEdit = false;
  List<LessonsItem> lessonsList = [];

  Future<void> getLessons() async {
    try {
      emit(LessonsScreenLoading());
      final response = await DataResponse().getLessonItemsFromJsonFile();
      print(response);
      lessonsList.addAll(response);
      emit(LessonsScreenLoaded(lessonsList: lessonsList));
    } catch (e) {
      print(e);
      emit(LessonsScreenError());
    }
  }

  addItem(LessonsItem lessonItem) {
    try {
      lessonsList.add(lessonItem);
      emit(LessonsScreenLoaded(lessonsList: lessonsList));
    } catch (e) {
      emit(LessonsScreenError());
    }
  }

  remove(LessonsItem item) {
    try {
      lessonsList.remove(item);
      emit(LessonsScreenLoaded(lessonsList: lessonsList));
    } catch (e) {
      emit(LessonsScreenError());
    }
  }

  setCompleteItem(LessonsItem lessonsItem) {
    try {
      lessonsItem.complete = !lessonsItem.complete!;
      emit(LessonsScreenLoaded(lessonsList: lessonsList));
    } catch (e) {
      print(e);
      emit(LessonsScreenError());
    }
  }

  setCheckItem(LessonsItem lessonsItem) {
    try {
      lessonsItem.isChecked = !lessonsItem.isChecked!;
      emit(LessonsScreenLoaded(lessonsList: lessonsList));
    } catch (e) {
      print(e);
      emit(LessonsScreenError());
    }
  }

  isAllCheckedFalse() {
    if (lessonsList.every((element) => element.isChecked == false)) {
      editMode(mode: false);
    }
  }

  void editMode({required bool mode, LessonsItem? lessonsItem}) {
    isEdit = mode;

    modeTrue() {
      try {
        lessonsItem?.isChecked = true;
        for (var element in lessonsList) {
          element.isEdit = mode;
        }
        emit(LessonsScreenLoaded(lessonsList: lessonsList));
      } catch (e) {
        print(e);
        emit(LessonsScreenError());
      }
    }

    modeFalse() {
      try {
        for (var element in lessonsList) {
          element.isEdit = mode;
        }
        emit(LessonsScreenLoaded(lessonsList: lessonsList));
      } catch (e) {
        print(e);
        emit(LessonsScreenError());
      }
    }

    mode ? modeTrue() : modeFalse();
  }
}
