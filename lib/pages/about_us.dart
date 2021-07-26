import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
      ),
      body: Container(
        color: Color(0xffe8e8e8),
        child: ListView(children: <Widget>[
          //Welcome and Balance Info
          Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade700,
                    offset: Offset.zero,
                    blurRadius: 3.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("About Us",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Hey, Thanks for Installing Status Saver.",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // MaterialButton(
                          //   onPressed: () {
                          //     _launchURL();
                          //   },
                          //   padding: EdgeInsets.all(20.0),
                          //   child: Text("Read More Link",
                          //       style: TextStyle(
                          //         fontSize: 24.0,
                          //         color: Colors.white,
                          //       )),
                          //   color: Colors.indigo,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
