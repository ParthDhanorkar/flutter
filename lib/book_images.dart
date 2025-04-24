import 'package:flutter/material.dart';

void main() {
  runApp(const BookListApp());
}

class BookListApp extends StatelessWidget {
  const BookListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const BookListScreen(),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String price;
  final String imageUrl;
  
  Book({
    required this.title, 
    required this.author, 
    required this.price,
    required this.imageUrl,
  });
}

class BookListScreen extends StatelessWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample book list data with image URLs
    final books = [
      Book(
        title: "To Kill a Mockingbird", 
        author: "Harper Lee", 
        price: "\$12.99",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273ba5db46f4b838ef6027e6f96",
      ),
      Book(
        title: "1984", 
        author: "George Orwell", 
        price: "\$10.50",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36",
      ),
      Book(
        title: "The Great Gatsby", 
        author: "F. Scott Fitzgerald", 
        price: "\$9.99",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b2732a038d3bf875d23e4aeaa84e",
      ),
      Book(
        title: "Harry Potter and the Sorcerer's Stone", 
        author: "J.K. Rowling", 
        price: "\$15.99",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273c6f7af36cae6fa3ac5c37aade",
      ),
      Book(
        title: "The Hobbit", 
        author: "J.R.R. Tolkien", 
        price: "\$11.99",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273e011aa57be5bd117d5d3acc3",
      ),
      Book(
        title: "Pride and Prejudice", 
        author: "Jane Austen", 
        price: "\$8.50",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273e8b066f70c206551210d902b",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Book cover image with network image
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    books[index].imageUrl,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                    // Add placeholder and error handling
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 150,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text('Cover Not Available'),
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 100,
                        height: 150,
                        color: Colors.grey[200],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Book details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        books[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "by ${books[index].author}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        books[index].price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Add a buy button
                      ElevatedButton(
                        onPressed: () {
                          // Show a simple snackbar when button is pressed
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Added ${books[index].title} to cart!"),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}