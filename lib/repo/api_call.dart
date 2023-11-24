import 'dart:convert';

import 'package:api_demo/model/book.dart';
import 'package:api_demo/model/post_model.dart';
import 'package:api_demo/utls/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  static Future<BookModel> getData() async {
    var url = Uri.parse(getApiUrl);
    http.Response response = await http.get(url);
    print(response.statusCode);
    debugPrint(BookModel.fromMap(jsonDecode(response.body)).toString());

    if (response.statusCode == 200) {
      return BookModel.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  static Future<Post> postData() async {
    var url = Uri.parse(postApiUrl);

    Post post = Post(
      userId: 1002,
      id: 1,
      title: 'vishnu@gmail.com',
      body: '12345678',
    );

    var postResponse = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toMap()),
    );

    print(postResponse.body);
    print(postResponse.statusCode);

    if (postResponse.statusCode == 201) {
      return Post.fromMap(jsonDecode(postResponse.body));
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  static Future<Item> getDataByid(String id) async {
    var url = Uri.parse('$getByIdUrl/$id');
    http.Response response = await http.get(url);
    print(response.statusCode);
    debugPrint(Item.fromMap(jsonDecode(response.body)).toString());

    if (response.statusCode == 200) {
      return Item.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
