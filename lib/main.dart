import 'package:bitconvert/screens/price_screen.dart';
import 'package:bitconvert/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import './screens/price_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bitconverter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.lightGreen,
          ),
          textTheme: const TextTheme(
              bodyText2: TextStyle(
                  fontFamily: 'Monserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: ((context) => WelcomeScreen()),
          PriceScreen.id: ((context) => PriceScreen()),
        });
  }
}
