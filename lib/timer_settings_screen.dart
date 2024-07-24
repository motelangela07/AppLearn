import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(TimerApp());

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerSettingsScreen(),
    );
  }
}

class TimerSettingsScreen extends StatefulWidget {
  @override
  _TimerSettingsScreenState createState() => _TimerSettingsScreenState();
}

class _TimerSettingsScreenState extends State<TimerSettingsScreen> {
  TextEditingController _hoursController = TextEditingController();
  TextEditingController _minutesController = TextEditingController();
  TextEditingController _secondsController = TextEditingController();
  Timer? _timer;
  Timer? _timeUpdater;
  int _remainingSeconds = 0;
  String _currentTime = "";

  @override
  void initState() {
    super.initState();
    _updateCurrentTime();
    _timeUpdater = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateCurrentTime();
    });
  }

  void _updateCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final period = now.hour >= 12 ? 'PM' : 'AM';
    final formattedTime =
        "$hour:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')} $period";
    setState(() {
      _currentTime = formattedTime;
    });
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    setState(() {
      int hours = int.tryParse(_hoursController.text) ?? 0;
      int minutes = int.tryParse(_minutesController.text) ?? 0;
      int seconds = int.tryParse(_secondsController.text) ?? 0;
      _remainingSeconds = hours * 3600 + minutes * 60 + seconds;
    });

    if (_remainingSeconds > 0) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_remainingSeconds > 0) {
            _remainingSeconds--;
          } else {
            timer.cancel();
            _showEndDialog();
          }
        });
      });
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Timer Started'),
        content: Text('Your timer has started.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showEndDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Timer Ended'),
        content: Text('The timer has finished.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetFields();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _resetFields() {
    setState(() {
      _hoursController.clear();
      _minutesController.clear();
      _secondsController.clear();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timeUpdater?.cancel();
    _hoursController.dispose();
    _minutesController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 96, 171, 233), // Blue color
              Color.fromARGB(255, 233, 132, 166), // Pink color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Timer Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.white),
                children: [
                  TextSpan(text: 'Current Time: '),
                  TextSpan(
                    text: _currentTime,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _hoursController,
                    decoration: InputDecoration(
                      labelText: 'Hours',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _minutesController,
                    decoration: InputDecoration(
                      labelText: 'Minutes',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _secondsController,
                    decoration: InputDecoration(
                      labelText: 'Seconds',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startTimer,
              child: Text('Start Timer'),
            ),
            SizedBox(height: 20),
            if (_remainingSeconds > 0)
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  children: [
                    TextSpan(text: 'Time remaining: '),
                    TextSpan(
                      text:
                          '${_remainingSeconds ~/ 3600}:${((_remainingSeconds % 3600) ~/ 60).toString().padLeft(2, '0')}:${(_remainingSeconds % 60).toString().padLeft(2, '0')}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
