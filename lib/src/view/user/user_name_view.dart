import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/src/view/user/user_profile_view.dart';
import 'package:project_memorable/theme/component/button/button.dart';
import 'package:project_memorable/theme/component/input_field.dart';
import 'package:project_memorable/util/lang/generated/l10n.dart';

class UserNameView extends StatelessWidget {
  const UserNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    focusNode.hasFocus ? print('hasFocus') : print('has not focus');
    return Scaffold(
      //backgroundColor: context.color.surface,
      appBar: AppBar(
        //backgroundColor: Colors.amber,
        toolbarHeight: 60,
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
                    builder: (context) => const UserProfileView(),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                right: 20.0,
                left: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    S.current.userName,
                    style: context.typo.headline2.copyWith(
                      color: context.color.text,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    S.current.enterUserName,
                    style: context.typo.subtitle1
                        .copyWith(color: context.color.subtext),
                    //style: context.watch<ThemeService>().theme.typo.subtitle1,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  InputField(
                    label: S.current.userName,
                    hint: S.current.userName,
                    focusNode: focusNode,
                    //error: '2~12자로 입력해주세요.',
                    error: S.current.characterLimit(2, 12),
                    maxLength: 12,
                    // error: S.current.textFieldContraints(2, 12),
                    //error: S.current.textFieldminLength('', 2),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Button(
                // type: ButtonType.fill,
                text: S.current.register,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const UserProfileView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
