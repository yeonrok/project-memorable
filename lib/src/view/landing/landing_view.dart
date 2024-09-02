import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/src/view/signup/sign_up_view.dart';
import 'package:project_memorable/theme/component/button/button.dart';
import 'package:project_memorable/theme/component/emoji_bubble.dart';
import 'package:project_memorable/theme/res/palette.dart';
import 'package:project_memorable/util/lang/generated/l10n.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '오래도록 기억되는\n우리만의 기억공간',
                      // S.current.signInMsg,
                      style: context.typo.headline2.copyWith(
                        color: context.color.text,
                        fontWeight: context.typo.medium,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      '메모러블',
                      // S.current.signInMsg,
                      style: context.typo.headline1.copyWith(
                        color: context.color.primary,
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
              SizedBox(
                height: 80,
              ),
              // MediaQuery.of(context).orientation == Orientation.landscape
              //     ? SizedBox(
              //         height: 80,
              //       )
              //     : SizedBox(),
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? const SizedBox()
                  : const PatternBackgroundWidget(),
              // MediaQuery.of(context).orientation == Orientation.landscape
              //     ? SizedBox(
              //         height: 160,
              //       )
              //     : SizedBox(),
              SizedBox(
                height: 160,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Button(
                  // type: ButtonType.fill,
                  //text: S.current.register,
                  text: '로그인 및 가입하기',
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SignUpView(),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class PatternBackgroundWidget extends StatelessWidget {
  const PatternBackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: -15,
            child: EmojiBubble(color: Palette.aeroBlue, icon: 'dog'),
          ),
          Positioned(
            top: 40,
            left: MediaQuery.of(context).size.width / 3,
            child: EmojiBubble(color: Palette.carrara, icon: 'partying_face'),
          ),
          Positioned(
            bottom: 60,
            left: 50,
            child: EmojiBubble(color: Palette.hummingBird, icon: 'smiley_cat'),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2,
            child: EmojiBubble(color: Palette.oysterBay, icon: 'heart'),
          ),
          Positioned(
            top: 0,
            right: MediaQuery.of(context).size.width / 30,
            child: EmojiBubble(color: Palette.titanWhite, icon: 'heart_eyes'),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 10,
            right: -36,
            child: EmojiBubble(color: Palette.bizarre, icon: 'relaxed'),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 9,
            left: 40,
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Palette.purple74),
            ),
          ),
          Positioned(
            top: 5,
            left: MediaQuery.of(context).size.width / 2 + 30,
            child: Container(
              width: 9,
              height: 9,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Palette.mint),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            right: MediaQuery.of(context).size.height / 10,
            child: Container(
              width: 9,
              height: 9,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Palette.plum),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 18,
            right: MediaQuery.of(context).size.height / 16,
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.purple79,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
