import 'dart:io';

void main() {
  print('Simple Calculator');
  print('------------------');
  
  while (true) {
    print('\nEnter an operation (example: 5 + 3, or type "exit" to quit):');
    String? input = stdin.readLineSync();
    
    if (input == null || input.toLowerCase() == 'exit') {
      print('Calculator closed.');
      break;
    }
    
    try {
      // Parse input
      input = input.trim();
      List<String> parts = input.split(' ');
      
      if (parts.length != 3) {
        print('Invalid format. Please use: number operator number');
        continue;
      }
      
      double num1 = double.parse(parts[0]);
      String operator = parts[1];
      double num2 = double.parse(parts[2]);
      double result;
      
      // Perform operation
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            print('Error: Division by zero');
            continue;
          }
          result = num1 / num2;
          break;
        default:
          print('Invalid operator. Use +, -, *, or /');
          continue;
      }
      
      // Display result
      print('$num1 $operator $num2 = $result');
      
    } catch (e) {
      print('Error: Invalid input');
    }
  }
}