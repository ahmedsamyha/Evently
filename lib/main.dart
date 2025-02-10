import 'package:easy_localization/easy_localization.dart';
import 'package:evently/utility/theme_data/app_theme.dart';
import 'package:evently/view/splash/splash_view.dart';
import 'package:evently/view_model/my_provider.dart';
import 'package:evently/view_model/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        saveLocale: true,
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
    var myProvider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode: myProvider.themeMode, // Pass the themeMode from provider
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      home: SplashView(),
    );
  }
}
