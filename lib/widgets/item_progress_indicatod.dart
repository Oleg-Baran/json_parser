import 'package:flutter/material.dart';

import '../util/constants.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({super.key, required this.indicatorValue});
  final double? indicatorValue;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
        value: indicatorValue ?? 0.0,
        backgroundColor: progressLineBackgroundColor,
        valueColor: const AlwaysStoppedAnimation(secondaryColor));
  }
}
