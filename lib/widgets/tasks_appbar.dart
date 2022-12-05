import 'package:flutter/material.dart';

class CustAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
    elevation: 0.1,
    backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
    title: Text(title),
  );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50);
}
