import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: StudentForm()));

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text('Book details', 
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Name field
                  Text('Name'),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Required field';
                      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value))
                        return 'Only letters allowed';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  
                  // Subject field
                  Text('Subject'),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Required field';
                      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value))
                        return 'Only letters allowed';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  
                  // Category radio buttons
                  Text('category'),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'TW',
                        groupValue: _selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      Text('TW'),
                      SizedBox(width: 10),
                      
                      Radio<String>(
                        value: 'IA',
                        groupValue: _selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      Text('IA'),
                      SizedBox(width: 10),
                      
                      Radio<String>(
                        value: 'Or',
                        groupValue: _selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      Text('Or'),
                    ],
                  ),
                  SizedBox(height: 10),
                  
                  // Marks field
                  Text('Marks'),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Required field';
                      int? marks = int.tryParse(value);
                      if (marks == null) return 'Enter valid number';
                      if (marks < 0) return 'Marks cannot be negative';
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  
                  // Submit button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_selectedCategory == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please select a category'))
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Form submitted successfully!'))
                            );
                          }
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}