import 'package:flutter/material.dart';

 import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jsonplaceholder/Domain/Models/posts_model.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
