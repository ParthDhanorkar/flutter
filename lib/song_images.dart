import 'package:flutter/material.dart';

void main() {
  runApp(const SongListApp());
}

class SongListApp extends StatelessWidget {
  const SongListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Song List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SongListScreen(),
    );
  }
}

class Song {
  final String name;
  final String singer;
  final String category;
  final String imageUrl;

  Song({
    required this.name, 
    required this.singer, 
    required this.category,
    required this.imageUrl,
  });
}

class SongListScreen extends StatelessWidget {
  const SongListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample song list data with image URLs
    final songs = [
      Song(
        name: "Shape of You", 
        singer: "Ed Sheeran", 
        category: "Pop",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273ba5db46f4b838ef6027e6f96",
      ),
      Song(
        name: "Blinding Lights", 
        singer: "The Weeknd", 
        category: "R&B",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36",
      ),
      Song(
        name: "Bad Guy", 
        singer: "Billie Eilish", 
        category: "Alternative",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b2732a038d3bf875d23e4aeaa84e",
      ),
      Song(
        name: "Dance Monkey", 
        singer: "Tones and I", 
        category: "Pop",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273c6f7af36cae6fa3ac5c37aade",
      ),
      Song(
        name: "Uptown Funk", 
        singer: "Mark Ronson ft. Bruno Mars", 
        category: "Funk",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273e011aa57be5bd117d5d3acc3",
      ),
      Song(
        name: "Bohemian Rhapsody", 
        singer: "Queen", 
        category: "Rock",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273e8b066f70c206551210d902b",
      ),
      Song(
        name: "Old Town Road", 
        singer: "Lil Nas X", 
        category: "Hip Hop",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273c0e7bf5cdd630f314f20586a",
      ),
      Song(
        name: "See You Again", 
        singer: "Wiz Khalifa ft. Charlie Puth", 
        category: "Hip Hop",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273a7ea08ab3914c5fb2084a8af",
      ),
      Song(
        name: "Despacito", 
        singer: "Luis Fonsi ft. Daddy Yankee", 
        category: "Latin",
        imageUrl: "https://i.scdn.co/image/ab67616d0000b273ef0d4234e1a645740f77d59c",
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Song List'),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Song image with network image
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    songs[index].imageUrl,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    // Add placeholder and error handling
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 120,
                        height: 120,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text('Image Error'),
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 120,
                        height: 120,
                        color: Colors.grey[200],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Song details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        songs[index].singer,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        songs[index].category,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
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