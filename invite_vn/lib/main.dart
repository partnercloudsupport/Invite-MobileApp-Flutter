import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:invite_vn/di/inject_modules.dart';
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
        Routes.SPLASH: (context) => InvitationDetailScreen(),
        Routes.LOGIN: (context) => LoginScreen(),
        Routes.HOME: (context) => HomeScreen(),
        Routes.JOIN_INVITATION: (context) => JoinInvitationScreen(),

        Routes.PROFILE: (context) => ProfileScreen(),
        Routes.FEEDBACK: (context) => FeedbackScreen(),
        Routes.INVITE_USE_APP: (context) => InviteUseAppScreen(),
        Routes.PROFILE_NOT_LOGIN: (context) => ProfileNotLoginScreen(),
        Routes.EDIT_PROFILE: (context) => EditProfileScreen(),

        Routes.INVITATION_DETAIL: (context) => InvitationDetailScreen(),
        Routes.CHAT: (context) => ChatScreen(),
      },
      initialRoute: Routes.SPLASH,
    );
  }
}
