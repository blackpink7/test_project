import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/main.dart';
import 'package:test_project/providers/news_provider.dart';
import 'package:test_project/screens/news_detail_screen.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('News List'),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) => provider.searchNews(value),
                    decoration: InputDecoration(
                      hintText: 'Search news...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            body: provider.isConnected
                ? (provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : RefreshIndicator(
              onRefresh: provider.fetchNews,
              child: ListView.builder(
                itemCount: provider.filteredNews.length,
                itemBuilder: (context, index) {
                  final news = provider.filteredNews[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(
                        news['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Text(
                        news['body'].substring(0, 100) + '...',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailScreen(news: news),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ))
                : Center(child: Text('No internet connection. Please try again.')),
          );
        },
      ),
    );
  }
}