import 'package:flutter/material.dart';
import 'package:project2/project2/options/suggetionPage.dart';
import 'ratingPage.dart';
import '../menu.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(70.0),
            child: Text('Quick Menu'),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
              title: Text('GoBack to Menu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => indexPage()),
                );
              }),
          ListTile(
              title: Text('Rating My App'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ratingPage()),
                );
              }),
          ListTile(
              title: Text('Suggestion Box'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => suggetionPage()),
                );
              }),
        ],
      ),
    );
  }
}
