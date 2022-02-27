import 'package:flutter/material.dart';
import 'package:project2/project2/options/sidebar.dart';
import '../options/sidebar.dart';
import 'dart:async';

class his10 extends StatefulWidget {
  final String text;

  const his10({required this.text});

  @override
  State<his10> createState() => _his10State();
}

class _his10State extends State<his10> {
  Future getData() async {
    await Future.delayed(Duration(seconds: 1));
    return "https://github.com/EthanNah";
  }

  bool backColor = false;
  int count = 3;

  @override
  void initState() {
    super.initState();
    for (int i = count; i > 0; i--)
      Future.delayed(Duration(seconds: i), () {
        setState(() {
          count--;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor ? Colors.blueGrey : Colors.black,
      appBar: AppBar(
        title: Text(widget.text),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Text('Dark Mode'),
          Switch(
            value: backColor,
            onChanged: (bool newValue) {
              setState(() {
                backColor = newValue;
              });
            },
            activeColor: Colors.blueGrey,
          ),
        ],
      ),
      drawer: SideBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Git-Hub Link");
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(snapshot.data.toString());
                    }
                    return Text("something went wrong");
                  }),
              count > 0 ? Text(count.toString()) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
