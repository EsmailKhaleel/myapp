import 'package:firstproject/models/post.dart';
import 'package:dio/dio.dart';

class PostService {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String posts = "posts";

  Future<List<Post>> getPosts() async {
    List<Post> postsList = [];
    Dio dio = new Dio();
    Response response = await dio.get("$baseUrl"+"$posts");
    var data = response.data;
    data.forEach((postItem) {
      Post post = Post.fromJson(postItem);
      postsList.add(post);
    });
    return postsList;
  }
}