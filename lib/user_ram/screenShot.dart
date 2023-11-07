import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:ui';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';


class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  Widget? _imgHolder;

  @override
  void initState() {
    super.initState();
    // _imgHolder = Center(
    //   child: Icon(Icons.image),
    // );
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Refluttersdk().screentracking("AccountPage", context);
    });
  } // initState()

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Native Screenshot'),
        ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Press to capture screenshot'),
              onPressed: () async {
                  _doTakeScreenshot();
              },
            )
          ],
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: _imgHolder,
        ),
      ),
    );
  } // build()

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _doTakeScreenshot() async {
    String? path = await Refluttersdk().takeScreenShot();
    debugPrint('Screenshot taken, path: $path');
    if (path == null || path.isEmpty) {
      print('Error taking the screenshot :(');
      return;
    } // if error
    print('The screenshot has been saved to: $path');
    File imgFile = File(path);
    _imgHolder = Image.file(imgFile);
    Uint8List bytes = imgFile.readAsBytesSync();

    // ByteData byteData = ByteData.view(bytes.buffer);
    // Uint8List bytess = await imgFile.readAsBytes();
    //     Uint8List? pngBytes = byteData?.buffer.asUint8List();
    setState(() {});
  }
} // _MyAppState




class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           // _captureScreenshot();
          },
          child: Text('Take Screenshot'),
        ),
      ),
    );
  }

  // Future<void> _captureScreenshot() async {
  //   try {
  //     // Capture the current screen using `ui.window`
  //     ui.Image image = await _captureCurrentScreen();
  //     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //     Uint8List? pngBytes = byteData?.buffer.asUint8List();
  //     // You can now save or use the 'pngBytes' as needed
  //     // e.g., save it to the device's storage or upload it somewhere.
  //     print('Screenshot taken!');
  //   } catch (e) {
  //     print('Failed to capture screenshot: $e');
  //   }
  // }

  // Future<ui.Image> _captureCurrentScreen() async {
  //   try {
  //     // Use `ui.window` to capture the screen
  //     //ui.Image image = await ui.window.toImage(pixelRatio: 1.0);
  //     return image;
  //   } catch (e) {
  //     throw Exception('Failed to capture current screen: $e');
  //   }
  // }
}


class MYHome extends StatefulWidget {
  const MYHome({super.key});

  @override
  State<MYHome> createState() => _MYHomeState();
}

class _MYHomeState extends State<MYHome> {

  late Image _image;

  GlobalKey previewContainer = new GlobalKey();
  int originalSize = 800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RepaintBoundary(
                  key: previewContainer,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurple),
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "This is a picture.",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Image.asset("assets/example.jpg"),
                        Text(
                          "There’s something so whimsical about these beautiful images that incorporate bokeh. It’s almost as if they could be from a different, magical world. We’ve loved watching the submissions fly in for our bokeh-themed Photo Quest by Meyer-Optik-Görlitz and selected 30+ of our favourites beautiful images to ignite your creative spark! The three lucky winners of this Quest are going to receive an incredible prize courtesy of master lens-crafters Meyer-Optik.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: ElevatedButton(
                          child: Text("Take Screenshot!"),
                          onPressed: () {
                            ShareFilesAndScreenshotWidgets()
                                .takeScreenshot(previewContainer, originalSize)
                                .then((Image value) {
                              setState(() {
                                _image = value;
                              });
                            } as FutureOr Function(Image? value));
                          }),
                    ),
                    Container(
                        child: ElevatedButton(
                            child: Text("Share Screenshot!"),
                            onPressed: () {
                              ShareFilesAndScreenshotWidgets().shareScreenshot(
                                  previewContainer,
                                  originalSize,
                                  "Title",
                                  "Name.png",
                                  "image/png",
                                  text: "This is the caption!");
                            })),
                    Container(
                        child: ElevatedButton(
                            child: Text("Share Image!"),
                            onPressed: () async {
                              ByteData bytes =
                              await rootBundle.load('assets/example.jpg');
                              Uint8List list = bytes.buffer.asUint8List();
                              ShareFilesAndScreenshotWidgets().shareFile(
                                  "Title", "Name.jpg", list, "image/jpg",
                                  text: "This is the caption!");
                            })),
                    Container(
                        child: ElevatedButton(
                            child: Text("Share Video!"),
                            onPressed: () async {
                              ByteData bytes =
                              await rootBundle.load('assets/example.mp4');
                              Uint8List list = bytes.buffer.asUint8List();
                              ShareFilesAndScreenshotWidgets().shareFile(
                                  "Title", "Name.mp4", list, "video/mp4",
                                  text: "This is the caption!");
                            })),
                    Container(
                        child: ElevatedButton(
                            child: Text("Share Audio!"),
                            onPressed: () async {
                              ByteData bytes =
                              await rootBundle.load('assets/example.mp3');
                              Uint8List list = bytes.buffer.asUint8List();
                              ShareFilesAndScreenshotWidgets().shareFile(
                                  "Title", "Name.mp3", list, "audio/mp3",
                                  text: "This is the caption!");
                            })),
                  ],
                ),
                _image != null ? _image : Center()
              ],
            ),
          ),
        ));
  }
}