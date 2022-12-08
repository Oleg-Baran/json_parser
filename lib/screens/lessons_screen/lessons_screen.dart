import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/dictionary.dart';
import 'package:todo_app/screens/lessons_screen/component/save_btn.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/add_task_drawer.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../../data/models/lessons.dart';
import '../../widgets/tasks_appbar.dart';
import 'cubit/lessons_screen_cubit.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  late LessonsScreenCubit cubit;

  @override
  void initState() {
    cubit = context.read<LessonsScreenCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: const CustAppBar(title: Dictionary.titleToDo),
      endDrawer: const CastDrawer(),
      //body: listView(widget.viewModel),
      body: BlocBuilder<LessonsScreenCubit, LessonsScreenState>(
        builder: (context, state) {
          if (state is LessonsScreenLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LessonsScreenError) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LessonsScreenLoaded) {
            final lessonsList = state.lessonsList;
            return listView(lessonsList, cubit);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  ListView listView(List<LessonsItem> lessonsList, LessonsScreenCubit cubit) {
    return ListView.builder(
      padding: const EdgeInsets.all(4),
      itemCount: cubit.isEdit
          ? cubit.lessonsList.length + 1
          : cubit.lessonsList.length,
      itemBuilder: (BuildContext context, int index) {
        return cubit.isEdit
            ? index == cubit.lessonsList.length
                ? SaveBtn(cubit: cubit)
                : ToDoItem(
                    lessonsItem: cubit.lessonsList[index],
                    lessonsScreenCubit: cubit,
                  )
            : ToDoItem(
                lessonsItem: cubit.lessonsList[index],
                lessonsScreenCubit: cubit,
              );
      },
    );
  }
}
