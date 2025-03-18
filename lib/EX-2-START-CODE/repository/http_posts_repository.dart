import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:w6_flutter/EX-2-START-CODE/repository/post_repository.dart';
import '../model/post.dart';

class HttpPostRepository implements PostRepository {

  @override
  Future<List<Post>> getPost() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      // Parse response into post
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => fromJson(json)).toList();// return a list of post by function Post fromJson
    } else {
      throw Exception('Failed to load post: ${response.statusCode}');
    }
  }
  
  // function to convert json to post
  Post fromJson(Map<String, dynamic> json) {
    assert(json['id'] is int);
    assert(json['title'] is String);
    assert(json['body'] is String);

    return Post(
      id: json['id'],
      title: json['title'],
      description: json['body'],
    );
  }
}