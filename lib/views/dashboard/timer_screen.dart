import 'package:flutter/material.dart';

class TimerContainer extends StatelessWidget {
  final String timer;
  const TimerContainer({super.key, required this.timer});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.shade800
                : const Color(0xffddf4e2),
            spreadRadius: 35,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade600
              : Colors.green,
        ),
      ),
      child: GestureDetector(
        child: Text(
          timer,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
