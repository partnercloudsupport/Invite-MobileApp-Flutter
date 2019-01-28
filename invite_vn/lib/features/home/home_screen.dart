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

  @override
  Widget build(BuildContext context) {
    ;
    return Scaffold(
      body: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.deepOrange,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.deepOrange.withOpacity(0.3),
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
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
