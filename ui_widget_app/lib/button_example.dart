import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyButtonExample extends StatefulWidget {
  const MyButtonExample({super.key});

  @override
  State<MyButtonExample> createState() => _MyButtonExampleState();
}

class _MyButtonExampleState extends State<MyButtonExample> with TickerProviderStateMixin{
  String _robberyStatus = "Not started";
  String _status = "Everything is okay";
  String _dropdownValue = "Warning!";
  Color color = Colors.purple;
  Color _robColor = Colors.green;
  bool _isPressed = false;
  bool _blackSmithPressed = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  final player = AudioPlayer();

  Future<void> playAudioFromUrl(String url) async{
    await player.play(AssetSource('sounds/sound.wav'));
  }

   @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween(begin: -10.0, end: 10.0).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
      });
  }

   @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Example"),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sheriff : "),
                  DropdownButton(
                    iconEnabledColor: Colors.black,
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    items: [
                      DropdownMenuItem(
                      value: "Warning!",
                      onTap: (){setState(() {
                          _status = "Something went wrong!";
                        });},
                      child: Text("Warning!"),
                    ),
                                      DropdownMenuItem(
                      value: "Callback",
                      onTap: (){setState(() {
                          _status = "Everything is okay!";
                        });},
          
                      child: Text("Callback!"),
                    ),], 
                    value: _dropdownValue,
                    onChanged: (String? newValue){
                      setState(() {
                        _dropdownValue = newValue!;
                      });
                  },
        ),
                ],
              ),
              SizedBox(height: 20,),
        Text(_status),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Local Saloon : "),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Daily Special!"),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://wokbox.ca/wp-content/uploads/2022/01/WB-2021-Daily-Deals-Window-Poster-24x36-1-683x1024.jpg"))
                        ),
                      )
                    ],
                  );
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade400,
                              spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://cdn-icons-png.flaticon.com/512/2927/2927347.png"))
                ),
                child: Text("Daily Specials",style: TextStyle(fontSize: 20),),
              ))
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Leader : "),
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                setState(() {
                _isPressed = true;
              });
              
              },
          onTapUp: (TapUpDetails details) {
            setState(() {
            _isPressed = false;
    });
  },
        onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
        },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),
                  color: _isPressed ? Colors.yellow : Colors.purple
                ),
              ))
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Blacksmith : "),
            IconButton(onPressed: (){
              setState(() {
                _blackSmithPressed == true ? _blackSmithPressed = false : _blackSmithPressed = true;
              });
            }, icon: Icon(Icons.privacy_tip_rounded)),
            OutlinedButton(
              onPressed:  _blackSmithPressed ? () => print("active") : null
                
              , child: Text("Shop Button"))
          ],
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: () async{
            _animationController.forward();
            setState(() {
              _robColor = Colors.red;
              _status = "Something went wrong!";
              _robberyStatus = "Robbery Started!";
            });
            playAudioFromUrl("https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbXZkeG1fdUxHcnFEMGgwNnlqVGJKaXpWd25FZ3xBQ3Jtc0treUYzLWlUUERwcXpyWU9SWkdGY3BDdlpoT2VzZDhLZ01WNDVJaTJpS1dBYVVUYlg5dU9TeDRnak5WSjU0ZXAxMkpFcG9hdmR4bXJLcFU1N1JDMnAwSjRUVVk4UzhFaDFOREx2ZFlMTmRsZkFCdWtfYw&q=https%3A%2F%2Ffilesamples.com%2Fsamples%2Faudio%2Fmp3%2FSymphony%2520No.6%2520%281st%2520movement%29.mp3%27%29%3B&v=i9a-o3zhQ_Q");
          },
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_animation.value, 0),
                child: child,
              );
            },
            child: Container(
              width: 200,
              height: 100,
              color: _robColor,
              child: Center(
                child: Text(
                  _robberyStatus,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),)
            ],
          ),
        )),
    );
  }
}


