import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:invite_vn/di/inject_modules.dart';
import 'package:invite_vn/features/home/home_screen.dart';
import 'package:invite_vn/features/home/social/join_invitation_screen.dart';
import 'package:invite_vn/features/login/login_screen.dart';
import 'package:invite_vn/features/profile_setting/edit_profile_screen.dart';
import 'package:invite_vn/features/profile_setting/feedback_screen.dart';
import 'package:invite_vn/features/profile_setting/invite_use_app_screen.dart';
import 'package:invite_vn/features/profile_setting/profile_not_login_screen.dart';
import 'package:invite_vn/features/profile_setting/profile_screen.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/statics/strings.dart';
import 'package:invite_vn/widgets/dialogs/request_accepted_dialog.dart';

void main() {
  injectModules();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
  ));
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return RequestAcceptedDialog();
    return MaterialApp(
      localizationsDelegates: [
        const StringLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('vi', ''),
      ],
      routes: {
//        Routes.SPLASH: (context) => SplashScreen(),
        Routes.SPLASH: (context) => ProfileNotLoginScreen(),
        Routes.LOGIN: (context) => LoginScreen(),
        Routes.HOME: (context) => HomeScreen(),
        Routes.JOIN_INVITATION: (context) => JoinInvitationScreen(),

        Routes.PROFILE: (context) => ProfileScreen(),
        Routes.FEEDBACK: (context) => FeedbackScreen(),
        Routes.INVITE_USE_APP: (context) => InviteUseAppScreen(),
        Routes.PROFILE_NOT_LOGIN: (context) => ProfileNotLoginScreen(),
        Routes.EDIT_PROFILE: (context) => EditProfileScreen(),
      },
      initialRoute: Routes.HOME,
    );
  }
}

//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
////  FacebookAuth facebookAuth;
////  GoogleAuth googleAuth;
////  FirebaseMess firebaseMess;
//
//  @override
//  void initState() {
//    super.initState();
////    facebookAuth = Injector.get();
////    googleAuth = Injector.get();
////    firebaseMess = Injector.get();
////    firebaseMess.config();
////    googleAuth.init();
//  }
//
//  void _incrementCounter() {
//    setState(() {
//      _counter += 1;
//    });
////    facebookAuth.login(loggedIn: (data) {
////      print(data);
////    }, cancelledByUser: () {
////      print("cancel");
////    }, error: (error) {
////      print(error);
////    });
////    googleAuth.login();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              S.of(context).title,
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
