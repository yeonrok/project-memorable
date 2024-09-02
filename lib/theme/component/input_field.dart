import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/util/helper/screen_size_helper.dart';

class InputField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? error;
  final int? maxLength;
  final TextEditingController? controller;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final void Function()? onClear;
  final bool isDateTime;
  final FocusNode? focusNode;

  const InputField({
    super.key,
    this.label,
    this.hint,
    this.error,
    this.maxLength,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.isDateTime = false,
    this.focusNode,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          print("Keyboard is active");
          widget.isDateTime ? showDatePicker(context) : null;
        } else {
          print("Keyboard is inactive");
          //SystemChannels.textInput.invokeMethod('TextInput.hide');
        }
      },
      child: TextField(
        maxLength: widget.maxLength,
        //autofocus: true,
        focusNode: widget.focusNode,
        style: context.typo.body1.copyWith(
          //height: 1.6,
          fontSize: 22,
        ),
        controller: controller,
        onChanged: (value) {
          setState(() {});
          widget.onChanged?.call(value);
        },
        onSubmitted: widget.onSubmitted,
        onTapOutside: (event) {
          print('onTapOutside');
          FocusManager.instance.primaryFocus?.unfocus();
        },
        keyboardType: TextInputType.text,
        cursorColor: context.color.primary, // .withOpacity(0.6)
        decoration: InputDecoration(
          // suffixIcon: Button(
          //   icon: 'close',
          //   type: ButtonType.flat,
          //   onPressed: () {},
          // ),
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                  ),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      widget.onClear?.call();
                    });
                  },
                ),
          contentPadding: EdgeInsets.only(
            top: 5,
            bottom: 10,
          ),
          // contentPadding: const EdgeInsets.symmetric(vertical: 14),
          // isDense: true,

          label: Container(
            transform: Matrix4.translationValues(0.0, -15.0, 0.0),
            child: Text(widget.label ?? ''),
          ),
          // labelText: widget.label,
          // labelStyle: context.typo.subtitle2.copyWith(
          //   color: context.color.primary,
          // ),
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            // color: context.color.primary,
            color: context.color.primary,
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Color(0xffC5C5C7),
            fontSize: 20,
          ),
          errorText: widget.error,
          errorStyle: context.typo.body2.copyWith(
            color: context.color.subtext,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE8E6E2),
            ),
          ),
          // enabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Color(0xffE53E5B),
          //   ),
          // ),

          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.color.primary,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> showDatePicker(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: ScreenSizeHelper.getHeightByPercentOfScreen(33.0, context),
        child: CuDatePicker(),
      );
    },
  );
}

class CuDatePicker extends StatelessWidget {
  const CuDatePicker({
    super.key,
    this.onDateChange,
  });

  final Function(DateTime date)? onDateChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400.0),
      child: CupertinoDatePicker(
        minimumYear: 1900,
        maximumYear: 2600,
        initialDateTime: DateTime.now(),
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: onDateChange ?? (DateTime date) {},
      ),
    );
  }
}
