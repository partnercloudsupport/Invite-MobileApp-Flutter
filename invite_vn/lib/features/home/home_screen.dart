import 'package:flutter/material.dart';
import 'package:invite_vn/features/home/personal/personal_screen.dart';
import 'package:invite_vn/features/home/social/social_screen.dart';
import 'package:invite_vn/features/home/waiting/waiting_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateHomeScreen();
}

class _StateHomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final _screens = <Widget>[
    SocialScreen(),
    WaitingScreen(),
    PersonalScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _screens.length,
    );
  }

  Widget avatar(){
    return Container(
      child: CircleAvatar(
        backgroundImage: new NetworkImage(
            'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&h=350'),
        radius: 20.0,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0)),
    );
  }

  Widget textActivity(){
    return Container(
      child: Text(
        "Hoạt động",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      margin: EdgeInsets.all(16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      left: 16.0, top: 25.0, right: 16.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      avatar(),
                      textActivity(),
                    ],
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car), text: 'Cộng đồng',),
                    Tab(icon: Icon(Icons.directions_transit), text: 'Đang chờ'),
                    Tab(icon: Icon(Icons.directions_bike), text: 'Của tôi'),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/backgrounds/header_home.png'),
                fit: BoxFit.fill
              ),
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
