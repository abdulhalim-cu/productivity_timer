import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:productivity_timer/timer.dart';
import 'package:productivity_timer/timer_model.dart';
import 'package:productivity_timer/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productivity Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatelessWidget {
  final CountDownTimer timer = CountDownTimer();
  final double defaultPadding = 5.0;
  @override
  Widget build(BuildContext context) {
    timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Work Time'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double availableWidth = constraints.maxWidth;
          return Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xFF009688), text: 'Work', onPressed: () => timer.startWork(), size: null)),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xFF607D88),
                          text: 'Short Break',
                          onPressed: () => timer.startBreak(true),
                          size: null)),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xFF455A64),
                          text: 'Long Break',
                          onPressed: () => timer.startBreak(false),
                          size: null)),
                ],
              ),
              StreamBuilder(
                  initialData: "00:00",
                  stream: timer.stream(),
                  builder: (context, snapshot) {
                    TimerModel timer =
                        (snapshot.data == "00:00") ? TimerModel(time: "00:00", percent: 1) : snapshot.data;
                    return Expanded(
                      child: CircularPercentIndicator(
                        radius: availableWidth / 2,
                        percent: timer.percent,
                        progressColor: Color(0xFF009546),
                        lineWidth: 10.0,
                        center: Text(
                          timer.time,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    );
                  }),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xFF009688), text: 'Stop', onPressed: () => timer.stopTimer(), size: null)),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xFF607D88), text: 'Restart', onPressed: () => timer.startTimer(), size: null)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
