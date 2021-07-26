import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
//import 'package:hexcolor/hexcolor_web.dart';
import 'package:wasamplenew/pages/photos.dart';
import 'package:wasamplenew/pages/whatsender.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:wasamplenew/pages/videos.dart';

import 'package:wasamplenew/includes/myNavigationDrawer.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

// class CurvedClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 30);
//     path.quadraticBezierTo(
//         size.width / 2, size.height, size.width, size.height - 30);
//     path.lineTo(size.width, 0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// @override
// bool shouldReclip(CustomClipper oldClipper) {
//   return true;
// }

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //const String testDevice = '';
  static final MobileAdTargetingInfo targetInfo = MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>[
      'whatsapp',
      'status',
      'download status',
      'save status',
      'photos',
      'videos',
      'message'
    ],
  );
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Banner event:$event");
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Interstitial event: $event");
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      drawer: Drawer(child: MyNavigationDrawer()),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.0),
        child: AppBar(
          elevation: 2,
          title: Text(
            '   WA Status Saver',
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: HexColor('#0F4C5C'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(190),
            ),
          ),
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ClipPath(
          //   clipper:
          //       CustomShape(), // this is my own class which extendsCustomClipper
          //   child: Container(height: 150, color: Colors.green),
          // ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/images/wa logo.png', // Add Image
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.129,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: InkWell(
                    splashColor: Colors.lightGreen,
                    onTap: () {
//                  createInterstitialAd()
//                    ..load()
//                    ..show();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Photos(),
                      ));
                    },
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.photo, color: Colors.white),
                        Text(
                          'PHOTOS',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.129,
                  decoration: BoxDecoration(
                    color: HexColor('#006C67'),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: InkWell(
                    splashColor: Colors.lightGreen,
                    onTap: () {
//                  createInterstitialAd()
//                    ..load()
//                    ..show();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => VideoListView(),
                      ));
                    },
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.video_library,
                          color: Colors.white,
                        ),
                        Text(
                          'VIDEOS',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // color: Colors.gr,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.129,
                  decoration: BoxDecoration(
                    color: HexColor('#FC5130'),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: InkWell(
                    splashColor: Colors.lightGreen,
                    onTap: () {
//                  createInterstitialAd()
//                    ..load()
//                    ..show();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SendDirect(),
                      ));
                    },
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.message, color: Colors.white),
                        Text(
                          'DIRECT',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
