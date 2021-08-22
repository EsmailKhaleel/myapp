import 'package:firstproject/Screens/mapScreen.dart';
import 'package:firstproject/Screens/widget/mycard.dart';
import 'package:firstproject/models/user.dart';
import 'package:firstproject/utilities.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  User user;
  UserDetails(this.user);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          MyCard(
            content: "${widget.user.name}",
          ),
          InkWell(
            onTap: () {
              LaunchURL("mailto:${widget.user.email}");
            },
            child: Text("Email: ${widget.user.email}"),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              LaunchURL("tel:${widget.user.phone}");
            },
            child: Text("phone: ${widget.user.phone}"),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              LaunchURL("https://${widget.user.website}");
            },
            child: Text("website:${widget.user.website}"),
          ),
          MaterialButton(
            onPressed: () {
              pushPage(
                  context,
                  MapSample(
                    userLocation: widget.user.address.geo,
                  ));
            },
            child: Text("User Location"),
          ),
        ],
      ),
    );
  }
}
