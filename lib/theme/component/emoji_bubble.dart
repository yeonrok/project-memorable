import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class EmojiBubble extends StatelessWidget {
  const EmojiBubble({
    super.key,
    required this.icon,
    this.color,
    //this.size,
  });
  final String icon;
  final Color? color;
  //final double? size;
  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          parser.emojify(':$icon:'),
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
