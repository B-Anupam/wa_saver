// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:wasamplenew/pages/video_controller.dart';
// import 'package:video_player/video_player.dart';
// import 'package:share/share.dart';
// import 'package:better_player/better_player.dart';
// import 'dart:async';
// import 'dart:typed_data';

// class PlayStatusVideo extends StatefulWidget {
//   final String videoFile;
//   PlayStatusVideo(this.videoFile);

//   @override
//   _PlayStatusVideoState createState() => _PlayStatusVideoState();
// }

// class _PlayStatusVideoState extends State<PlayStatusVideo> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   void dispose() {
//     super.dispose();
//   }

//   void _onLoading(bool t, String str) {
//     if (t) {
//       showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             return SimpleDialog(
//               children: <Widget>[
//                 Center(
//                   child: Container(
//                       padding: EdgeInsets.all(10.0),
//                       child: CircularProgressIndicator()),
//                 ),
//               ],
//             );
//           });
//     } else {
//       Navigator.pop(context);
//       showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SimpleDialog(
//                 children: <Widget>[
//                   Center(
//                     child: Container(
//                       padding: EdgeInsets.all(15.0),
//                       child: Column(
//                         children: <Widget>[
//                           Text(
//                             "Great, Saved in Gallary",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(10.0),
//                           ),
//                           Text(str,
//                               style: TextStyle(
//                                 fontSize: 16.0,
//                               )),
//                           Padding(
//                             padding: EdgeInsets.all(10.0),
//                           ),
//                           Text("FileManager > Downloaded Status",
//                               style: TextStyle(
//                                   fontSize: 16.0, color: Colors.teal)),
//                           Padding(
//                             padding: EdgeInsets.all(10.0),
//                           ),
//                           MaterialButton(
//                             child: Text("Close"),
//                             color: Colors.teal,
//                             textColor: Colors.white,
//                             onPressed: () => Navigator.pop(context),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           });
//     }
//   }

//   Widget videoplay() {
//     // final ByteData bytes = await rootBundle.load('${widget.videoFile}');
//     // final Uint8List list = bytes.buffer.asUint8List();
//     // final directory = (await getExternalStorageDirectory()).path;
//     // File vidFile = File('$directory');
//     // vidFile.writeAsBytesSync(list);
//     return BetterPlayer.file(
//       '${widget.videoFile}',
//       betterPlayerConfiguration: BetterPlayerConfiguration(aspectRatio: 1),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     File originalVideoFile1 = File(widget.videoFile);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           color: Colors.indigo,
//           icon: Icon(
//             Icons.close,
//             color: Colors.black,
//           ),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: Container(
//         child: Column(children: [
//           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//             RaisedButton.icon(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               splashColor: Colors.lightGreen,
//               elevation: 10,
//               color: Colors.green,
//               textColor: Colors.white,
//               icon: Icon(Icons.file_download),
//               padding: EdgeInsets.all(10.0),
//               label: Text(
//                 'Download',
//                 style: TextStyle(fontSize: 16.0),
//               ), //`Text` to display
//               onPressed: () async {
//                 _onLoading(true, "");

//                 File originalVideoFile = File(widget.videoFile);
//                 Directory directory = await getExternalStorageDirectory();
//                 if (!Directory("${directory.path}/Downloaded Status/Videos")
//                     .existsSync()) {
//                   Directory("${directory.path}/Downloaded Status/Videos")
//                       .createSync(recursive: true);
//                 }
//                 String path = directory.path;
//                 String curDate = DateTime.now().toString();
//                 String newFileName =
//                     "$path/Downloaded Status/Videos/VIDEO-$curDate.mp4";
//                 print(newFileName);
//                 await originalVideoFile.copy(newFileName);

//                 _onLoading(false,
//                     "If Video not available in gallary\n\nYou can find all videos at");
//               },
//             ),
//             RaisedButton.icon(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0)),
//                 elevation: 10,
//                 splashColor: Colors.lightGreen,
//                 color: Colors.green,
//                 textColor: Colors.white,
//                 padding: EdgeInsets.all(10),
//                 onPressed: () async {
//                   try {
//                     await Share.shareFiles(['${originalVideoFile1.path}']);
//                   } catch (e) {
//                     print('error: $e');
//                   }
//                 }
//                 // onPressed: SimpleShare.share(uri: myUri1.toString()),
//                 // _shareImage(originalImageFile.toString());

