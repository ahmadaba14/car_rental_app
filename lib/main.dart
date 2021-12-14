import 'package:car_rental_app/screen/login_screen.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [Locale('en', 'US')],
      localizationsDelegates: [
        CountryLocalizations.delegate,
      ],
      title: 'Local Sign In Page',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'images/SplashScreen.png',
        ),
        nextScreen: LoginScreen(),
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
