// first_screen.dart
import 'package:flutter/material.dart';
import 'main.dart';
//import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final StudentInfo studentInfo = StudentInfo();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = studentInfo.name;
    mobileController.text = studentInfo.mobile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                studentInfo.name = nameController.text;
                studentInfo.mobile = mobileController.text;
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}