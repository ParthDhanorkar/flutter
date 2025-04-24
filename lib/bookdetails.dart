import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: BookForm()));

class BookForm extends StatefulWidget {
  @override
  _BookFormState createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('Book details', 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                ),
              ),
              SizedBox(height: 20),
              
              Text('Book Name'),
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
              
              Text('Author'),
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
              
              Text('Price'),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required field';
                  double? price = double.tryParse(value);
                  if (price == null) return 'Enter valid number';
                  if (price < 0) return 'Cannot be negative';
                  return null;
                },
              ),
              SizedBox(height: 10),
              
              Text('Quantity'),
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required field';
                  int? qty = int.tryParse(value);
                  if (qty == null) return 'Enter valid number';
                  if (qty < 0) return 'Cannot be negative';
                  return null;
                },
              ),
              SizedBox(height: 20),
              
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form submitted successfully!'))
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}