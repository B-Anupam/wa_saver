// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:wasamplenew/pages/video_play.dart';
// import 'package:thumbnails/thumbnails.dart';

// final Directory _videoDir = Directory('storage/emulated/0/Download');

// class VideoListView extends StatefulWidget {
//   @override
//   VideoListViewState createState() {
//     return new VideoListViewState();
//   }
// }

// class VideoListViewState extends State<VideoListView> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!Directory("${_videoDir.path}").existsSync()) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("Whatsapp Video Status"),
//         ),
//         body: Container(
//           padding: EdgeInsets.only(bottom: 60.0),
//           child: Center(
//             child: Text(
//               "Install WhatsApp\nYour Friend's Status will be available here.",
//               style: TextStyle(fontSize: 18.0),
//             ),
//           ),
//         ),
//       );
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("Whatsapp Video Status"),
//         ),
//         body: VideoGrid(directory: _videoDir),
//       );
//     }
//   }
// }

// class VideoGrid extends StatefulWidget {
//   final Directory directory;

//   const VideoGrid({Key key, this.directory}) : super(key: key);

//   @override
//   _VideoGridState createState() => _VideoGridState();
// }

// class _VideoGridState extends State<VideoGrid> {
//   _getImage(videoPathUrl) async {
//     //await Future.delayed(Duration(milliseconds: 500));
//     String thumb = await Thumbnails.getThumbnail(
//         videoFile: videoPathUrl,
//         imageType:
//             ThumbFormat.PNG, //this image will store in created folderpath
//         quality: 10);
//     return thumb;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var videoList = widget.directory
//         .listSync()
//         .map((item) => item.path)
//         .where((item) => item.endsWith(".mp4"))
//         .toList(growable: false);

//     if (videoList != null) {
//       if (videoList.length > 0) {
//         return Container(
//           padding: EdgeInsets.only(bottom: 40.0),
//           child: GridView.builder(
//             itemCount: videoList.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1, childAspectRatio: 1),
//             itemBuilder: (context, index) {
//               return Container(
//                 padding: EdgeInsets.all(10.0),
//                 child: InkWell(
//                   onTap: () => Navigator.push(
//                     context,
//                     new MaterialPageRoute(
//                         builder: (context) =>
//                             PlayStatusVideo(videoList[index])),
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                     ),
//                     child: FutureBuilder(
//                         future: _getImage(videoList[index]),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return Column(children: <Widget>[
//                                 Hero(
//                                   tag: videoList[index],
//                                   child: Image.file(
//                                     File(snapshot.data),
//                                     height: 280.0,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(10),
//                                   child: RaisedButton(
//                                     child: Text("Play Video"),
//                                     color: Colors.indigo,
//                                     textColor: Colors.white,
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         new MaterialPageRoute(
//                                             builder: (context) =>
//                                                 new PlayStatusVideo(
//                                                     videoList[index])),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ]);
//                             } else {
//                               return Center(
//                                 child: CircularProgressIndicator(),
//                               );
//                             }
//                           } else {
//                             return Hero(
//                               tag: videoList[index],
//                               child: Container(
//                                   height: 280.0,
//                                   child: Text("Please Try Again")),
//                             );
//                           }
//                         }),
//                     //new cod
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       } else {
//         return Center(
//           child: Container(
//             padding: EdgeInsets.only(bottom: 60.0),
//             child: Text(
//               "Sorry, No Videos Found.",
//               style: TextStyle(fontSize: 18.0),
//             ),
//           ),
//         );
//       }
//     } else {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//   }
// }
// //
// //2
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
import 'dart:io';
import 'package:wasamplenew/pages/video_play.dart';
import 'package:flutter/material.dart';
import 'package:thumbnails/thumbnails.dart';

final Directory _videoDir =
    Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');

class VideoListView extends StatefulWidget {
  const VideoListView({Key key}) : super(key: key);
  @override
  VideoListViewState createState() => VideoListViewState();
}

class VideoListViewState extends State<VideoListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!Directory('${_videoDir.path}').existsSync()) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const Text(
                'Install WhatsApp\n',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            const Text(
              "Status Will Be Available Here",
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      );
    } else {
      return VideoGrid(directory: _videoDir);
    }
  }
}

class VideoGrid extends StatefulWidget {
  final Directory directory;

  const VideoGrid({Key key, this.directory}) : super(key: key);

  @override
  _VideoGridState createState() => _VideoGridState();
}

class _VideoGridState extends State<VideoGrid> {
  Future<String> _getImage(videoPathUrl) async {
    //await Future.delayed(Duration(milliseconds: 500));
    final thumb = await Thumbnails.getThumbnail(
        videoFile: videoPathUrl,
        imageType:
            ThumbFormat.PNG, //this image will store in created folderpath
        quality: 10);
    return thumb;
  }

  @override
  Widget build(BuildContext context) {
    final videoList = widget.directory
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith('.mp4'))
        .toList(growable: false);

    if (videoList != null) {
      if (videoList.length > 0) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
          ),
          body: Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: GridView.builder(
                  itemCount: videoList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayStatus(
                              videoFile: videoList[index],
                            ),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                                colors: [
                                  Color(0xffb7d8cf),
                                  Color(0xffb7d8cf),
                                  Color(0xffb7d8cf),
                                  Color(0xffb7d8cf),
                                  Color(0xffb7d8cf),
                                ],
                              ),
                            ),
                            child: FutureBuilder(
                                future: _getImage(videoList[index]),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      return Hero(
                                        tag: videoList[index],
                                        child: Image.file(
                                          File(snapshot.data),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  } else {
                                    return Hero(
                                      tag: videoList[index],
                                      child: SizedBox(
                                        height: 280.0,
                                        child: Image.asset(
                                            'assets/images/video_loader.gif'),
                                      ),
                                    );
                                  }
                                }),
                            //new cod
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Text(
              'Sorry, No Videos Found.',
              style: TextStyle(fontSize: 28.0, color: Colors.black),
            ),
          ),
        );
      }
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
