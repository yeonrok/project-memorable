import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/src/view/user/user_birth_view.dart';
import 'package:project_memorable/theme/component/button/button.dart';
import 'package:project_memorable/util/lang/generated/l10n.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: context.color.surface,
      appBar: AppBar(
        //backgroundColor: Colors.amber,
        toolbarHeight: 60,
        //title: Text(S.current.shopping),
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
                    builder: (context) => const UserBirthView(),
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
              top: 10.0, right: 20.0, left: 20.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                S.current.userProfileImage,
                style: context.typo.headline2.copyWith(
                  color: context.color.text,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                S.current.uploadProfileImage,
                style: context.typo.subtitle1
                    .copyWith(color: context.color.subtext),
                //style: context.watch<ThemeService>().theme.typo.subtitle1,
              ),
              SizedBox(
                height: 60,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child:
                        // DottedBorder(
                        //   dashPattern: [20, 4],
                        //   borderType: BorderType.Circle,
                        //   strokeWidth: 2,
                        //   color: context.color.primary,
                        // child:
                        Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                        color: context.color.inactiveContainer,
                        shape: BoxShape.circle,
                      ),
                    ),
                    // ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child:
                  Positioned(
                    bottom: 0,
                    right: 80,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: context.color.primary.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: context.color.onPrimary),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: context.color.onPrimary,
                        //color: context.color.primary.withOpacity(0.5),
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
              // InputField(
              //   label: S.current.userName,
              //   hint: S.current.userName,
              //   //error: '2~12자로 입력해주세요.',
              //   error: S.current.characterLimit(2, 12),
              //   maxLength: 12,
              //   // error: S.current.textFieldContraints(2, 12),
              //   //error: S.current.textFieldminLength('', 2),
              // ),

              Spacer(),
              Button(
                // type: ButtonType.fill,
                text: S.current.register,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const UserBirthView(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
