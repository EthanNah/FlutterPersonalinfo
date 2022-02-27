import 'package:flutter/material.dart';
import '../variable.dart';
import '../menu.dart';
import 'sidebar.dart';

//Make User rate My app

class ratingPage extends StatefulWidget {
  @override
  State<ratingPage> createState() => _ratingPageState();
}

class _ratingPageState extends State<ratingPage> {
  var _ratingSliderValue = 1.0;
  var _greeting = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor ? Colors.blueGrey : Colors.black,
      appBar: AppBar(
        title: Text('Rating My App, $nickname'),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildRateSlider(),
            _greeTo(),
            SizedBox(
              height: 250,
            ),
            //Button for Goback to first Page
            ElevatedButton(
                child: Text("Go back to Menu Page"),
                onPressed: () {
                  Navigator.push(
                    context,
                    //Move to Next page
                    MaterialPageRoute(builder: (context) => indexPage()),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildRateSlider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Rate My App ",
        ),

        //make Slider
        Slider(
          min: 1.0,
          max: 10.0,
          divisions: 9,
          //when user changed value, Slider value changed
          value: _ratingSliderValue,
          onChanged: _updateSliderValue,
          label: '${_ratingSliderValue.toInt()}',
        ),
      ],
    );
  }

  Widget _greeTo() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            child: Text("Submit"),
            onPressed: _Result,
          ),
          SizedBox(
            width: 30.0,
          ),
          Container(
            padding: EdgeInsets.all(0.0),
            height: 200,
            width: double.infinity,
            child: Text(
              _greeting,
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            ),
          ),
        ],
      ),
    );
  }

  //When the user drags the slider and changes it to a new value, onChanged is called, and at this time, the current value is passed over.
  // You have to change the value of the slider to the value you received from onChanged.
  void _updateSliderValue(double newValue) {
    setState(() {
      _ratingSliderValue = newValue;
    });
  }

  //show the Result depends on User Rating
  void _Result() {
    setState(() {
      if (_ratingSliderValue < 3) {
        _greeting = "I need to rip it all off and fix it!";
      } else if (_ratingSliderValue >= 3 && _ratingSliderValue < 7) {
        _greeting = "It means it's normal.\nI'll do my best to grow further.";
      } else {
        _greeting =
            "Thank you for the good evaluation!\n It gives me a lot of strength!";
      }
    });
  }
}
