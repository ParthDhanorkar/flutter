import 'dart:io';

void main() {
  print('Enter a list of integers (separated by spaces):');
  String? input = stdin.readLineSync();
  
  if (input != null && input.isNotEmpty) {
    try {
      List<int> numbers = input
          .trim()
          .split(RegExp(r'\s+'))
          .map((e) => int.parse(e))
          .toList();
          
      if (numbers.isEmpty) {
        print('No numbers provided!');
        return;
      }
      
      print('\nResults:');
      print('Total: ${calculateTotal(numbers)}');
      print('Highest number: ${findHighest(numbers)}');
      print('Lowest number: ${findLowest(numbers)}');
      print('Average: ${calculateAverage(numbers)}');
      print('Median: ${calculateMedian(numbers)}');
    } catch (e) {
      print('Invalid input! Please enter integers separated by spaces.');
    }
  } else {
    print('No input provided!');
  }
}

// Function to calculate the total of all numbers
int calculateTotal(List<int> numbers) {
  return numbers.fold(0, (sum, number) => sum + number);
}

// Function to find the highest number
int findHighest(List<int> numbers) {
  return numbers.reduce((value, element) => value > element ? value : element);
}

// Function to find the lowest number
int findLowest(List<int> numbers) {
  return numbers.reduce((value, element) => value < element ? value : element);
}

// Function to calculate the average
double calculateAverage(List<int> numbers) {
  return calculateTotal(numbers) / numbers.length;
}

// Function to calculate the median
double calculateMedian(List<int> numbers) {
  // Create a sorted copy of the list
  List<int> sortedNumbers = List.from(numbers)..sort();
  
  if (sortedNumbers.length % 2 == 1) {
    // Odd number of elements - return the middle one
    return sortedNumbers[sortedNumbers.length ~/ 2].toDouble();
  } else {
    // Even number of elements - return average of the two middle ones
    int middle1 = sortedNumbers[(sortedNumbers.length ~/ 2) - 1];
    int middle2 = sortedNumbers[sortedNumbers.length ~/ 2];
    return (middle1 + middle2) / 2;
  }
}