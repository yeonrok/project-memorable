import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:project_memorable/src/service/auth/backend/authenticator.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/src/view/user/user_name_view.dart';
import 'package:project_memorable/theme/component/button/button.dart';
import 'package:project_memorable/theme/component/emoji_bubble.dart';
import 'package:project_memorable/theme/res/palette.dart';
import 'package:project_memorable/util/lang/generated/l10n.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    builder: (context) => const UserNameView(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    S.current.signInMsg,
                    style: context.typo.headline2.copyWith(
                      color: context.color.text,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? const SizedBox()
                    : const PatternBackgroundWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                ButtonArea(),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> logout() async {
    try {
      await UserApi.instance.logout();
      print('로그아웃 성공, SDK에서 토큰 삭제');
    } catch (error) {
      print('로그아웃 실패, SDK에서 토큰 삭제 $error');
    }
  }
}

class ButtonArea extends StatelessWidget {
  const ButtonArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Button(
            width: double.infinity,
            icon: 'kakao',
            backgroundColor: const Color(0xffFEE500),
            color: const Color(0xff333333),
            onPressed: () {
              signInWithKakao();
            },
            text: '카카오로 계속하기',
          ),
          const SizedBox(
            height: 10,
          ),
          Button(
            width: double.infinity,
            icon: 'google',
            backgroundColor: const Color(0xff131314),
            //backgroundColor: const Color(0xffF2F2F2),
            //color: Colors.black,
            onPressed: () {
              final result = Authenticator().loginWithGoogle();
              result.log();
            },
            text: '구글로 계속하기',
          ),
          const SizedBox(
            height: 10,
          ),
          Button(
            type: ButtonType.outline,
            width: double.infinity,
            icon: 'apple',
            backgroundColor: Colors.white,
            borderColor: Colors.black,
            color: Colors.black,
            onPressed: () {},
            text: 'Apple로 계속하기',
          ),
        ],
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
            child: EmojiBubble(color: Palette.aeroBlue, icon: 'dog'),
          ),
          Positioned(
            top: 40,
            left: MediaQuery.of(context).size.width / 3,
            child: EmojiBubble(color: Palette.carrara, icon: 'partying_face'),
          ),
          Positioned(
            bottom: 60,
            left: MediaQuery.of(context).size.width / 8,
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

Future<void> signInWithKakao() async {
// 카카오톡 실행 가능 여부 확인
// 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk().then((value) {
        print('value from kakao $value');
        // navigateToMainPage(context);
      });
      print('카카오톡으로 로그인 성공');
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      await UserApi.instance.loginWithKakaoAccount();
      print('카카오계정으로 로그인 성공');
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}
