import 'package:flutter/material.dart';
import 'detailPages/his10.dart';
import 'detailPages/his20.dart';
import 'detailPages/travelPage.dart';
import 'detailPages/interestPage.dart';
import 'variable.dart';
import 'options/sidebar.dart';

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
      home: indexPage(),
    );
  }
}

class indexPage extends StatefulWidget {
  @override
  State<indexPage> createState() => _indexPageState();
}

//backGround Color
@override
bool backColor = false;

class _indexPageState extends State<indexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor ? Colors.blueGrey : Colors.black,
      appBar: AppBar(
        title: Text('Welcome, $nickname'),
        centerTitle: true,
        elevation: 0.0,
        //DarkMode Switch
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
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          //Generate list with exist <List>
          ...List.generate(mainLists.length, (index) {
            //var container;
            var route;
            switch (index) {
              case 0:
                //Take the index value and follow the case.
                route = his10(text: mainLists[index]);
                break;
              case 1:
                route = his20(text: mainLists[index]);
                break;

              case 2:
                route = travelPage(text: mainLists[index]);
                break;

              case 3:
                route = interestPage(text: mainLists[index]);
                break;

              default:
                route = interestPage(text: mainLists[index]);
                break;
                //another Option to make List
                // -----make New Container with Index Value-----
                // container=Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(0),
                //     border: Border.all(color: Colors.blueAccent, width:4),
                //   ),
                //   padding: const EdgeInsets.all(10.0),
                //   height: 150,
                //   //width: double.infinity,
                //   child: Text(
                //     texts[index],
                //     style: TextStyle(
                //       fontSize: 41,
                //       color: Colors.white,
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                //
                // );
                break;
            }
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    //Move to Next page
                    MaterialPageRoute(builder: (context) => route));
              },
              behavior: HitTestBehavior.translucent,

              /// child:container
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: Colors.yellowAccent, width: 4),
                ),
                padding: const EdgeInsets.all(5.0),
                height: 150,
                margin: EdgeInsets.all(20.0),
                //width: double.infinity,
                child: Text(
                  mainLists[index],
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ],
      )),
    );
  }
}
