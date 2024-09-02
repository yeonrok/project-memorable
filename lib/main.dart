import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:project_memorable/src/service/lang_service.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/src/view/landing/landing_view.dart';
import 'package:project_memorable/src/view/signup/sign_up_view.dart';
import 'package:project_memorable/src/view/user/user_birth_view.dart';
import 'package:project_memorable/src/view/user/user_name_view.dart';
import 'package:project_memorable/src/view/user/user_profile_view.dart';
import 'package:project_memorable/theme/res/palette.dart';
import 'package:project_memorable/util/lang/generated/l10n.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'e916a4b1a8556021d424497c72a0e2b2',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
        ChangeNotifierProvider(
          create: (context) => LangService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: context.watch<LangService>().locale,
      theme: context.themeService.themeData,
      // theme: ThemeData(
      //   //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   // colorScheme: ColorScheme(
      //   //   brightness: Brightness.light,
      //   //   primary: Palette.crimson,
      //   //   onPrimary: Palette.white,
      //   //   secondary: Palette.tangerine,
      //   //   onSecondary: Palette.white,
      //   //   error: Colors.red,
      //   //   onError: Palette.white,
      //   //   surface: Palette.white,
      //   //   onSurface: Palette.grey800,
      //   // ),
      //   textSelectionTheme: TextSelectionThemeData(
      //     selectionColor: context.color.primary,
      //     cursorColor: context.color.primary,
      //     selectionHandleColor: context.color.primary,
      //   ),
      //   fontFamily: 'pretendard',
      //   useMaterial3: true,
      // ),
      //home: UserBirthView(),
      home: LandingView(),
    );
  }
}
