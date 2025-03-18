import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier {
  List<dynamic> _news = [];
  List<dynamic> _filteredNews = [];
  bool _isLoading = true;
  bool _isConnected = true;

  List<dynamic> get news => _news;
  List<dynamic> get filteredNews => _filteredNews;
  bool get isLoading => _isLoading;
  bool get isConnected => _isConnected;

  NewsProvider() {
    checkConnection();
  }

  Future<void> checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _isConnected = connectivityResult != ConnectivityResult.none;
    if (_isConnected) {
      fetchNews();
    }
    notifyListeners();
  }

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      _news = json.decode(response.body);
      _filteredNews = _news;
    }
    _isLoading = false;
    notifyListeners();
  }

  void searchNews(String query) {
    if (query.isEmpty) {
      _filteredNews = _news;
    } else {
      _filteredNews = _news.where((news) => news['title'].toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }
}