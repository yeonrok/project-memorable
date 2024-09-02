import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class IntlHelper {
  /// 지원 언어
  static const Locale en = Locale('en');
  static const Locale ko = Locale('ko');
  static const Locale ja = Locale('ja');

  /// 한국어 여부
  static bool get isKo => Intl.getCurrentLocale() == ko.languageCode;
}
