// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class MyGridViewPage extends StatefulWidget {
  const MyGridViewPage({super.key});

  @override
  State<MyGridViewPage> createState() => _MyGridViewPageState();
}

class _MyGridViewPageState extends State<MyGridViewPage> {
  List _apps = [
    App(
        appName: "Instagram Analytics App",
        imageUrl:
            "https://static.wixstatic.com/media/894657_e8a2c4ef0cb74aff8bac7980f5588a78~mv2.png/v1/fill/w_182,h_182,al_c,q_95,enc_auto/Instagram_Analytics%20App.png",
        releaseDate: DateTime(2021, 2, 12),
        storeUrl: "https://www.neonapps.co/referance-apps",
        appCategory: "Socail Networking"),
    App(
        appName: "PDF Maker App",
        imageUrl:
            "https://static.wixstatic.com/media/894657_4aad7a4ca6de4e9dbcdc7d8affc9ca90~mv2.png/v1/fill/w_182,h_182,al_c,q_95,enc_auto/Pdf%20Maker.png",
        releaseDate: DateTime(2022, 2, 12),
        storeUrl: "https://www.neonapps.co/referance-apps",
        appCategory: "Business")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View App"),
      ),
      body: GridView.builder(
        itemCount: _apps.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(_apps[index].appName),
              Text(_apps[index].releaseDate.toString()),
              Text(_apps[index].appCategory),
              RichText(text: TextSpan(
                
                style: TextStyle(color: Colors.blue,),
                text: _apps[index].storeUrl,
                recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final url = Uri.parse(_apps[index].storeUrl) ;
                  if(await canLaunchUrl(url)){
                    await launchUrl(url);
                  }
                }
              ),),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(_apps[index].imageUrl))),
              ),
              CupertinoContextMenu(actions: [
                CupertinoContextMenuAction(child: Text("Share"),onPressed: () => Navigator.pop(context),)
              ], child: Icon(Icons.share))
            ],
          ),
        ),
      ),
    );
  }
}

class App {
  String appName;
  String imageUrl;
  DateTime releaseDate;
  String storeUrl;
  String appCategory;
  App({
    required this.appName,
    required this.imageUrl,
    required this.releaseDate,
    required this.storeUrl,
    required this.appCategory,
  });
}
