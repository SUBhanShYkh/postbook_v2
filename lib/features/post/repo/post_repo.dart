import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:postbook_v2/features/post/model/post_model.dart';

class PostRepo {
  final String uRL = "https://jsonplaceholder.typicode.com/posts";
  Future<List<PostModel>> getPosts() async {
    final response = await http.get(Uri.parse(uRL));
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      List<PostModel> posts = list.map((e) => PostModel.fromJson(e)).toList();
      for (var comment in posts) {
        comment.comments = await countComments(comment.id);
      }
      return posts;
    } else {
      throw Exception("Something went wrong!!!");
    }
  }

  Future<int> countComments(int postId) async {
    final String uRL =
        "https://jsonplaceholder.typicode.com/posts/$postId/comments";
    final response = await http.get(Uri.parse(uRL));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.length;
    } else {
      throw Exception("Something Went Wrong");
    }
  }
}
