import 'dart:io';

void main() {
  print('Enter a sentence:');
  String? sentence = stdin.readLineSync();
  
  if (sentence != null && sentence.isNotEmpty) {
    print('\nResults:');
    print('Number of characters: ${countCharacters(sentence)}');
    print('Number of words: ${countWords(sentence)}');
    print('Reversed sentence: ${reverseString(sentence)}');
  } else {
    print('No input provided!');
  }
}

// Function to count characters in a sentence
int countCharacters(String text) {
  return text.length;
}

// Function to count words in a sentence
int countWords(String text) {
  // Trim the text and split by whitespace
  List<String> words = text.trim().split(RegExp(r'\s+'));
  // Handle the case where there's only whitespace
  return words[0].isEmpty ? 0 : words.length;
}

// Function to reverse a sentence
String reverseString(String text) {
  return String.fromCharCodes(text.runes.toList().reversed);
}