//                 // Uri myUri1 = Uri.parse(widget.imgPath);
//                 // File originalImageFile = new File.fromUri(myUri1);
//                 ,
//                 icon: Icon(Icons.share),
//                 label: Text(
//                   "Share",
//                   style: TextStyle(color: Colors.white, fontSize: 10.0),
//                 ))
//           ]),
//           // StatusVideo(
//           //   videoPlayerController:
//           //       VideoPlayerController.file(File(widget.videoFile)),
//           //   looping: true,
//           //   videoSrc: widget.videoFile,
//           // )
//           videoplay(),
//         ]),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:share/share.dart';
import 'package:social_share/social_share.dart';
import 'video_controller.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/services.dart';

class PlayStatus extends StatefulWidget {
  final String videoFile;
  const PlayStatus({
    Key key,
    this.videoFile,
  }) : super(key: key);
  @override
  _PlayStatusState createState() => _PlayStatusState();
}

class _PlayStatusState extends State<PlayStatus> {
  @override
  void initState() {
    super.initState();
    print('Video file you are looking for:' + widget.videoFile);
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                      padding: const EdgeInsets.all(10.0),
                      child: const CircularProgressIndicator()),
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
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Saved in Gallary',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          Text(str,
                              style: const TextStyle(
                                fontSize: 16.0,
                              )),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          const Text('FileManager > wa_status_saver',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.teal)),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          MaterialButton(
                            child: const Text('Close'),
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: StatusVideo(
        videoPlayerController:
            VideoPlayerController.file(File(widget.videoFile)),
        looping: true,
        aspectRatio: 1,
        autoplay: true,
        videoSrc: widget.videoFile,
      ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.teal,
      //     child: const Icon(Icons.save),
      //     onPressed: () async {
      //       _onLoading(true, '');

      //       final originalVideoFile = File(widget.videoFile);
      //       final directory = await getExternalStorageDirectory();
      //       print('directory: $directory');
      //       if (!Directory('/storage/emulated/0/wa_status_saver')
      //           .existsSync()) {
      //         Directory('/storage/emulated/0/wa_status_saver')
      //             .createSync(recursive: true);
      //       }
      //       // final path = directory.path;
      //       final curDate = DateTime.now().toString();
      //       final newFileName =
      //           '/storage/emulated/0/wa_status_saver/VIDEO-$curDate.mp4';
      //       print(newFileName);
      //       await originalVideoFile.copy(newFileName);

      //       _onLoading(
      //         false,
      //         'If Video not available in gallery,you can find all videos at',
      //       );
      //     }),
      //
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 10,
              color: Colors.green,
              textColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              icon: Icon(Icons.file_download),
              onPressed: () async {
                _onLoading(true, '');

                final originalVideoFile = File(widget.videoFile);
                // final directory = await getExternalStorageDirectory();
                // print('directory: $directory');
                // if (!Directory('/storage/emulated/0/wa_status_saver')
                //     .existsSync()) {
                //   Directory('/storage/emulated/0/wa_status_saver')
                //       .createSync(recursive: true);
                // }
                // // final path = directory.path;
                // final curDate = DateTime.now().toString();
                // final newFileName =
                //     '/storage/emulated/0/wa_status_saver/VIDEO-$curDate.mp4';
                // print(newFileName);
                // await originalVideoFile.copy(newFileName);
                GallerySaver.saveVideo(originalVideoFile.path);
                _onLoading(
                  false,
                  'If Video not available in gallery,you can find all videos at',
                );
              },
              label: Text('Download'))
          //`Icon` to display

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

          ,
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
                  await SocialShare.shareWhatsapp('${widget.videoFile}');
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
                  await Share.shareFiles(['${widget.videoFile}']);
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
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ))
        ]),
      ),
    );
  }
}
