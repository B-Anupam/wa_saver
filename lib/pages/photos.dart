import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasamplenew/pages/view_photo.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/services.dart';

final Directory _photoDir =
    Directory('storage/emulated/0/WhatsApp/Media/.Statuses');

class Photos extends StatefulWidget {
  @override
  PhotosState createState() {
    return PhotosState();
  }
}

class PhotosState extends State<Photos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (!Directory("${_photoDir.path}").existsSync()) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Whatsapp Photo Status"),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Center(
            child: Text(
              "Install WhatsApp\nYour Friend's Status will be available here.",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      );
    } else {
      var imageList = _photoDir
          .listSync()
          .map((item) => item.path)
          .where((item) => item.endsWith(".jpg"))
          .toList(growable: false);

      if (imageList.length > 0) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Whatsapp Photo Status"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              padding: EdgeInsets.only(bottom: 60.0),
              child: StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 4,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  String imgPath = imageList[index];
                  //final String forwardpath = imgPath;
                  return Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewPhotos(imgPath)),
                        );
                      },
                      child: Hero(
                        tag: imgPath,
                        child: Image.file(
                          File(imgPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (i) =>
                    StaggeredTile.count(2, i.isEven ? 2 : 3),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text("Whatsapp Photo Status"),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.only(bottom: 60.0),
              child: Text(
                "Sorry, No Images Found.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        );
      }
    }
  }
}
