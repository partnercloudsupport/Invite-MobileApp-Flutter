import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class S {
  S(this.locale);

  final Locale locale;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
    },
    'vi': {
      'title': 'Xin chào thế giới',
      'request_accepted': 'Yêu cầu của bạn đã được chấp nhận. Trò chuyện để giao lưu với những thành viên còn lại nhé',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get request_accepted {
    return _localizedValues[locale.languageCode]['request_accepted'];
  }
}

class StringLocalizationsDelegate extends LocalizationsDelegate<S> {
  const StringLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(S(locale));
  }

  @override
  bool shouldReload(StringLocalizationsDelegate old) => false;
}