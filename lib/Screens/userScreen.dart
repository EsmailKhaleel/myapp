import 'package:firstproject/Screens/userDetails.dart';
import 'package:firstproject/Screens/widget/mycard.dart';
import 'package:firstproject/Service/userService.dart';
import 'package:firstproject/models/user.dart';
import 'package:firstproject/utilities.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool loading = true;
  List<User> users = [];

  getuserlist() async {
    users = await UserService().getUsers();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getuserlist();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Screen"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      pushPage(context, UserDetails(users[index]));
                    },
                    child: MyCard(content: "${users[index].name}"),
                  ),
                );
              },
            ),
    );
  }
}
