// temperature_page.dart
import 'package:flutter/material.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final _temperatureController = TextEditingController();
  double _result = 0;
  bool _isCelsiusToFahrenheit = true;

  void _convertTemperature() {
    if (_temperatureController.text.isEmpty) return;
    
    try {
      final temperature = double.parse(_temperatureController.text);
      setState(() {
        if (_isCelsiusToFahrenheit) {
          // C to F: (C × 9/5) + 32
          _result = (temperature * 9 / 5) + 32;
        } else {
          // F to C: (F − 32) × 5/9
          _result = (temperature - 32) * 5 / 9;
        }
      });
    } catch (e) {
      // Simple error handling
      setState(() {
        _result = 0;
      });
    }
  }

  @override
  void dispose() {
    _temperatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('C to F'),
                    value: true,
                    groupValue: _isCelsiusToFahrenheit,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          _isCelsiusToFahrenheit = value;
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('F to C'),
                    value: false,
                    groupValue: _isCelsiusToFahrenheit,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          _isCelsiusToFahrenheit = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            TextField(
              controller: _temperatureController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: _isCelsiusToFahrenheit ? 'Enter °C' : 'Enter °F',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              'Result: ${_result.toStringAsFixed(2)} ${_isCelsiusToFahrenheit ? '°F' : '°C'}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/age');
              },
              child: const Text('Go to Age Calculator'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}