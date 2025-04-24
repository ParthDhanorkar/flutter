import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookListApp(),
    ));

class Book {
  final String name;
  final String author;
  final String price;

  Book({required this.name, required this.author, required this.price});
}

class BookListApp extends StatelessWidget {
  // Sample book data
  final List<Book> books = [
    Book(name: "Flutter Development", author: "John Smith", price: "\$29.99"),
    Book(name: "Dart Programming", author: "Emily Johnson", price: "\$24.99"),
    Book(name: "Mobile App Design", author: "David Brown", price: "\$19.99"),
    Book(name: "UI/UX Principles", author: "Sarah Wilson", price: "\$34.99"),
    Book(name: "Flutter State Management", author: "Michael Davis", price: "\$27.99"),
    Book(name: "Flutter for Beginners", author: "Jessica Miller", price: "\$22.99"),
    Book(name: "Advanced Flutter", author: "Robert Taylor", price: "\$39.99"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Book details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    ...books.map((book) => BookCard(book: book)).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book image placeholder
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                'Book Image',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(width: 16),
          // Book details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  book.author,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  book.price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}