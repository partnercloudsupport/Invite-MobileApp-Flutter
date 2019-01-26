import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMess {
  final FirebaseMessaging _messaging = FirebaseMessaging();

  void config() {
    _messaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
//        _showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
//        _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
//        _navigateToItemDetail(message);
      },
    );
    _messaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _messaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _messaging.getToken().then((String token) {
      print(token);
//      assert(token != null);
//      setState(() {
//        _homeScreenText = "Push Messaging token: $token";
//      });
//      print(_homeScreenText);
    });
  }

}