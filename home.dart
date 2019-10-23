import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'chat.dart';
import 'sidebar_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  SidebarDrawer drawer = new SidebarDrawer(Page.CHAT);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ChatPage(),
      drawer: drawer.getDrawer()
    );
  }
}