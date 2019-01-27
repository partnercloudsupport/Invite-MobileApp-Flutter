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
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
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