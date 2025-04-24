import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _input = '';
  double _num1 = 0;
  String _operand = '';
  bool _operandClicked = false;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _input = '';
        _num1 = 0;
        _operand = '';
        _operandClicked = false;
      } else if (buttonText == '+' || buttonText == '-' || 
                buttonText == '×' || buttonText == '÷') {
        if (_input != '') {
          _num1 = double.parse(_input);
          _operand = buttonText;
          _operandClicked = true;
          _input = '';
          _output = _num1.toString() + ' ' + _operand;
        }
      } else if (buttonText == '=') {
        if (_input != '' && _operand != '') {
          double num2 = double.parse(_input);
          double result = 0;
          
          switch (_operand) {
            case '+':
              result = _num1 + num2;
              break;
            case '-':
              result = _num1 - num2;
              break;
            case '×':
              result = _num1 * num2;
              break;
            case '÷':
              if (num2 != 0) {
                result = _num1 / num2;
              } else {
                _output = 'Error';
                _input = '';
                return;
              }
              break;
          }
          
          _output = '$_num1 $_operand $num2 = ${result.toString()}';
          _input = result.toString();
          _operand = '';
        }
      } else {
        if (_operandClicked) {
          _input = buttonText;
          _operandClicked = false;
        } else {
          _input += buttonText;
        }
        _output = _input;
      }
    });
  }

  Widget _buildButton(String buttonText, {Color color = Colors.white70}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.all(24.0),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.bottomRight,
            child: Text(
              _output,
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(thickness: 2),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('÷', color: Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('×', color: Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-', color: Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('C', color: Colors.red),
                    _buildButton('0'),
                    _buildButton('=', color: Colors.green),
                    _buildButton('+', color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}