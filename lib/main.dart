import 'package:easy_localization/easy_localization.dart';
import 'package:evently/utility/theme_data/app_theme.dart';
import 'package:evently/view/splash/splash_view.dart';
import 'package:evently/view_model/my_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: const EventlyApp(),
      ),
    ),
  );
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode, // Pass the themeMode from provider
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          home: SplashView(),
        );
      },
    );
  }
}
