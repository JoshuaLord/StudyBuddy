import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Home",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ChatroomWidget(),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Chat'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      )
    );
  }
}

class ChatroomWidget extends StatefulWidget {
  ChatroomState createState() => new ChatroomState();
}

class ChatroomState extends State<ChatroomWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  _loadMore() {
    setState(() {
      print('loading more,...');
      //if we're at the end of the list, add more items
      _listViewData..addAll(List<String>.from(_listViewData));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<String> _listViewData = [
    "Inducesmile.com",
    "Flutter Dev",
    "Android Dev",
    "iOS Dev!",
    "React Native Dev!",
    "React Dev!",
    "express Dev!",
    "Laravel Dev!",
    "Angular Dev!",
    "Adonis Dev!",
    "Next.js Dev!",
    "Node.js Dev!",
    "Vue.js Dev!",
    "Java Dev!",
    "C# Dev!",
    "C++ Dev!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: Text('Chat'),
      ),
      body: ListView.builder(
        itemCount: _listViewData.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_listViewData[index]),
          );
        },
      ),
    );
  }
}