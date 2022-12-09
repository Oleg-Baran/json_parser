import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/service/getDataFromJson.dart';
import 'package:todo_app/util/constants.dart';

import 'screens/lessons_screen/cubit/lessons_screen_cubit.dart';
import 'util/auto_routes.gr.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => LessonsPageCubit(DataResponse())..getLessons(),
      child: const MyApp(),
    ),
  );
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: mainColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
