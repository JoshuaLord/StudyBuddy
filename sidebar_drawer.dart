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

class SidebarDrawer {
  Widget drawer;
  Page currentPage;

  SidebarDrawer(Page page) {
    currentPage = page;
  }

  void initDrawer() {
    drawer = Builder(builder: (context) =>
    Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Profile'),
              onTap: () {
                if (currentPage == Page.PROFILE)
                  return;

                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              title: Text('Chat'),
              onTap: () {
                if (currentPage == Page.CHAT)
                  return;

                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                if (currentPage == Page.SETTINGS)
                  return;

                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            )
          ],
        ),
      )
    );
  }

  Widget getDrawer() {
    initDrawer();
    return drawer;
  }
}