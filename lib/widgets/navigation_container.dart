import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/lessons_screen/lessons_screen_view_model.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/data/dictionary.dart';
import 'package:todo_app/data/models/lessons.dart';
import 'package:todo_app/widgets/app_bottom_navbar.dart';
import 'package:todo_app/screens/lessons_screen/lessons_screen.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  final List<LessonsItem> lessons = [];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  List<Widget> _widgetOptions(BuildContext ctx) {
    LessonsScreenViewModel viemModel = Provider.of<LessonsScreenViewModel>(ctx);
    return [
      //-- 1 Tab
      LessonsScreen(
        lessons: viemModel,
      ),
      //-- 2 Tab
      const Text(
        Dictionary.willBeAddedLater,
        style: optionStyle,
      ),
      //-- 3 Tab
      const Text(
        Dictionary.willBeAddedLater,
        style: optionStyle,
      ),
      //-- 4 Tab
      const Text(
        Dictionary.willBeAddedLater,
        style: optionStyle,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ----
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: _widgetOptions(context).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}