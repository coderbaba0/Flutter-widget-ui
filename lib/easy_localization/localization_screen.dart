import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_source/easy_localization/test_localization_screen.dart';

import '../main.dart';

class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home_screen').tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('hello').tr(),
            ElevatedButton(
              onPressed: () {
                String newLocale =
                    Localizations.localeOf(context).languageCode == 'en'
                        ? 'ar'
                        : 'en';
                EasyLocalization.of(context)
                    ?.setLocale(Locale(newLocale))
                    .then((value) {
                  preferences.setString('lang', newLocale);
                });
              },
              child: const Text('click').tr(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TestLocalizationScreen(),
                  ),
                );
              },
              child: const Text('go_to_test').tr(),
            ),
          ],
        ),
      ),
    );
  }
}
