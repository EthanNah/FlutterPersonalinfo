import 'package:flutter/material.dart';
import 'variable.dart';
import 'options/sidebar.dart';
import 'menu.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget {
  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  //key for form's Status
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //making Controller for Name and Age
  TextEditingController nameController = new TextEditingController();

  //Call When _myHomePageState remove
  @override
  void dispose() {
    //Remove TextEditingController and assigned Listener
    nameController.dispose();

    super.dispose();
  }

  @override
  bool backColor = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backColor ? Colors.blueGrey : Colors.black,
        appBar: AppBar(
          title: Text('Welcome'),
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

        //TextField For input User's Name
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text("Your Name  :)",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  //Assign Name of User
                  TextFormField(
                    controller: nameController,
                    onChanged: (newValue) => nickname = newValue,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return " Type Your Nick Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ex) Mario',
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  //TextField For Type Age

                  ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          //Move to Next page
                          MaterialPageRoute(builder: (context) => indexPage()),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
