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

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  late LessonsPageCubit cubit;

  @override
  void initState() {
    cubit = context.read<LessonsPageCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: const CustAppBar(title: Dictionary.titleToDo),
      endDrawer: const CastDrawer(),
      //body: listView(widget.viewModel),
      body: BlocBuilder<LessonsPageCubit, LessonsScreenState>(
        builder: (context, state) {
          if (state.viewState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: secondaryColor,
              ),
            );
          } else if (state.viewState.isError) {
            return const Center(
              child: Icon(
                Icons.error_outline,
                color: redColor,
                size: 40,
              ),
            );
          } else if (state.viewState.isLoaded) {
            final lessonsList = state.lessonsList;
            return listView(lessonsList, cubit);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  ListView listView(List<LessonsItem> lessonsList, LessonsPageCubit cubit) {
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
