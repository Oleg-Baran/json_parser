import 'package:flutter/material.dart';

BottomNavigationBar custBottomNavbar(int selectedIndex, void Function(int i) onItemTapped) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.book_outlined),
        label: '___',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month_outlined),
        label: '___',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.money),
        label: '___',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        label: '___',
      ),
    ],
    currentIndex: selectedIndex,
    type: BottomNavigationBarType.fixed,
    iconSize: 26,
    unselectedItemColor: const Color.fromRGBO(190, 190, 190, 1),
    backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
    selectedItemColor: Colors.amber,
    showUnselectedLabels: false,
    selectedLabelStyle:
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    onTap: onItemTapped,
  );
}
