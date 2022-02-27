import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class suggetionPage extends StatefulWidget {
  @override
  State<suggetionPage> createState() => _suggetionPage();
}

class _suggetionPage extends State<suggetionPage> {
  var control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggestion Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: control,
              decoration: InputDecoration(
                labelText: 'Comment',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {
                _showDialog(context);
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text('Comment'),
            content: Text('Do you want to leave Message  '),
            actions: [
              TextButton(
                onPressed: () {
                  control.text = "";
                  Navigator.of(context).pop();
                },
                child: Text(
                  'YES',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'NO',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
