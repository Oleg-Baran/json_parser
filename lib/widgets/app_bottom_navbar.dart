import 'package:flutter/material.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/data/dictionary.dart';

class CustBottomNavBar extends StatelessWidget {
  const CustBottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});
  final int selectedIndex;
  final void Function(int i) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.book_outlined),
        label: Dictionary.underScores,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month_outlined),
        label: Dictionary.underScores,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.money),
        label: Dictionary.underScores,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        label: Dictionary.underScores,
      ),
    ],
    currentIndex: selectedIndex,
    type: BottomNavigationBarType.fixed,
    iconSize: 26,
    unselectedItemColor: unselectedColor,
    backgroundColor: mainColor,
    selectedItemColor: secondaryColor,
    showUnselectedLabels: false,
    selectedLabelStyle:
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    onTap: onItemTapped,
  );
  }
}
