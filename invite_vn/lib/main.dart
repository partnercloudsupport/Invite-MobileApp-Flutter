import 'package:flutter/material.dart';
import 'package:invite_vn/di/inject_modules.dart';
import 'package:invite_vn/di/injector.dart';
import 'package:invite_vn/modules/auth/facebook_auth.dart';
import 'package:invite_vn/modules/auth/google_auth.dart';

void main() {
  injectModules();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  FacebookAuth facebookAuth;
  GoogleAuth googleAuth;


  @override
  void initState() {
    super.initState();
    facebookAuth = Injector.get();
    googleAuth = Injector.get();
  }

  void _incrementCounter() {
//    facebookAuth.login(loggedIn: (data) {
//      print(data);
//    }, cancelledByUser: () {
//      print("cancel");
//    }, error: (error) {
//      print(error);
//    });
//    googleAuth.init();
//    googleAuth.login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
