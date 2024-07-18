import 'package:flutter/material.dart';

class SetTimeReminderScreen extends StatefulWidget {
  @override
  _SetTimeReminderScreenState createState() => _SetTimeReminderScreenState();
}

class _SetTimeReminderScreenState extends State<SetTimeReminderScreen> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _setAlarm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alarm Set'),
          content: Text('Alarm set for ${_selectedTime.format(context)}'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Time Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected time: ${_selectedTime.format(context)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Pick Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _setAlarm,
              child: Text('Set Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
