import 'dart:async';
import 'package:flutter/material.dart';

class TimerDialog extends StatefulWidget {
  final String title;

  const TimerDialog({super.key, required this.title});

  @override
  _TimerDialogState createState() => _TimerDialogState();
}

class _TimerDialogState extends State<TimerDialog> {
  Duration _duration = const Duration(minutes: 1); // Default duration
  Duration _remainingTime = const Duration(minutes: 1);
  Timer? _timer;
  bool _isRunning = false;

  int _selectedHours = 0;
  int _selectedMinutes = 1;
  int _selectedSeconds = 0;

  // Start the timer
  void _startTimer() {
    if (_remainingTime.inSeconds > 0) {
      _timer?.cancel();
      setState(() {
        _isRunning = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_remainingTime.inSeconds > 0) {
            _remainingTime -= const Duration(seconds: 1);
          } else {
            _timer?.cancel();
            _isRunning = false;
          }
        });
      });
    }
  }

  // Pause the timer
  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  // Reset the timer to the original duration
  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _remainingTime = _duration;
    });
  }

  // Stop and close the dialog
  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
    Navigator.of(context).pop();
  }

  // Set the custom time using dropdowns
  void _setCustomTime() {
    setState(() {
      _duration = Duration(
        hours: _selectedHours,
        minutes: _selectedMinutes,
        seconds: _selectedSeconds,
      );
      _remainingTime = _duration;
    });
    Navigator.of(context).pop(); // Close the dialog after setting time
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display remaining time
          Text(
            "${_remainingTime.inHours.toString().padLeft(2, '0')}:"
            "${(_remainingTime.inMinutes % 60).toString().padLeft(2, '0')}:"
            "${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}",
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _isRunning ? _pauseTimer : _startTimer,
                child: Text(_isRunning ? "Pause" : "Start"),
              ),
              ElevatedButton(
                onPressed: _resetTimer,
                child: const Text("Reset"),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Set Custom Time"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton<int>(
                              value: _selectedHours,
                              items: List.generate(
                                24,
                                (index) => DropdownMenuItem(
                                  value: index,
                                  child: Text("$index h"),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _selectedHours = value!;
                                });
                              },
                            ),
                            DropdownButton<int>(
                              value: _selectedMinutes,
                              items: List.generate(
                                60,
                                (index) => DropdownMenuItem(
                                  value: index,
                                  child: Text("$index m"),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _selectedMinutes = value!;
                                });
                              },
                            ),
                            DropdownButton<int>(
                              value: _selectedSeconds,
                              items: List.generate(
                                60,
                                (index) => DropdownMenuItem(
                                  value: index,
                                  child: Text("$index s"),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _selectedSeconds = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: _setCustomTime,
                        child: const Text("Set Time"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Set Time"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _stopTimer,
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
