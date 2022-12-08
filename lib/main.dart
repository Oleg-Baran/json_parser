import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/service/getDataFromJson.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/navigation/navigation_container.dart';

import 'screens/lessons_screen/cubit/lessons_screen_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LessonsScreenCubit>(
            create: (context) =>
                LessonsScreenCubit(DataResponse())..getLessons()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: mainColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const NavigationContainer(),
    );
  }
}
