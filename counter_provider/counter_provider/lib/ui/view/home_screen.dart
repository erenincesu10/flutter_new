import 'package:counter_provider/data/repo/counter_repo.dart';
import 'package:counter_provider/ui/providers/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: const Text("Provider Example"),),
      body: SafeArea(
        child: Center(child: Column(
          children: [
            Expanded(
              child: Center(child: Consumer<CounterProvider>(builder: (context,counterPrivider,_)=>Text(counterPrivider.getCounter.toString(),style: TextStyle(fontSize: 64,fontWeight: FontWeight.w600))))),
            Container(
              height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width*0.9,
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: ()=> Provider.of<CounterProvider>(context,listen: false).incrementCounter(),child: Center(child: Icon(Icons.add),),style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: StadiumBorder(),
                      minimumSize: Size(50,50)
                    )),
                  ),
                  Spacer(),
                  Expanded(
                    child: ElevatedButton(onPressed: ()=> Provider.of<CounterProvider>(context,listen: false).descrementCounter(), child:Center(child: Icon(CupertinoIcons.minus),),style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: StadiumBorder(),
                      minimumSize: Size(50,50)
                    ),),
                  ),
                ],
              ),
            ),
            ]),),
      ),
    );
  }
}