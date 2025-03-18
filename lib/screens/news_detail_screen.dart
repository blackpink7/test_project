import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final Map<String, dynamic> news;

  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news['title'])),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(news['title'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(news['body']),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}