// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ja';

  static String m0(min, max) => "${min}文字以上${max}文字以下で入力してください";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
        "characterLimit": m0,
        "delete": MessageLookupByLibrary.simpleMessage("削除"),
        "enterUserBday": MessageLookupByLibrary.simpleMessage("生年月日"),
        "enterUserName": MessageLookupByLibrary.simpleMessage("お名前を入力してください"),
        "register": MessageLookupByLibrary.simpleMessage("登録"),
        "signInMsg": MessageLookupByLibrary.simpleMessage(""),
        "skip": MessageLookupByLibrary.simpleMessage("スキップ"),
        "uploadProfileImage":
            MessageLookupByLibrary.simpleMessage("写真を登録してください"),
        "userBday": MessageLookupByLibrary.simpleMessage("生年月日"),
        "userName": MessageLookupByLibrary.simpleMessage("お名前"),
        "userProfileImage": MessageLookupByLibrary.simpleMessage("プロフィール画像")
      };
}
