import 'package:flutter/material.dart';
import 'package:todo_app/screens/navigation_container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(58, 66, 86, 1.0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const NavigationContainer(),
    );
  }
}
