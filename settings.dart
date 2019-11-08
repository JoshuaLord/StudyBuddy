import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'sidebar_drawer.dart';

class SettingsPage extends StatefulWidget {
  State createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  SidebarDrawer sidebarDrawer = new SidebarDrawer(Page.SETTINGS);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings")
      ),
      drawer: sidebarDrawer.getDrawer()
    );
  }
}