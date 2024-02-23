import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_widget_demo/home_widget_config.dart';
import 'package:home_widget_demo/views/dashboard/timer_screen.dart';
import 'package:workmanager/workmanager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? countdownTimer;
  int timerValue = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeWidgetConfig.initialize().then((value) async {
        startTimer();
        HomeWidgetConfig.update(context, timerValue.toString());
      });
    });
    registerBackgroundTask(timerValue);

    super.initState();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          timerValue++;
        });
        HomeWidgetConfig.update(context, timerValue.toString());
        registerBackgroundTask(timerValue);
      },
    );
  }

  void registerBackgroundTask(int timerValue) {
    Workmanager().registerPeriodicTask(
      'backgroundTask',
      'updateTimerValue',
      frequency: const Duration(seconds: 1),
      inputData: {'timerValue': timerValue.toString()},
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimerContainer(
              timer: timerValue.toString(),
            )
          ],
        ),
      ),
    );
  }
}
