import 'package:flutter/material.dart';
import 'package:hod_makemypicture/src/utils/constants.dart';
import 'package:hod_makemypicture/src/utils/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  Constants.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      onGenerateTitle:
          (BuildContext context) => AppLocalizations.of(context)!.title,
      themeMode: ThemeMode.system,
      supportedLocales: const [Locale('en', '')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
