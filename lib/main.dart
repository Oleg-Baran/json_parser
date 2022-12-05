import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/lessons_screen/lessons_screen_view_model.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/navigation_container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LessonsScreenViewModel>(
      create: (context) {
        return LessonsScreenViewModel();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: mainColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const NavigationContainer(),
      ),
    );
  }
}
