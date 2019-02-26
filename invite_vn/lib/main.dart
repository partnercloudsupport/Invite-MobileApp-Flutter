import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:invite_vn/di/inject_modules.dart';
import 'package:invite_vn/di/injector.dart';
import 'package:invite_vn/features/chat_screen.dart';
import 'package:invite_vn/features/home/home_screen.dart';
import 'package:invite_vn/features/home/social/join_invitation_screen.dart';
import 'package:invite_vn/features/invitation_detail_screen.dart';
import 'package:invite_vn/features/login/login_screen.dart';
import 'package:invite_vn/features/profile_setting/edit_profile_screen.dart';
import 'package:invite_vn/features/profile_setting/feedback_screen.dart';
import 'package:invite_vn/features/profile_setting/invite_use_app_screen.dart';
import 'package:invite_vn/features/profile_setting/profile_not_login_screen.dart';
import 'package:invite_vn/features/profile_setting/profile_screen.dart';
import 'package:invite_vn/features/splash/splash_screen.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/statics/strings.dart';
import 'package:flutter_crashlytics/flutter_crashlytics.dart';


Future main() async {
  injectModules();

  bool isInDebugMode = false;

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // Crashlytics.
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
  ));

  await FlutterCrashlytics().initialize();

  runZoned<Future<Null>>(() async {
    runApp(App());
  }, onError: (error, stackTrace) async {
    // Whenever an error occurs, call the `reportCrash` function. This will send
    // Dart errors to our dev console or Crashlytics depending on the environment.
    await FlutterCrashlytics().reportCrash(error, stackTrace, forceCrash: false);
  });

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        Routes.SPLASH: (context) => SplashScreen(),
//        Routes.SPLASH: (context) => InvitationDetailScreen(),
        Routes.LOGIN: (context) => LoginScreen(),
        Routes.HOME: (context) => HomeScreen(),
        Routes.JOIN_INVITATION: (context) => JoinInvitationScreen(),

        Routes.PROFILE: (context) => ProfileScreen(),
        Routes.FEEDBACK: (context) => FeedbackScreen(),
        Routes.INVITE_USE_APP: (context) => InviteUseAppScreen(),
        Routes.PROFILE_NOT_LOGIN: (context) => ProfileNotLoginScreen(facebookAuth: Injector.get(), firebaseMess: Injector.get(),),
        Routes.EDIT_PROFILE: (context) => EditProfileScreen(),

        Routes.INVITATION_DETAIL: (context) => InvitationDetailScreen(),
        Routes.CHAT: (context) => ChatScreen(),
      },
      initialRoute: Routes.SPLASH,
    );
  }
}
