// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/lessons.dart';
import '../../../service/getDataFromJson.dart';

part 'lessons_screen_state.dart';

class LessonsPageCubit extends Cubit<LessonsScreenState> {
  LessonsPageCubit(this.service) : super(LessonsScreenState());
  final DataResponse service;

  bool isEdit = false;
  List<LessonsItem> lessonsList = [];

  Future<void> getLessons() async {
    try {
      emit(LessonsScreenState(viewState: ViewState.loading));
      await Future.delayed(const Duration(seconds: 1));
      final response = await DataResponse().getLessonItemsFromJsonFile();
      lessonsList.addAll(response);
      print(lessonsList);
      emit(LessonsScreenState(
          viewState: ViewState.loaded, lessonsList: lessonsList));
    } catch (e) {
      print(e);
      emit(LessonsScreenState(viewState: ViewState.error));
    }
  }

  addItem(LessonsItem lessonItem) {
    try {
      emit(LessonsScreenState(viewState: ViewState.loading));
      lessonsList.add(lessonItem);
      emit(LessonsScreenState(
          viewState: ViewState.loaded, lessonsList: lessonsList));
    } catch (e) {
      emit(LessonsScreenState(viewState: ViewState.error));
    }
  }

  remove(LessonsItem item) {
    try {
      lessonsList.remove(item);
      emit(LessonsScreenState(
          viewState: ViewState.loaded, lessonsList: lessonsList));
    } catch (e) {
      emit(LessonsScreenState(viewState: ViewState.error));
    }
  }

  setCompleteItem(LessonsItem lessonsItem) {
    try {
      lessonsItem.complete = !lessonsItem.complete!;
      emit(LessonsScreenState(
          viewState: ViewState.loaded, lessonsList: lessonsList));
    } catch (e) {
      print(e);
      emit(LessonsScreenState(viewState: ViewState.error));
    }
  }

  setCheckItem(LessonsItem lessonsItem) {
    try {
      lessonsItem.isChecked = !lessonsItem.isChecked!;
      emit(LessonsScreenState(
          viewState: ViewState.loaded, lessonsList: lessonsList));
    } catch (e) {
      print(e);
      emit(LessonsScreenState(viewState: ViewState.error));
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
        emit(LessonsScreenState(
            viewState: ViewState.loaded, lessonsList: lessonsList));
      } catch (e) {
        print(e);
        emit(LessonsScreenState(viewState: ViewState.error));
      }
    }

    modeFalse() {
      try {
        emit(LessonsScreenState(
            viewState: ViewState.loaded, lessonsList: lessonsList));
      } catch (e) {
        print(e);
        emit(LessonsScreenState(viewState: ViewState.error));
      }
    }

    mode ? modeTrue() : modeFalse();
  }
}
