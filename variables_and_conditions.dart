

import 'package:flutter/material.dart';
void main(){

  runApp(MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Driving Licence Check"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Check"),
          onPressed: (){
            int age = 21;
            String message = "";
            if(age >= 18){
              message  = "Suitable!";
            }else{
              message = "Unsuitable!";
            }
            var alert = AlertDialog(
              title: Text("Result"),
              content: Text(message),
            );

            showDialog(context: context, builder: (BuildContext context)=> alert);
          },
        ),
      ),
    );
  }

}
