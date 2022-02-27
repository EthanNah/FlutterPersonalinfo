import 'package:flutter/material.dart';
import 'package:project2/project2/options/sidebar.dart';
import '../menu.dart';
import '../variable.dart';

class interestPage extends StatelessWidget {
  final String text;

  const interestPage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(text),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: SideBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: interest.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      color: Colors.grey,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            //child: Image.asset(interestPng[index]),
                            child: ImageCard(
                              image_path: interestPng[index],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ListTile(
                              title: Text(interest[index]),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => indexPage()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.black,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Go Back To Menu',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatefulWidget {
  final String image_path;

  const ImageCard({required this.image_path});

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 1000),
          tween: Tween(begin: selected ? 30 : 0, end: selected ? 0 : 30),
          builder: (_, value, __) {
            return Container(
              margin: EdgeInsets.all(value * 1.0),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(widget.image_path),
                fit: BoxFit.cover,
              )),
            );
          }),
    );
  }
}
