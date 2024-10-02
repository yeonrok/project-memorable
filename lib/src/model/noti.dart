import 'package:flutter/foundation.dart' show immutable;
import 'package:uuid/uuid.dart';

@immutable
class Noti {
  final String id;
  final String icon;
  final String tag;
  final String title;
  final String timestamp;

  Noti({
    required this.icon,
    required this.tag,
    required this.title,
    // required this.timestamp,
  })  : id = const Uuid().v4(),
        timestamp = DateTime.now().toIso8601String();
  // DateTime.now()

  @override
  bool operator ==(covariant Noti other) =>
      icon == other.icon &&
      tag == other.tag &&
      title == other.title &&
      timestamp == other.timestamp;
  // if (other is! Noti) return false;
  // if (icon != other.icon) return false;
  // if (tag != other.tag) return false;
  // if (title != other.title) return false;
  // if (timestamp != other.timestamp) return false;
  // return true;

  @override
  // int get hashCode => super.hashCode;
  int get hashCode => Object.hashAll(
        [
          icon,
          tag,
          title,
          timestamp,
        ],
      );
}
