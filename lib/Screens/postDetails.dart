import 'package:firstproject/Screens/widget/mycard.dart';
import 'package:firstproject/models/post.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatefulWidget {
  Post post;
  PostDetails(this.post);
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: ListView(
        children: [
          MyCard(
            content: "UserID:${widget.post.userId}",
          ),
          InkWell(
            child: Text("ID : ${widget.post.id}"),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Text("Title : ${widget.post.title}"),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Text("Body : ${widget.post.body}"),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
