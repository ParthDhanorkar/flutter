// second_screen.dart
import 'package:flutter/material.dart';
import 'main.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final StudentInfo studentInfo = StudentInfo();
  final addressController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressController.text = studentInfo.address;
    cityController.text = studentInfo.city;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                studentInfo.address = addressController.text;
                studentInfo.city = cityController.text;
                Navigator.pushNamed(context, '/third');
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}