// age_calculator_page.dart
import 'package:flutter/material.dart';

class AgeCalculatorPage extends StatefulWidget {
  const AgeCalculatorPage({Key? key}) : super(key: key);

  @override
  State<AgeCalculatorPage> createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  DateTime _selectedDate = DateTime.now();
  int _years = 0;
  int _months = 0;
  int _days = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _calculateAge();
      });
    }
  }

  void _calculateAge() {
    final now = DateTime.now();
    
    int years = now.year - _selectedDate.year;
    int months = now.month - _selectedDate.month;
    int days = now.day - _selectedDate.day;
    
    if (days < 0) {
      months--;
      days += DateTime(now.year, now.month - 1, 0).day;
    }
    
    if (months < 0) {
      years--;
      months += 12;
    }
    
    setState(() {
      _years = years;
      _months = months;
      _days = days;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Birth Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Birth Date'),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Age: $_years years, $_months months, $_days days',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/temperature');
              },
              child: const Text('Go to Temperature Converter'),
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