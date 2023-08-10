import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class MyPickerPage extends StatefulWidget {
  const MyPickerPage({super.key});

  @override
  State<MyPickerPage> createState() => _MyPickerPageState();
}

class _MyPickerPageState extends State<MyPickerPage> {
  PageController _pageController = PageController(initialPage: 0);

  int age = 0;

  Color _bgColor = Colors.white;

  File? image;

  FontStyle _style = FontStyle.normal;

  // Future _pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     final img = File(image.path);
  //     setState(() => this.image = img);
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  // }
  Future _pickImage(ImageSource source) async {
    try {
      ImagePicker imagePicker = ImagePicker();
      final image = await imagePicker.pickImage(source: source);
      if (image == null) return;
      final img = File(image.path);
      setState(() => this.image = img);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    ).then(
      (value) => setState(() {
        age = DateTime.now().year - value!.year;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Picker Example App"),
        actions: [
          IconButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut);
              },
              icon: Icon(Icons.arrow_back)),
          IconButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut);
              },
              icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: _bgColor,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null
                    ? Image.file(
                        image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      )
                    : FlutterLogo(
                        size: 40,
                      ),
                Text(
                  "Name : Eren",
                  style: TextStyle(fontStyle: _style),
                ),
                Text("Age : $age"),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Press the button for select a photo"),
                IconButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    icon: Icon(Icons.photo))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context, builder: _buildActionSheet);
                },
                child: Text("Choose Font")),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: _showDatePicker, child: Text("Choose Date")),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Color picker"),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _bgColor = Colors.yellow;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  color: Colors.yellow,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _bgColor = Colors.red;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.red,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _bgColor = Colors.blue;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Text("Choose Color")),
          )
        ],
      ),
    );
  }

  Widget _buildActionSheet(BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                setState(() {
                  _style = FontStyle.italic;
                });
                Navigator.pop(context);
              },
              child: Text("Italic")),
          CupertinoActionSheetAction(
              onPressed: () {
                setState(() {
                  _style = FontStyle.normal;
                });
                Navigator.pop(context);
              },
              child: Text("Normal")),
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.red),
            )),
      );
}
