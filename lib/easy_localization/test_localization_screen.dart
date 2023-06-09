import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TestLocalizationScreen extends StatelessWidget {
  const TestLocalizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test_screen').tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('hello').tr(),
            ElevatedButton(
              onPressed: () {
                String newLocale =
                    Localizations.localeOf(context).languageCode == 'en'
                        ? 'ar'
                        : 'en';
                EasyLocalization.of(context)?.setLocale(Locale(newLocale)).then((value) {
                  preferences.setString('lang', newLocale);
                });
              },
              child: const Text('click').tr(),
            ),
          ],
        ),
      ),
    );
  }
}
