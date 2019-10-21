import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'profile.dart';
import 'chat.dart';
import 'settings.dart';

enum Page {
  PROFILE,
  CHAT,
  SETTINGS
}

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  Page currentPage = Page.CHAT;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ChatPage(),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Profile'),
              onTap: () {
                if (currentPage == Page.PROFILE)
                  return;
                
                currentPage = Page.PROFILE;

                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              title: Text('Chat'),
              onTap: () {
                if (currentPage == Page.CHAT)
                  return;
                
                currentPage = Page.CHAT;

                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                if (currentPage == Page.SETTINGS)
                  return;
                
                currentPage = Page.SETTINGS;

                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            )
          ],
        ),
      )
    );
  }
}