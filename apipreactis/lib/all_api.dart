import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import './post.dart';
import './newApi/postnew.dart';
import './newApi/new.dart';

class ALLApi {
  Future<Post?> getSinglePostWithModle() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        Post model = Post.fromJson(json.decode(res.body));
        return model;
      } else {
        debugPrint('Failed to fetch post. Status code: ${res.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<dynamic> fetchPost() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return json.decode(res.body);
      } else {
        debugPrint('Failed to fetch post. Status code: ${res.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<PostNew>?> multi() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return List<PostNew>.from(
            json.decode(res.body).map((x) => PostNew.fromJson(x)));
      } else {
        debugPrint('Failed to fetch post. Status code: ${res.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> newAll() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(res.body));
      } else {
        debugPrint('Failed to fetch post. Status code: ${res.statusCode}');
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
    return null;
  }

  final String accessKey =
      'XozpjdPlBpmKs0Y3sA1UvFOG61DtCXZSvuHxSjU_sSE'; // Replace with your actual access key
  final String baseUrl = 'https://api.unsplash.com/photos/';

  Future<List<dynamic>?> ImageS(int page, int perPage) async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl?page=$page&per_page=$perPage'),
        headers: {
          'Authorization': 'Client-ID $accessKey',
        },
      );
      if (res.statusCode == 200) {
        return json.decode(res.body);
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }

  Future<List<PostI>?> NEWE() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return List<PostI>.from(
            json.decode(res.body).map((x) => PostNew.fromJson(x)));
      } else {
        debugPrint('Failed to fetch post. Status code: ${res.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
