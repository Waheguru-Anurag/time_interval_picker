import 'package:flutter/material.dart';
import 'package:time_interval_picker/time_interval_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Interval Picker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: const ColorScheme.light(
        primary: Colors.blue,
        background: Colors.white,
      )).copyWith(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Time Interval Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: TimeIntervalPicker(
          endLimit: null,
          startLimit: null,
          onChanged: (DateTime? startTime, DateTime? endTime, bool isAllDay) {
            print(startTime);
            print(endTime);
            print(isAllDay);
          },
        ),
      ),
    );
  }
}
