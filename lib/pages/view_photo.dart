import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share/share.dart';
import 'package:social_share/social_share.dart';
import 'package:flutter/services.dart';

class ViewPhotos extends StatefulWidget {
  final String imgPath;
  // final String imgpath1;
  ViewPhotos(this.imgPath);

  @override
  _ViewPhotosState createState() => _ViewPhotosState();
}

class _ViewPhotosState extends State<ViewPhotos> {
  Uri myUri;
  final GlobalKey genKey = GlobalKey();
  void _onLoading(bool t, String str) {
    if (t) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SimpleDialog(
              children: <Widget>[
                Center(
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: CircularProgressIndicator()),
                ),
              ],
            );
          });
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SimpleDialog(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Saved in Gallary",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          Text(str,
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          Text("FileManager > Downloaded Status",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.teal)),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          MaterialButton(
                            child: Text("Close"),
                            color: Colors.teal,
                            textColor: Colors.white,
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   // DeviceOrientation.portraitUp,
    //   // DeviceOrientation.portraitDown,
    // ]);
    Uri myUri1 = Uri.parse(widget.imgPath);
    File originalImageFile = new File.fromUri(myUri1);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: Colors.indigo,
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Stack(children: [
            Center(
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Hero(
                  tag: widget.imgPath,
                  child: Image.file(
                    File(widget.imgPath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 38),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
                        color: Colors.green,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(15.0),
                        icon: Icon(Icons.file_download), //`Icon` to display
                        label: Text(
                          'Download',
                          style: TextStyle(fontSize: 15.0),
                        ), //`Text` to display
                        onPressed: () async {
                          _onLoading(true, "");
                          //File originalImageFile1 = File(widget.imgPath);
//
//                Directory directory = await getExternalStorageDirectory();
//                if(!Directory("${directory.path}/Downloaded Status/Images").existsSync()){
//                  Directory("${directory.path}/Downloaded Status/Images").createSync(recursive: true);
//                }
//                String path = directory.path;
//                String curDate = DateTime.now().toString();
//                String newFileName = "$path/Downloaded Status/Images/IMG-$curDate.jpg";
//                print(newFileName);
//                await originalImageFile1.copy(newFileName);

                          myUri = Uri.parse(widget.imgPath);
                          File originalImageFile = new File.fromUri(myUri);
                          Uint8List bytes;
                          await originalImageFile.readAsBytes().then((value) {
                            bytes = Uint8List.fromList(value);
                            print('reading of bytes is completed');
                          }).catchError((onError) {
                            print(
                                'Exception Error while reading audio from path:' +
                                    onError.toString());
                          });
                          final result = await ImageGallerySaver.saveImage(
                              Uint8List.fromList(bytes));
                          print(result);
                          _onLoading(false,
                              "If Image not available in gallary\n\nYou can find all images at");
                        },
                      ),
                      RaisedButton.icon(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          elevation: 10,
                          color: Colors.green,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(15.0),
                          icon: Icon(Icons.repeat_rounded), //`Icon` to display
                          label: Text(
                            'Repost',
                            style: TextStyle(fontSize: 15.0),
                          ), //`Text` to display
                          onPressed: () async {
                            try {
                              await SocialShare.shareWhatsapp(
                                  '${originalImageFile.path}');
                            } catch (e) {
                              print('error: $e');
                            }
                          }),
                      RaisedButton.icon(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          elevation: 10,
                          splashColor: Colors.lightGreen,
                          color: Colors.green,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(15.0),
                          onPressed: () async {
                            try {
                              await Share.shareFiles(
                                  ['${originalImageFile.path}']);
                            } catch (e) {
                              print('error: $e');
                            }
                          }
                          // onPressed: SimpleShare.share(uri: myUri1.toString()),
                          // _shareImage(originalImageFile.toString());

                          // Uri myUri1 = Uri.parse(widget.imgPath);
                          // File originalImageFile = new File.fromUri(myUri1);
                          ,
                          icon: Icon(Icons.share),
                          label: Text(
                            "Share",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ))
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
