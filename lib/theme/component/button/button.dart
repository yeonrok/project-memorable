import 'package:flutter/material.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/theme/component/asset_icon.dart';

part 'button_size.dart';
part 'button_type.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.width,
    ButtonType? type,
    ButtonSize? size,
    bool? isInactive,
  })  : type = type ?? ButtonType.fill,
        size = size ?? ButtonSize.medium,
        isInactive = isInactive ?? false;

  /// 클릭 이벤트
  final void Function() onPressed;

  /// Button 타입 & 크기
  final ButtonType type;
  final ButtonSize size;

  /// 비활성화 여부
  final bool isInactive;

  /// 텍스트 & 아이콘
  final String? text;
  final String? icon;

  /// 폭
  final double? width;

  /// 커스텀 색상
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  /// 버튼이 눌려있는지 여부
  bool isPressed = false;

  /// 비활성화 여부
  bool get isInactive => isPressed || widget.isInactive;

  /// Text & Icon Color
  Color get color => widget.type.getColor(
        context,
        isInactive,
        widget.color,
      );

  /// Background Color
  Color get backgroundColor => widget.type.getBackgroundColor(
        context,
        isInactive,
        widget.backgroundColor,
      );

  /// Border
  Border? get border => widget.type.getBorder(
        context,
        isInactive,
        widget.borderColor,
      );

  /// 버튼 클릭 이벤트
  void onPressed(bool newIsPressed) {
    if (isPressed == newIsPressed) return;
    setState(() {
      isPressed = newIsPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Click Event
      onTapUp: (details) {
        onPressed(false);
        if (!widget.isInactive) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => onPressed(true),
      onTapCancel: () => onPressed(false),

      /// Container
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: border,
        ),
        padding: EdgeInsets.all(widget.size.padding),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: widget.text != null
                  ? Text(
                      widget.text!,
                      style: widget.size.getTextStyle(context).copyWith(
                            color: color,
                            fontSize: 18,
                            fontWeight: context.typo.bold,
                            // fontWeight: widget.type == ButtonType.fill
                            //     ? context.typo.semiBold
                            //     : context.typo.regular,
                          ),
                    )
                  : const SizedBox(),
            ),
            Positioned(
              child: widget.icon != null
                  ? AssetIcon(
                      widget.icon!,
                      color: color,
                      size: 20,
                    )
                  : const SizedBox(),
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     /// Icon
            //     // if (widget.icon != null)
            //     //   AssetIcon(
            //     //     widget.icon!,
            //     //     color: color,
            //     //     size: 20,
            //     //   ),

            //     /// Gap
            //     // if (widget.icon != null && widget.text != null)
            //     //   const SizedBox(width: 8),

            //     /// Text
            //     if (widget.text != null)
            //       Text(
            //         widget.text!,
            //         style: widget.size.getTextStyle(context).copyWith(
            //               color: color,
            //               fontSize: 18,
            //               fontWeight: context.typo.semiBold,
            //               // fontWeight: widget.type == ButtonType.fill
            //               //     ? context.typo.semiBold
            //               //     : context.typo.regular,
            //             ),
            //       ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
