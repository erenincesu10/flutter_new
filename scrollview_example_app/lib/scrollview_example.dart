import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyScrollView extends StatefulWidget {
  const MyScrollView({super.key});

  @override
  State<MyScrollView> createState() => _MyScrollViewState();
}

class _MyScrollViewState extends State<MyScrollView> {
  List _buttons = <Widget>[
    _myText("buton 1"),
    _myText("buton 2"),
    _myText("buton 3"),
    _myText("buton 4"),
    _myText("buton 5"),
    _myText("buton 6"),
    _myText("buton 7"),
    _myText("buton 8"),
  ];

  final ScrollController _scrollController = ScrollController();
  bool _isLastIndex = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() { 

    setState(() {
  if(_scrollController.offset > _scrollController.position.maxScrollExtent){
    _isLastIndex = true;
  }else{
    _isLastIndex = false;
  }
});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ScrollView Example",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 2,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            _alertDialog(_isLastIndex),
            ListView.builder(
              controller: _scrollController,
              itemCount: _buttons.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Column(
                    children: [
                      _buttons[index],
                      SizedBox(height: 200,)
                    ],
                  )
                  ,
                );
              }),

          ],
        ),
      ),
    );
  }

}

Widget _alertDialog(bool isLast) => isLast ? Align(alignment: Alignment.center,child: Text("You have reached the end of the scroll view.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),))
: Container();

Widget _myText(String label) {
  return Center(child: Text(label));
}
