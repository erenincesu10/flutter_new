import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyTabbar extends StatefulWidget {
  const MyTabbar({super.key});

  @override
  State<MyTabbar> createState() => _MyTabbarState();
}

class _MyTabbarState extends State<MyTabbar> with TickerProviderStateMixin{

  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex :0 ,length: 4, vsync: this);
  }

    @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabbar Example"),
        bottom: TabBar(
          splashBorderRadius: BorderRadius.circular(12),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.black,
          controller: _tabController,
          tabs: [
            Column(
              children: [
                Icon(Icons.home),
                Text("Home"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.search),
                Text("Search"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.alarm),
                Text("Alarm"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.person),
                Text("Profile"),
              ]),]),
        
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text("It's Home Page"),
          ),
          Center(
            child: Text("It's Search Page"),
          ),
          Center(
            child: Text("It's Alarm Page"),
          ),
          Center(
            child: Text("It's Profile Page"),
          ),
        ],
      ),
      
      );
  }
}
