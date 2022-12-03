import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/custDrawer.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../data/models/lessons.dart';
import '../helpers/getDataFromJson.dart';
import '../widgets/cust_appbar.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});
  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  //List<LessonsItem> lessons = [];
  late Stream<List<LessonsItem>> lessonsList;
  late StreamController<List<LessonsItem>> controller;

  @override
  void initState() {
    super.initState();
    lessonsList = (() {
      controller = StreamController<List<LessonsItem>>.broadcast(
        onListen: () async {
          List<LessonsItem> data =
              await DataResponse().getLessonItemsFromJsonFile();
          controller.add(data);
        },
      );
      return controller.stream;
    })();
  }

  @override
  Widget build(BuildContext context) {
    //lessons = context.read<List<LessonsItem>>();
    return StreamBuilder<List<LessonsItem>>(
      stream: lessonsList,
      builder:
          (BuildContext context, AsyncSnapshot<List<LessonsItem>> snapshot) {
        if (snapshot.hasError) {
          return const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          );
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Icon(
                Icons.info,
                color: Colors.blue,
                size: 60,
              );
            case ConnectionState.waiting:
              return const SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return const Center(
                child:  Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 60,
                ),
              );
            case ConnectionState.active:
              if (!snapshot.hasData) {
                return const Center(
                    child: Text(
                  'No Available Data',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ));
              }
              //lessons = snapshot.data!;
              return Scaffold(
                backgroundColor: mainColor,
                appBar: const CustAppBar(title: 'Tasks'),
                endDrawer: CastDrawer(
                    toDoList: snapshot.data!, controller: controller),
                body: listView(snapshot.data!),
              );
          }
        }
      },
    );
  }

  ListView listView(List<LessonsItem> lessonsList) {
    return ListView.builder(
      padding: const EdgeInsets.all(4),
      itemCount: lessonsList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = lessonsList[index];
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
            setState(() {
              lessonsList.removeAt(index);
            });
            // Then show a snackbar.

            // ScaffoldMessenger.of(context)
            //     .showSnackBar(const SnackBar(content: Text('Task dismissed')));
          },
          child: ToDoItem(lessonsItem: item),
        );
      },
    );
  }
}
