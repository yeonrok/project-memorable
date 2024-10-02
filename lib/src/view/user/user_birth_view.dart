import 'package:flutter/material.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/src/view/album/main_view.dart';
import 'package:project_memorable/theme/component/button/button.dart';
import 'package:project_memorable/theme/component/input_field.dart';
import 'package:project_memorable/util/lang/generated/l10n.dart';

class UserBirthView extends StatelessWidget {
  const UserBirthView({
    super.key,
  });

  // final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: context.color.surface,
      appBar: AppBar(
        //backgroundColor: context.color.primary,
        toolbarHeight: 60,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Button(
              text: S.current.skip,
              type: ButtonType.flat,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainView(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, right: 20.0, left: 20.0, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                S.current.userBday,
                style: context.typo.headline2.copyWith(
                  color: context.color.text,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                S.current.enterUserBday,
                style: context.typo.subtitle1
                    .copyWith(color: context.color.subtext),
                //style: context.watch<ThemeService>().theme.typo.subtitle1,
              ),
              SizedBox(
                height: 60,
              ),
              // Focus(
              //   onFocusChange: (hasFocus) {
              //     //showDatePicker(context);
              //   },
              //   child:
              InputField(
                label: S.current.userBday,
                hint: S.current.userBday,
                //error: '2~12자로 입력해주세요.',
                error: S.current.characterLimit(2, 12),
                maxLength: 12,
                isDateTime: true,
                // error: S.current.textFieldContraints(2, 12),
                //error: S.current.textFieldminLength('', 2),
              ),
              // ),
              const Spacer(),
              Button(
                // type: ButtonType.fill,
                text: S.current.register,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Future<void> showDatePicker(BuildContext context) {
//   return showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         height: ScreenSizeHelper.getHeightByPercentOfScreen(33.0, context),
//         child: CuDatePicker(),
//       );
//     },
//   );
// }

// class CuDatePicker extends StatelessWidget {
//   const CuDatePicker({
//     super.key,
//     this.onDateChange,
//   });

//   final Function(DateTime date)? onDateChange;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(maxWidth: 400.0),
//       child: CupertinoDatePicker(
//         minimumYear: 1900,
//         maximumYear: 2600,
//         initialDateTime: DateTime.now(),
//         mode: CupertinoDatePickerMode.date,
//         onDateTimeChanged: onDateChange ?? (DateTime date) {},
//       ),
//     );
//   }
// }
