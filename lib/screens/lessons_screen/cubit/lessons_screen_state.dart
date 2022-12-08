part of 'lessons_screen_cubit.dart';

abstract class LessonsScreenState {}

class LessonsScreenInitial extends LessonsScreenState {
  List<Object> get props => [];
}

class LessonsScreenLoading extends LessonsScreenState {
  List<Object> get props => [];
}

class LessonsScreenLoaded extends LessonsScreenState {
  LessonsScreenLoaded({required this.lessonsList});

  final List<LessonsItem> lessonsList;

  List<Object> get props => [lessonsList];
}

class LessonsScreenError extends LessonsScreenState {
  List<Object> get props => [];
}