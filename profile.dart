import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:interface_build/sidebar_drawer.dart';

class ProfilePage extends StatefulWidget {
  State createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  SidebarDrawer sidebarDrawer = new SidebarDrawer(Page.PROFILE);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile")
      ),
      drawer: sidebarDrawer.getDrawer()
    );
  }
}