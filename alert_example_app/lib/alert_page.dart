import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyAlertPage extends StatefulWidget {
  const MyAlertPage({super.key});

  @override
  State<MyAlertPage> createState() => _MyAlertPageState();
}

class _MyAlertPageState extends State<MyAlertPage> {
  String _button3 = "Text";
  String _button4 = "";
  TextEditingController _enteredText = TextEditingController();
  String _button5 = "No color chosen";
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: Text("Alert App"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Button3 text : $_button3",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Entered text : $_button4",
              style: TextStyle(color: Colors.white),
            ),
            Text("Chosen color : $_button5",style: TextStyle(color: _color),),
            ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Button 1"),
                          content: Text("No Button"),
                        );
                      });
                },
                child: Text(
                  "Alert 1",
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Button 2"),
                          content: Text("One button"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK")),
                          ],
                        );
                      });
                },
                child: Text(
                  "Alert 2",
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          alignment: Alignment.center,
                          title: Text("Button 3"),
                          content: Text("Two buttons"),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _button3 = "Hello";
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text("Hello")),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _button3 = "World";
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text("World")),
                              ],
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  "Alert 3",
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          alignment: Alignment.center,
                          title: Center(child: Text("Button 4")),
                          content: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Column(
                              children: [
                                Text("Textfield"),
                                TextField(
                                  controller: _enteredText,
                                )
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _button4 = _enteredText.text;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text("Save")),
                          ],
                        );
                      });
                },
                child: Text(
                  "Alert 4",
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton(
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context, builder: _buildActionSheet);
                },
                child: Text("Action",style: TextStyle(color: Colors.black),)),
            ElevatedButton(
                onPressed: () {
                  showDialog(context: context,builder: (BuildContext context) {
                    return AlertDialog(
                      alignment: Alignment.center,
                      title: Center(child: Text("Activity")),
                      content: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          children: [
                            Text("Share image and files"),
                            SizedBox(height: 20,),
                            Center(child: Icon(Icons.share),)
                          ],
                        ),
                      ),
                    );
                  });
                },
                child: Text("Activity",style: TextStyle(color: Colors.black),)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionSheet(BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text("Red"),
            onPressed: () {
              setState(() {
                _button5 = "Red";
                _color = Colors.red;
              });
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: Text("Yellow"),
            onPressed: () {
              setState(() {
                _button5 = "Yellow";
                _color = Colors.yellow;
              });
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: Text("Blue"),
            onPressed: () {
              setState(() {
                _button5 = "Blue";
                _color = Colors.blue;
              });
              Navigator.pop(context);
            },
          ),
        ],
        cancelButton: 
        CupertinoActionSheetAction(
            child: Text("Cancel",style: TextStyle(color: Colors.red),),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      );
}
