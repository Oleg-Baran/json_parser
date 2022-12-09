part of 'lessons_screen_cubit.dart';

enum ViewState { initial, loading, loaded, error }

extension WatchViewState on ViewState {
  bool get isInitial => this == ViewState.initial;
  bool get isLoading => this == ViewState.loading;
  bool get isLoaded => this == ViewState.loaded;
  bool get isError => this == ViewState.error;
}

class LessonsScreenState {
  LessonsScreenState(
      {this.viewState = ViewState.initial, List<LessonsItem>? lessonsList}) {
    this.lessonsList = lessonsList ?? [];
  }
  late final List<LessonsItem> lessonsList;
  final ViewState viewState;

  List<Object> get property => [lessonsList];
}