// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CastButton extends StatefulWidget {
  const CastButton({
    super.key,
    required this.text,
    required this.buttonAction,
  });

  final String text;
  final Function() buttonAction;

  @override
  State<CastButton> createState() => _CastButtonState();
}

class _CastButtonState extends State<CastButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: widget.buttonAction,
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => const Color.fromRGBO(58, 66, 86, 1),
          ),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
