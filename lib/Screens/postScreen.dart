import 'package:firstproject/Screens/postDetails.dart';
import 'package:firstproject/Screens/widget/mycard.dart';
import 'package:firstproject/Service/postService.dart';
import 'package:firstproject/models/post.dart';
import 'package:firstproject/utilities.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool loading = true;
  List<Post> posts = [];

  getpostlist() async {
    posts = await PostService().getPosts();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getpostlist();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
      ),
      body: loading? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:InkWell(
                    onTap:(){
                     pushPage(context,PostDetails(posts[index]));
                     },
                     child: MyCard(content: "${posts[index].userId}"),
                ),
                );
              },
            ),
    );
  }
}
